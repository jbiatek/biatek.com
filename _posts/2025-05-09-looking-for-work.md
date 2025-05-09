---
title: Looking for Work
---

Unfortunately, my role at my current company is being eliminated, so I am looking for new employment. Here's a little bit about me and what I do.

I'm Jason Biatek, a software engineer with a master's in computer science. I have a history in academia/research (see my publications on the [About page of this blog](/about/)), but more recently have been doing more with customer service engagements and product-focused projects. You can reach me at [my personal email](mailto:jason@biatek.net) or on [LinkedIn](https://www.linkedin.com/in/jason-biatek/).

I'm a well-rounded software engineer, familiar with various software development practices, tools, and concepts. I've had success getting on board with large, legacy code bases as well as starting from a clean slate. I enjoy refactoring and improving code, even if I didn't write it, and try to prioritize doing things "the right way" while also remaining practical and getting things done. Computers and tech are both my profession and my hobby, so I tend to stay pretty up-to-date even in areas I'm not working on specifically. I strive to be kind and compassionate in all areas of my life and treat every person with respect and dignity.

I have a few particular interests and specialties that make me stand out:
- **Programming languages**: I love learning new languages, and I especially like learning how they work. Most of my professional projects have involved parsing, implementing, analyzing, and troubleshooting formal languages, and I love that kind of work in particular.
- **Domain-specific languages**: I [wrote about the benefits of DSLs a few years ago](/2023/07/27/anyone-can-program/), the tl;dr is that if you're doing a lot of technical writing in a very constrained way with strict rules about the "right" way to phrase things, or are using a specialty notation, you might get a lot of benefit out of defining a language and model for the work you are doing rather than doing it in a Word document. This is also closely related to the **model-driven development** approach that is becoming more popular. A custom-built tool doesn't have to be hard to make, can have a shared understanding of the relevant concepts with its users, can do error checking, and if you're writing something that eventually becomes code, may even be able to generate the code *for* you, with greater consistency than an engineer doing it manually. Definitely reach out if that rang a bell for you.
- **Data parsing, translation, and transformation**: Extracting data from one format and converting it to another, whether it's a one-off task or an ongoing service, is something I have done many times. It requires thorough consideration of possible inputs, testing for robustness and correctness, and a solid understanding of both the input and output formats. And if you'd like to have a round-trip conversion that preserves all data in both directions, that introduces still more considerations which I have experience dealing with.
- **Formal methods and safety-critical systems**: My research career was in these areas and they still hold a lot of interest for me. I have experience in model checking and test-case generation with SMT solvers, writing software requirements in sufficient detail for safety-critical work, and a general healthy skepticism for processes that don't put in the work to get things right when lives are on the line.
- **Education and teaching**: I have done a lot of tutoring and teacher assistanceships, and I like to think I'm good at breaking down ideas and helping others to learn them. Concepts in software are often very abstract and can be hard to understand without a lot of background, so communicating ideas to laypeople in a way that is both understandable and not an overwhelming information dump can be a tricky balance.

But really, I'm confident in my ability to learn and get useful at just about anything in the software engineering realm, even if I haven't worked on it professionally yet. It's one of the few areas in life where I don't feel particularly humble; I'm good at what I do and I like doing it.

## Personal

Much of my web experience comes from personal projects rather than professional ones, strangely, it's just kind of how my career has happened to go. In one particular corner of the internet, I'm known for my [copious cataloging of a very silly Apple prediction game](https://rickies.net/) on a fantastic podcast, [Connected](https://www.relay.fm/connected). That database of statistics, nonsense, and passion is implemented in a very fun and *deeply weird* tool called [TiddlyWiki](https://tiddlywiki.com/), which pretends to be a weird little single-file wiki system but is actually a minimal but powerful self-contained web app platform that they have *used* to make a weird little single-file wiki system. If you know what you're doing, you can do some pretty incredible things with it. I've also used TiddlyWiki to make a [Super Bowl prediction game](https://github.com/jbiatek/propbets) that I run for my friends every year, and I was even doing my task management in a private TiddlyWiki, complete with categories, start dates, due dates, and personal calendar integration. If I had known about it when I was into Battlestar Galactica (the board game) enough to [write my own comprehensive and dynamic rulebook for all the various expansions](https://github.com/jbiatek/BSGRulebook) that would've probably been a TiddlyWiki too.

In addition, I run my own personal media server and some web services on it for myself, running a web server the "old fashioned way" although I do turn to Docker sometimes when it's warranted, and I've dabbled in some web scraping and data preservation for [some of the things I care about](https://github.com/jbiatek/AskMeAnotherCompleteFeed).

## Specific projects

Here are some projects that I have been deeply involved with to give a more concrete idea of my skills.

### A DSL for a data format in Kotlin

Kotlin is a *very* interesting language, which I hadn't used until a few years ago. It's primarily built on the Java Virtual Machine platform and is common especially in Android development. I was tasked with implementing a [type-safe builder](https://kotlinlang.org/docs/type-safe-builders.html) in Kotlin for a file conversion project. This is a particular style of DSL which allows creating a pseudo-language within Kotlin that compiles as Kotlin code but looks and acts as if the language has incredible first-class support for things that it really doesn't. I [wrote about this a few years ago](/2023/07/06/type-safe-builders-kotlin/) and it's still one of my favorite projects that I've worked on. 

The data format in question is fairly straightforward XML, which of course the Java/Kotlin ecosystem supports thoroughly, but by implementing it in a DSL, I essentially created a document templating language for our company's specific format, with type checking, autocomplete, and even some support for the semantics of the document, not just the structure. Using it looks something like this:

```kotlin
val artifacts; // Incoming data has been pre-parsed already
val document = rootNodes {
    threatsCatalog {
        // Mixing and matching between DSL and normal Kotlin forEach loops
        artifacts.filter { it.type == THREAT_CLASS }.forEach { threatArtifact -> 
            catalog.add(ThreatClass()) { tc ->
                tc.name = threatArtifact["name"]
                tc.title = threatArtifact["title"]
                // continue building the object, maybe dive into other artifacts, etc.
            }
        }
    }
}
```

Doing it in a DSL and not just a generic XML library means that the Kotlin compiler is providing structure and error checking about the output format, and the IDE is able to provide in-line documentation and autocomplete, ensuring many errors are corrected before the code even runs. While working on this project, I had to consider not just getting the thing to work, but also the experience of using it. A DSL like this has a tendency to "bend" the language in ways that aren't always intuitive, and there were a few cases where I discovered that while something did *work*, it was clunky, unintuitive, misleading, or hard for the IDE to present to the user clearly.

In addition to creating the DSL for this data converter, I also worked on enabling a "round trip" conversion in both directions between this native format and an Excel representation. This was originally a single direction, intended to help new customers bring their data to our threat and risk assessment tool, but I expanded it to also convert from native back to Excel. This required a lot of work to preserve important identifiers in a way that was both robust and didn't get in the way for a human looking at the data in Excel.

### Formal Software Requirement Specification and Analysis

Honeywell has developed a language called CLEAR for writing software requirements, as well a tool called Text2Test for analysis of requirements written in that language. CLEAR reads like a natural language specification, but is specified by a grammar and semantics which make it possible for software to parse and understand. Text2Test was built on top of HiLiTE, an internal tool at Honeywell used for requirements-based verification written in C#. It takes CLEAR requirements and translates them into the existing structures that HiLiTE uses, which enables analysis and automatic test generation.

For example, if one were writing software for a microwave, one requirement may say something like `When COOK_TIME > 0, the magnetron shall be ACTIVE` while another says `When DOOR_STATUS is OPEN, the magnetron shall be INACTIVE`. Both entirely reasonable on their own, but these actually contradict one another in the case where a person opens the door while the oven is active. Text2Test is capable of detecting this contradiction and raising a warning about it.

I was initially hired as an intern to work on this tool, and was hired full-time afterward. I worked on finding and fixing bugs in Text2Test, as well as adding new features. Typically, this included modifications to the grammar for parsing CLEAR and code to implement the semantics of the new grammar. I needed to quickly get up to speed on a large existing codebase, and work within that codebase to add new features as well as find and fix bugs that came up during development. I also worked on a text editor for CLEAR, implemented as an Eclipse plug-in built with Xtext.

In addition to this more direct coding work, I also was involved in the bigger picture of finishing the language specification of CLEAR, putting forward my thoughts on how best to make the language unambiguous and easy to use. While our team spent a lot of time thinking about requirements, ambiguity, and the intuitive versus technical meanings of words, our users wanted to get their requirements done and get to the other things as well, so we were always listening, learning, and considering their needs when trying to create a tool that was as useful as possible to them.

### TPlex, program analysis project

I worked on automated test case generation for PLEXIL, a planning language created by NASA.  Automatic test case generation using SMT solvers is a well-known technique for automatically creating test inputs that satisfy a given property, but PLEXIL plans are intended for use in an autonomous system. As such, PLEXIL plans often require long test cases to achieve code coverage, because the system needs to make sure that both itself and the environment are in an expected state before proceeding. Since SMT solvers require exponentially more time as the length of a test case increases, the straightforward approach is not sufficient.

I wrote [a translator to convert PLEXIL plans](https://github.com/jbiatek/TPlex) into Lustre, which is a modeling language used by the model checker JKind. The tool had to read in plans, represent them in an abstract syntax tree, convert them into an intermediate representation, perform compiler optimizations like constant propagation, pruning built-in variables that were unused, dead code removal, and finally convert the itermediate representation into its target language.

With this tool, we could automatically generate tests for PLEXIL plans, but scalability quickly became a limiting factor. I worked on using incremental test case generation, working toward an overall goal one achievable segment at a time. With this technique, it is critical that each segment makes progress toward the goal. I hoped to show that knowledge of the plan and the semantics of the language could be used to guide the search for a particular test case.
