---
layout: post
title: Extending the type-safe builder pattern in Kotlin DSLs
---

Kotlin is a popular language for JVM-based development, and it's easy to see why: decades of work have gone into the Java ecosystem and libraries and Kotlin can interoperate with all of them, but as a younger language, Kotlin is able to avoid some of the clunkiness that Java is encumbered with, while adopting programming language concepts that have (re)gained popularity in the 21st century, like first-class functions, immutable types, and more careful handling of `null`.

One good example of Kotlin's flexibility is its support for creating limited domain-specific languages, all just by using features that Kotlin already has. [Kotlin's excellent documentation has a few chapters on this with an HTML example](https://kotlinlang.org/docs/type-safe-builders.html), but as I've worked on a similar structure for writing out an XML-based document format, some useful extensions to that example have emerged.

## Creating a simple builder DSL in Kotlin

This section will be a quick summary covering the same material as the above documentation, so if you're already familiar with type-safe object builders, feel free to skip to the next section to see the new ideas.

Kotlin builder DSLs use a few Kotlin language features together to create notation that is so minimal that it almost looks like a completely custom langauge:

```kotlin
var myHtml = 
    html {
        head {
            title { +"My super cool blog post" }
        }
        body { 
            h1 { +"My super cool blog post" }
            p { +"If you're anything like me, you think a lot about work, play, and dullness." }
            for (i in 0..100) {
                p { +"Jack's dull boy levels have reached $i." }
            }
        }
    }
}
```

The `for` loop looks like normal Kotlin, but [surely](https://youtu.be/ixljWVyPby0?t=57) Kotlin doesn't have first-class language support for HTML tag blocks like this. What's going on here?

The most important trick is that in Kotlin, lambda expressions that come last in the list of a function's arguments can be written *outside* the function call. Instead of writing

```kotlin
list.forEach( { foo -> foo.bar() } )
```

you can move the lambda code block outside of the function, and if there are no other arguments you can also omit the parentheses, and the result looks very similar to built-in language constructs like `for` and `while`:

```kotlin
list.forEach {
    foo -> foo.bar() 
}
```

The next trick is *function types with receiver*, which allow functions to be written as if they belong to a type without actually modifying that type, complete with support for referring to the object as `this`. This allows programmers to add functionality to objects without requiring the ability to modify the class directly:

```kotlin
// Anywhere this function is visible, it will be available for Strings as if it were built in
fun String.clapBack(): String {
    return this.split(" ").joinToString("👏").uppercase()
}

println("Hot dogs are not sandwiches and it's silly to argue about it".clapBack())

// HOT👏DOGS👏ARE👏NOT👏SANDWICHES👏AND👏IT'S👏SILLY👏TO👏ARGUE👏ABOUT👏IT
```

(Technically this is an extension function, which is not exactly the same thing as a lambda with a receiver type, but they are basically the same idea.)

Finally, the `+` in front of the strings in the HTML DSL is an operator override of `unaryPlus`, in this case being used to define a shorthand for adding the String literal to the object being constructed. A verbose but more intuitive way to do this would be to just have a normal function call or property assignment, like `title { this.content = "My super cool blog post" }`.

Now we can start to understand what's going on in the example above. Although the `html`, `head`, `title`, etc. blocks look a bit like static data, they are actually functions, with lambda expressions as their arguments. Each one is responsible for creating, building, and structuring an object, and since they are all functions, the type system of Kotlin can ensure that everything is structured correctly. As the Kotlin documentation points out, each of these functions are doing basically the same thing, just with different types of object, so a single generic version can be reused for all of them.

```kotlin
// Non-generic versions of the builder functions
fun head(init: Head.() -> Unit): Head {
    val head = Head()
    head.init()
    children.add(head)
    return head
}

fun body(init: Body.() -> Unit): Body {
    val body = Body()
    body.init()
    children.add(body)
    return body
}

// But doing it this way is less redundant

protected fun <T : Element> initTag(tag: T, init: T.() -> Unit): T {
    tag.init()
    children.add(tag)
    return tag
}

fun head(init: Head.() -> Unit) = initTag(Head(), init)

fun body(init: Body.() -> Unit) = initTag(Body(), init)
```

Each builder function handles all the work of creating the object, running the user-supplied lambda expression (inside of which the user can treat `this` as the object being created), putting the new object where it belongs, and returning the final result. When actually building the object, the only thing that needs to be specified is how each object is to be initialized, the rest is hidden away inside the implementation of the DSL.

## Keeping builder functions in one place

This pattern works to create the useful pseudo-language above, where a document can be laid out in a structured way but still get the benefit of type checking, as well as the ability to mix in Kotlin code like loops and custom functions. It's easy to use, easy to read, and easy to understand. But inside the library, the small code example in the documentation above has an organization issue. One abstract class looks like this:

```kotlin
abstract class BodyTag(name: String) : TagWithText(name) {
    fun b(init: B.() -> Unit) = initTag(B(), init)
    fun p(init: P.() -> Unit) = initTag(P(), init)
    fun h1(init: H1.() -> Unit) = initTag(H1(), init)
    fun a(href: String, init: A.() -> Unit) {
        val a = initTag(A(), init)
        a.href = href
    }
}
```

Naturally, all the body tag types extend this one, and that works well to put common functionality in one place. But this is actually a little too permissive — it allows constructing documents that probably should not work:

```kotlin
var wat = 
    html {
        body { 
            p {
                h1 { +"Don't headings usually go outside of paragraphs?" }
            }
        }
    }
```

With all the builder functions in one place, they are also *usable* everywhere, even when they shouldn't be. It would be nice if the DSL helped enforce more structure. We could break up the `BodyTag` class into "block" and "inline" variants in this particular case, but if our needs get more complex, issues will start to arise.

* Having these builder functions sprinkled in anywhere they need to be accessible, even if they're one-liners like most of these, is unnecessary code duplication. 
* The anchor tag `a href` builder has a useful customization where the address can be specified immediately, but if we want that anywhere an `a` tag is allowed, each version will need to have that same addition, and updating or changing it later will require keeping them all in sync... now that's really [starting to smell](http://xp.c2.com/CodeSmell.html). It's time to step back and rethink this a bit.

Ordinarily, how an object is constructed is a job for the *class*, not what's using the object. Normal constructors, of course, go in the class definition, and even if an object's creation is complex enough to use something like a factory pattern, it's going to be closely tied to the object in some way. Is there a way we can keep these builder functions in one place, but make them available everywhere they're allowed?

Well, yes, of course. This would be a very anticlimactic post otherwise. 

It isn't possible to import individual functions, but it is possible to put functions with default implementations into an interface and extend it in multiple places. The interface can even (usually) be nested inside the class itself to keep things very neat and tidy.


```kotlin
/**
 * This interface gives the various Builders access to functions they need.
 * The `Tag` class was modified slightly to add this interface, it already has the implementation.
 */
interface BuilderBase {
    fun <T : Element> initTag(tag: T, init: T.() -> Unit): T
}
// If some builders tend to be bundled together, another interface can collect them
interface ContainsInlineTags : BBuilder, ABuilder
interface ContainsBlockTags : P.Builder, H1.Builder

// These interfaces will pull in the builder functions, and since they have default implementations
// that any Tag is already able to use, all that's needed is to extend them.
class Body : TagWithText("body"), ContainsBlockTags, ContainsInlineTags

// A Tag with its builder function interface embedded in the class.
class P : TagWithText("p"), ContainsInlineTags {
    interface Builder : BuilderBase {
        fun p(init: P.() -> Unit) = initTag(P(), init)
    }
}
class H1 : TagWithText("h1"), ContainsInlineTags {
    interface Builder : BuilderBase {
        fun h1(init: H1.() -> Unit) = initTag(H1(), init)
    }
}

// Unfortunately, embedding the interface gets trickier when tags are more recursive. Doing it as
// above results in an inheritance cycle. If you've got an approach that gets around this, I'd love
// to hear about it.

interface BBuilder : BuilderBase {
    fun b(init: B.() -> Unit) = initTag(B(), init)
}
class B : TagWithText("b"), ContainsInlineTags

interface ABuilder : BuilderBase {
    fun a(href: String, init: A.() -> Unit) {
        val a = initTag(A(), init)
        a.href = href
    }
}
class A : TagWithText("a"), ContainsInlineTags {
    var href: String
        get() = attributes["href"]!!
        set(value) {
            attributes["href"] = value
        }
}
```

By keeping builder functions in one place, users of the DSL will have a more consistent experience, it becomes very easy to put builders only where they make sense, and developers will be able to make changes more easily. In addition, this approach is optional for every class involved, and if a different style of builder is warranted in one place, it can be implemented and the default version from the class can be ignored.


