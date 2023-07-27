---
layout: post
title: Anyone Can Program (?)
---

As an undergraduate, someone in my dorm building came to me asking for help for an introductory computer science class I had taken the year before. I had cruised through the class and learned a lot, so I was eager to help out. As I watched her work through the problems, however, I was at a complete loss. I wanted to help her learn, not just do the assignment for her or tell her what keys to type, but she just didn't seem to *get* it. When something went wrong, she seemed to be making changes at random, hoping they'd fix it with no apparent understanding of what was wrong in the first place. The concepts I had explained moments before seemed to go in one ear and out the other. Eventually, I found an excuse to leave and ran off, because I could tell that if I didn't bail out I'd just end up doing the whole assignment and she wouldn't have learned a thing.

That moment stuck with me, and it came up again in graduate school when I took a course on teaching in higher education and we were asked to think back to moments where we had had teaching-related difficulties. I was embarrassed at my past inability to help her, and if I was going to be helping teach students as a part of my assistanceship, I couldn't just leave students like that hanging like I did before.

It did bring up the question, though: are there people who just *can't* pick up the skills? I know I'll never be an Olympic gymnast, I've never had any flexibility whatsoever, but does it require a particular type of brain to code? Naturally, the question [has been asked and debated many times](https://softwareengineering.stackexchange.com/questions/163631/has-not-everyone-can-be-a-programmer-been-studied), but spoiler alert: the real pro move in situations like this is to go further and question the entire premise. What does it even mean to program, and does it even make sense to divide people into "can code" and "cannot code"?

## An Army of Prometheuses (Prometheses? Promethesi?)

