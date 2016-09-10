# Basic Tools

## First things first

To successfully work through this course, you need to do the following things:

* install Java
* install a sane editor: Light Table, Vim or Emacs
* install Git
* install Leiningen
* make sure to have a github account
* read very carefully the submission instructions

## Java

Clojure runs on JVM, so you need to have the Java JDK installed. On Linux this is easily done using the distribution’s package manager.

On Windows you need to download the latest JDK from Oracle’s site and install it. You also need to add the JDK bin directory to the Path. Right click Computer, select Properties, select Advanced system settings, select Environment Variables and Edit the Path to contain the bin directory of the JDK installation usually found under Program Files. Don’t hesitate to ask if you encounter any problems.

## Your very own butler

**Leiningen** is a project management tool for Clojure projects. It handles various tasks related to projects, including building the project, declaring and fetching dependencies, opening an interactive session inside the project, and other such things.

**Command Description**

midje   Run all Midje tests.

repl 	Open an interactive Clojure session.

new 	Create a new Clojure project.

To get more information about a command, ```run lein help <command>```.

The heart of every Leiningen project is the file ```project.clj``` at the top level of the projects directory tree. It contains information about the projects name, version and dependecies among other things.

## Editor

As a lisp, Clojure requires some support from the text editor to be pleasant to write. Luckily a guy named Chris Granger has started a project to create The editor called Light Table. It’s still quite beta (you might encounter some bugs), but works nicely for your purposes during this course. Check it out. When in doubt, use this.

Light Table is more or less like an ordinary editor with some IDE like features. The thing that sets Light Table apart is the Instarepl. It is a tool in which you can write Clojure code, run it and instantly see the results. This is a great environment to test ideas and also to solve the exercises. Many think that working in the repl is one of the best things in Clojure developement.

When you open Light Table, you want to open your project.

    Open View -> Workspace
    Click folder
    Open the directory of the project that you just cloned with Git
    Open View -> Commands (shortcut Ctrl+Space)
    Search for connect and select Connect: Add Connection
    Select Clojure
    Select the project.clj

Optionally, if you have a larger monitor, you can split Light Table into two columns:

    Open the command bar
    Search for tabset
    Click Tabset: Add a tabset

You can now move tabs between these tabsets by dragging them from one to another.

Finally, to start using Light Tables awesome instarepl, do the following:

    Using the command bar, search for instarepl
    Select Instarepl: Open a clojure instarepl
    Light Table might ask you which connection you want the instarepl to use
    
Not suprisingly, both Vim and Emacs have good plug-ins to work with Clojure. For the basics, one should install the clojure-mode from the Emacs package manager. For a more complete set of tools we can recommend Emacs Starter Kit. In Vim, VimClojure provides you with the necessary goodies. There is also a Clojure indentation plugin for Sublime Text if that is your poison of choice.