In the olden days, computers were kept behind the walled garden of large corporations and academia, with only a few trusted acolytes, [punch cards in hand](http://www.columbia.edu/cu/computinghistory/fisk.pdf), allowed onto the floor where they kept *the* computer. ["The Mother of All Demos"](https://en.wikipedia.org/wiki/The_Mother_of_All_Demos), as it came to be known, presented a radically different and shockingly prescient vision of what computing could be all the way back in 1968: windows, a pointer controlled by a mouse, links, and even remotely editing a document together with someone *while on a video call with them*, but it was so ahead of its time that it took decades for the rest of the world to make these things a practical reality. 

As computers got smaller and more accessible, more effort was put into bringing the fire down from the mountaintop, easing the learning curve, and making them more broadly useful. [BASIC](https://en.wikipedia.org/wiki/BASIC) was created with the explicit goal of enabling any student to use a computer without having to struggle with terse, unintuitive commands. [VisiCalc](https://en.wikipedia.org/wiki/VisiCalc) for the Apple II made the tedious effort of filling out a numerical spreadsheet happen instantaneously, with no chance of simple arithmetic errors, using a layout that accountants were already familiar with. The graphical user interface spent valuable memory and processor cycles to present users with a more understandable metaphor for computing than the opaque incantations of the command line. Apple pushed the effort further with [HyperCard](https://en.wikipedia.org/wiki/HyperCard) and its associated language [HyperTalk](https://en.wikipedia.org/wiki/HyperTalk), which was designed to do real, honest-to-goodness programming while also feeling like natural language:

```applescript
  function replaceStr pattern,newStr,inStr
    repeat while pattern is in inStr
      put offset(pattern,inStr) into pos
      put newStr into character pos to (pos +the length of pattern)-1 of inStr
    end repeat
    return inStr
  end replaceStr
```

Today, "low code" and "no code" platforms are among the latest efforts to, if not eliminate the programmer entirely and let a non-technical person build a tool for themselves, at least give the programmer tools to quickly whip something together without having to do a bunch of busy work first. The humble Excel spreadsheet continues to be, [for better or for worse](https://thedailywtf.com/articles/The-Great-Excel-Spreadsheet), pressed in to service where it may not be the best tool for the job solely because of how accessible it is. Every iPhone comes pre-loaded with a surprisingly powerful automation tool, [Shortcuts](https://support.apple.com/guide/shortcuts/welcome/ios), that allows users to assemble scripts out of drag-and-drop blocks and run them on demand or automatically in response to events. And the sudden and rapid rise of large language models like [ChatGPT](https://openai.com/chatgpt) and [GitHub Copilot](https://github.com/features/copilot/), capable of creating... well, something that at least *looks* like the right code from just a few unstructured sentences, is one of the first things to cause programmers to seriously consider whether their career is about to be automated away entirely, an [ironic twist](https://thedailywtf.com/articles/A-Repetitive-Task) of fate that, well, [maybe we deserve](https://thedailywtf.com/articles/The-Indexer) if it ever comes to pass. (Of course, to get any AI to write a program for you, you'll first have to clearly and unambiguously explain what it is you need, and as someone who has looked at a lot of software requirement documents... [good luck](https://www.smart-jokes.org/how-it-projects-really-work.html).)

## Oh, you like programming? Name every algorithm

![A meme where one person says, crying with rage, "No, HTML is not a real programming language, you're just using tags. There are no algorithms, no classes, you're just putting elements on a screen. You'll never be a real programmer unless you learn 20 different ways to sort an array, Do you even know what an array is? Web developing is disgusting." The other person, with a sort of dim smile on his face, replies "Haha HTML goes br br br br br br br br br br br" with HTML break tags.](/images/htmlgobr.jpg)


The era of computing has reached a point where it's not at all unusual for even the least tech-savvy person to carry around a few computers as they go about their normal life. Access to the global network of computers is [often considered a human right](https://en.wikipedia.org/wiki/Right_to_Internet_access). Short of strapping one to everyone's face[,](https://knowyourmeme.com/photos/2600959-apple-vision-pro) it's hard to imagine how computing could become more ubiquitous or accessible, and it certainly has never been more important, and yet as of 2023, there are still some people in the world who aren't programmers <sup>[citation needed]</sup>. In fact, one must assume that there are more people who struggle to get their email to work right or print a document than know how to automate something tedious in their lives. So did we fail despite all that effort? Should the joke two headings ago have been about Sisyphus instead of Prometheus?

When considering accessibility in the typical sense, for people with things like vision or hearing impairments, it's useful to reframe issues from individual to systemic: it's not that "this person can't do this thing and we need to help them fix *their* problem," the problem is that that *we* have collectively erected a barrier and the right thing to do is remove it if possible. This encourages bigger, more complete thinking, and is likely to solve problems for a broader group of people. When it comes to software, a lot of the problems people have with it are not their fault at all, they're due to the fact that, in many ways, [our entire field is bad at what we do](https://xkcd.com/2030/) when compared to, say, the "real" engineers that can [mostly](https://wtyppod.podbean.com) reliably build and maintain a bridge that does its job without requiring a reboot every few months to get it working again. But even in an idealized world of bug-free software, it's hard to imagine all of our friends and family being enabled to write a program to solve a problem with the powerful computer they carry around all day using the tools we currently provide them.

That may be overstating the actual problem, though. Programming is a useful and lucrative skill, but it's not necessary to get lots of other useful things done using a computer. And it's also not a binary, no pun intended. There are degrees that people can choose to rise or fall to as they wish and as the situation warrants. Early on, getting a computer to do anything required knowing the exact series of electrical impulses to send over wires to get the behavior you wanted. Then one merely needed to know the names and functions of programs available on a command line and how to chain them together. Later, just knowing what files and folders were, and how to open them in the right program to edit them would get you most of the way there. Today, kids are making it [all the way to college without needing to learn what a file is](https://www.theverge.com/22684730/students-file-folder-directory-structure-education-gen-z) because modern computing platforms have abstracted the idea away in favor of something simpler and easier to use.

Along the way, regular people have found ways to make computers work for them as they became accessible to their skill level. It [wasn't always pretty](https://thedailywtf.com/articles/Poke-a-Dot), there has been plenty of magical thinking and cargo culting without the solid grasp of the fundamentals that a formal education might establish, but the tools are often there and people make do. In the wild frontier of the early web, amateur webmasters were copy-pasting HTML to cobble together their own site [just the way they wanted it](https://www.cameronsworld.net), and though HTML isn't a programming language... isn't it kind of a programming language? Issuing structured instructions to a computer to get it to do what you want? The open nature of the source of a webpage and the straightforward markup lowered the accessibility bar to the point that lots of people were able to publish [whatever they wanted](https://www.youtube.com/watch?v=AYsMPiQNixU0) to the world, all without ever inverting a binary tree on a whiteboard. 

Maybe our job isn't to make everyone a programmer, but to meet them where they are and help them do what they want to do. After all, I'd roll my eyes at a blog post by a mechanic bemoaning how people can't change their brake pads anymore — I'm sure I *could* figure it out, eventually, but I have no interest in learning that skill to the point where I could put my safety on the line, I'd rather have an expert do it, and that's fine too. As long as it gets done, I will have the accessibility that I ask my car to provide to me.

## Domain-specific languages: a meeting of the minds

It's a great thing to create a cool, easy-to-use tool, give it to the world, and say "Go forth and create things, my common people!" but sometimes those of us who are building the software have the opportunity to create something more specialized. While not every problem can be [solved by throwing a smart programmer at it](https://xkcd.com/1831/), sometimes the people who know computer stuff and the people who know other stuff can work together to do some cool stuff with the stuff they all know.

Traditionally, this has been accomplished by a defined software development process, which usually looks something like "the software people grill the experts on what is needed, then go off and write some code, the experts try it and give feedback, repeat until it's good."[^agile] One problem that comes up is that [it's hard to know what is easy and what is hard](https://xkcd.com/1425/) in programming[^birds], resulting in frustration when someone says "just make a button that does X!" Another is that, as mentioned before, software requirements are *hard*. The moment we're having in machine learning right now is the first time we've ever been able to tell a computer "uh, here's some examples of what we want, figure it out" and get anything decent out, but we're still in the very early days of that. For everything else, every single vague idea must get clarified into something specific, and if it doesn't get done intentionally, it'll get done unintentionally as the programmer makes a guess, makes an assumption, or uses someone else's code and gets whatever that other person decided. 

And in that general process, note that the expert is in the loop, but only periodically. The domain expert is a critical part of building the software, since they're the ones who know what is right and what is wrong, but their expertise isn't in writing code, so we [filter their knowledge through others](https://www.youtube.com/watch?v=VayElJMD-lc) and hope that it makes it through into the code all in one piece. Seems inefficient and error-prone. But they can't write the code themselves, so if we want to fix this, we're back to the same problem again: **can the domain expert be taught to code?**

After all this setup[^wordswordswords], hopefully the solution seems obvious: if the code base currently requires the ability to code to contribute, instead of changing the person, could we remove or lower that barrier? Maybe the domain expert doesn't have to become a general software engineer for us to get them more tightly integrated if we put a bit of effort in to make the software development process itself *accessible and useful to them*. What does that look like? 

* They can do what they do best: provide important knowledge about the thing they're good at
* Once they get set up and learn the ropes, they can contribute without constantly needing help from others
* They can do their part of the process with a similar cadence as the programmers: write something, run, get feedback about problems, fix problems, repeat.

The hard parts of programming are that it requires detailed knowledge about a lot of abstract ideas and nested layers of systems, and you have to predict how everything will interact as you write very specific instructions that will be followed exactly as *written* and not *intended*. Programmers quickly get good at questioning all of their assumptions because they're reminded, repeatedly, in scary red letters, that what they thought was true is actually wrong, to the point where if something works on the first try they start getting very suspicious. That's *exhausting*, and it makes perfect sense that most people don't want to put themselves through that amount of constant frustration.[^fixme]

Let's spare the domain expert as much of that as we can. They don't need to know the whole system, or learn the intricacies of recursion or efficient loops or the software platform's long list of features. The ideal would be writing code in a language just for them, focused on their domain and the tasks they need to accomplish, and all the other stuff could be hidden away or delegated to someone else who can work on the details alongside the expert.

This is exactly where a domain-specific language can be an incredibly useful tool. DSLs are not general programming languages, so one might not be able to write a loop or function or call out to libraries, instead they are focused on a particular task and the details of what happens to the content written in the language are all behind the scenes in the implementation. HTML is a domain-specific language — it can't be used to write a program except by embedding JavaScript in it, but it does support features specific to the domain of creating a hyperlinked multimedia document, and all the details of rendering that document are implemented in web browsers. Regular expressions are another example, a very compact miniature language embedded within many tools and general programming languages, which are restricted to the domain of searching and manipulating text non-recursively. 

More modern programming languages have begun including features that enable the creation of domain-specific languages inside of the language as a whole. Rather than having to write an entire toolchain for parsing the DSL, translating it into some other form of code, and integrating it with the larger system, a DSL in this style is valid code in the language, it's just structured to look a particular way and hide the implementation details somewhere in a library where users of the language don't have to worry about it. My [previous blog post](http://biatek.com/2023/07/06/type-safe-builders-kotlin/) showed an example of this, an HTML DSL that looks like a purpose-built language but is actually "just" Kotlin code. 

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

There are a few useful advantages to such an approach as compared to creating an entire new language from scratch:

* There's already a compiler, toolchain, and access to create the implementation of the DSL
* There's already a tool for writing in the DSL that includes nice things like autocomplete, error highlighting, etc.
* The DSL is interoperable with the host language because it *is* the host language
* If more general programming tools are sometimes required, they're accessible (see above, where a Kotlin `for` loop is used within the DSL)
* The host language's type system is available to help create structure and flag errors

The approach does come with some caveats, however:

* It takes time and effort to make a good DSL, and it'll need to be good to be easy to use, so the cost and benefits need to be weighed
* The host language's rules still have to be followed; if it's a good fit this shouldn't be an issue but if the host language isn't flexible enough, the DSL might be weird or clunky
* It's still programming, debugging is still hard, and if you're bending the language in weird ways the error messages might be hard to understand without even more language design effort

When a DSL is a good fit, someone on the software engineering team can implement one using the general language that the tool is written in, with the collaboration of the domain expert to know what concepts and ideas are necessary to express. Once the language is going, the expert can start capturing ideas and writing real code, while the rest of the team uses the results of that language to implement the rest of the project. It can become a more collaborative and interactive effort, with the domain expert closer to the code and able to get a first-hand look at how the programmers are implementing their ideas, and the programmers explicitly creating an interface between "their stuff" and "the expert's stuff" which can clarify concepts and force the two sides to negotiate what is supposed to be happening instead of guessing or assuming. The domain expert may even be able to participate in the testing and debugging process. 

---

As an example, let's imagine an app for learning chess openings and history. Our chess grand master is in charge of writing these tutorials and articles, including interactive chess boards for the user to see for themselves and maybe even try some variations on the ideas. She's already fluent in algebraic notation for chess, so reading and writing things like this doesn't phase her one bit:

> 1.e4 c5 2.c3 d5 3.exd5 Qxd5 4.d4 Nf6 5.Nf3 Bg4 6.Be2 e6 7.h3 Bh5 8.0-0 Nc6 9.Be3 cxd4 10.cxd4 Bb4 11.a3 Ba5 12.Nc3 Qd6 13.Nb5 Qe7 14.Ne5 Bxe2 15.Qxe2 0-0 16.Rac1 Rac8 17.Bg5 Bb6 18.Bxf6 gxf6 19.Nc4 Rfd8 20.Nxb6 axb6 21.Rfd1 f5 22.Qe3 Qf6 23.d5 Rxd5 24.Rxd5 exd5 25.b3 Kh8 26.Qxb6 Rg8 27.Qc5 d4 28.Nd6 f4 29.Nxb7 Ne5 30.Qd5 f3 31.g3 Nd3 32.Rc7 Re8 33.Nd6 Re1+ 34.Kh2 Nxf2 35.Nxf7+ Kg7 36.Ng5+ Kh6 37.Rxh7+ 1–0 ([source](https://en.wikipedia.org/wiki/Deep_Blue_versus_Kasparov,_1996,_Game_1))

We want this app to be fancier than a blog post, with interactive features and integration into code for playing with the scenarios being described, so we want data like this to be usable in code, not just as text. We could try to write a parser for this notation, or have a programmer translate it by hand into code that looks something like

```kotlin
val kasparovDeepBlueGame1 = ChessGame()
kasparovDeepBlueGame1.add(Move(Square.e4))
kasparovDeepBlueGame1.add(Move(Square.c5))
kasparovDeepBlueGame1.addCommentary("For playing against Kasparov, the IBM team chose not to play the typical...")
kasparovDeepBlueGame1.add(Move(Square.c3))
```

... but this isn't ideal. A parser would do the trick, but that's a lot of work and then it still has to be integrated into the app's code. When a programmer does the translating, writing is being done twice, with a tedious translation process by someone who isn't the expert into a verbose, repetitive notation. The expert will have to do all the writing, wait for a new build, then try it herself as she's the only one likely to notice chess errors. She herself is clearly capable of writing in a formal notation, though, so a DSL that comes closer to what she needs and is already familiar with could enable her to do the writing and programming herself.

```kotlin
val kasparovDeepBlueGame1 = game {
    // 1.
    e4(); c5(); comment("For playing against Kasparov, the IBM team chose not to play the typical...");
    // 2.
    c3(); d5();
    // 3.
    d5(Rank.E, Note.X); d5(Piece.Q, Note.X); 
    ...
}
```

With some structure and guidance, the grand master could write and do some debugging for an entire tutorial on her own without having to go through an intermediary, while behind the scenes the software developers are doing some extra lifting to present this simpler interface to her:

```kotlin
@ChessNotation
class ChessGame {
    fun comment(text: String) : Unit = { ... }
    fun a1(piece: Piece? = null, rank: Rank? = null, vararg notes: Note) : Unit = { ... }
    fun a1(rank: Rank? = null, vararg notes: Note) : Unit = { ... }
    fun a1(piece: Piece? = null, vararg notes: Note) : Unit = { ... }

    fun a2(piece: Piece? = null, rank: Rank? = null, vararg notes: Note) : Unit = { ... }
    fun a2(rank: Rank? = null, vararg notes: Note) : Unit = { ... }
    // TODO: we either need a better way to do this, or just have the intern do the rest, ugh
}

fun game(init: ChessGame.() -> Unit) : ChessGame {
    val theGame = ChessGame()
    theGame.init()
    return theGame
}

```

It could also include some basic sanity checks to flag errors right away as she's testing, and it can use the language's type system to ensure that some errors get flagged by the compiler right in her development environment. She'll also have a much more direct idea of what the software is and is not capable of, and is better equipped to ask for new features when she has a brilliant idea while writing. She might even be able to write out an example of how she'd like it to be notated in the DSL, giving the language implementers a clear and concrete task instead of a vague description.

## The answer: Yes, if we lend a hand

It takes time, design effort, and thoughtful work to create a DSL that works well and is easy to use. That effort has to be balanced with the cost of taking time to make such a thing that could otherwise be spent banging it out in a less nice way. But in many scenarios, a DSL can make for a better process, and it can enable people to program that never saw themselves as [master hackers](https://www.youtube.com/watch?v=msX4oAXpvUE). It's not accessibility in the way we typically think of it, but by meeting people where they are and helping them to get more directly involved, we can increase the diversity of skills in the team and hopefully produce a better product faster as a result.

---

[^birds]: The absolute worst thing AI has done is make this excellent XKCD comic obsolete.
[^agile]: If you do this loop quickly enough you get to call it something fun like "scrum" or "agile" but if it's too slow, you have to call it "waterfall" instead, and no one likes waterfall.
[^wordswordswords]: Just so, so, so much setup. Sorry. At least most of the links are fun. Also, can you tell where I remembered that Markdown has support for footnotes?
[^fixme]: Further evidence that it's not the *domain experts* that need fixing in this scenario. 
