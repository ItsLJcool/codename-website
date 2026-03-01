---
author: ItsLJcool
desc: Introduction on how Scripting works in your Library
lastUpdated: 2026-02-01T02:16:06.176Z
title: Modding The Engine - Scripting
---

# HScript, Haxe, Lua, what's the difference?
If you're familiar with Lua (or Psych Lua) you are probably familiar with coding already, but it's recommended you actually get close and understand Haxe, as **most** things in Codename Engine will require you to make your own solution.

The differences between both languages is very clear.
<!-- #region Difference between lua syntax and haxe syntax (summary) -->
<details>
    <summary>Here is a small script side by side in Lua, then Haxe.</summary>
<div style="display: flex; justify-content: center; gap: 25px;">

```lua
greeting = "hi"
function onCreate()
    ending = " chat!"
    
    print(greeting + ending)
    -- this is a comment!
end
```
```haxe
var greetings:String = "hi";
function create() {
    var ending:String = " chat!";
    // or you can do trace('$greetings$ending'); because of string interpolation.
    trace(greetings + ending);
    // this is a comment!
}
```
</div>
</details>
<!-- #endregion -->

From now on, we will use **"HScript"** to refer to the Programming Language Codename Engine uses. It's the same programming language as Haxe, though HScirpt has the fun property of not being standardized (also the fact that Codename Engine has it's own **[hscript-improved](https://github.com/CodenameCrew/hscript-improved/tree/codename-dev)** branch that Codename Engine uses).

So really your learning a new language that is based of the Syntax of Haxe. Reading Haxe documentation is worth it because then you have parity between writing code in **[Source Code]** and in HScript. 

Here is relevant links to the Haxe / HaxeFlixel documentation and creating your first game in Haxe!
- [Introduction - Haxe - The Cross-platform Toolkit](https://haxe.org/manual/introduction.html)
- [Hello World | HaxeFlixel - 2D Game Engine](https://haxeflixel.com/documentation/hello-world/)

### Why is learning Haxe / HaxeFlixel even suggested? I want to make FNF mods, not games!!
Here is an analogy, and an explanation.<br>
Imagine this; You want to get into music *(or even produce an album)* and you want to create sick beats. If you just place down notes in FL Studio randomly *(or in somewhat good tones)*, you will just create audio that is barely passing as music.

Yes, it will get the job done, you made music! Many people won't to listen to it, **you** might not want to listen to it because it's missing the key properties of Music Theory.

What's Music Theory? You don't know! You never took the opportunity to look into it. If you really wanted to release music that is listenable you should at least understand a little about the topic you are working in.

This applies to Codename Engine in the same way. The ***entire*** engine is based around Haxe and Flixel.<br>
Scripting code to your desired specifications, using the engine that is built from the same Syntax / Language to execute things for you, handle default specifications, allowing you to depend on pre-existing code, not thinking about how it all works, just know it does what you'd expect.

That is the complexity of Codename Engine, it's built for you to customize every aspect of the base Friday Night Funkin' experience, or you can just completely override everything and code Pong and Tetris for no reason.

More control to you, requires you to understand the problems and issues yourself.

This isn't an essay saying "YOU SHOULD ONLY USE HAXE AND NOTHING ELSE!!! YOU NEED TO KNOW EVERYTHING!!!", it's about reminding you that this engine is built around Scripting, so to do many things the engine doesn't provide by default you'll need to implement yourself, and to note that less control = less freedom = less creativity.

## Before we get Scripting
It is recommended that you have the console open while developing scripts, as it displays any errors your scripts may have thrown and helps you in pointing what part of your code had thrown the error.<br>
Pressing <u>`F2`</u> will open up the console if it's not opened, and <u>pressing it again will clear the console.</u> It's important to note that you should **not** close the console once opened, as doing so will also close Codename Engine.

It is also important to note that Flixel debugging is mostly accurate, but there are some cases when it comes down to HScript, or just flixel being stupid and lies to you.

<!--
My idea to get across here, is how to setup a script, and basic function showcases and in-depth explanation on what it does, and the logic behind it.<br>
Then there will be a section that explains why it runs this way.
-->

# Intro to Scripting

When creating a script, the name of the file does not matter, unless Codename Engine specifcally looks for a script in that location.<br>
Codename Engine supports the `.hx`, `.hscript`, `.hsc`, and `.hsx` file extensions. The `.lua` file extension is checked, but only to let the <u>user know that Lua is not supported.</u>

You can place this file anywhere, but common practice is usually in `./data/scripts/`. You can also make <u>sub-folders</u> for more organization.<br>
Once your file is created, you can open the file in your editor and code from there.

<!-- #region Script file paths that Codename Engine hooks by default (summary) -->
<details>
    <summary>Here will list out common file paths that Codename Engine checks by default for various things.</summary>

- `./songs/`<br>
Any script here will load when <u>**any**</u> song is loaded. Known as the <u>Global Song Scripts</u><br>
See the **[PlayState](./playstate.md)** documentation for more info.

- `./songs/[SONG NAME]/scripts/`<br>
Any script in your song folder in the designated `scripts/` folder will only load when that song is selected. Known as the <u>Song Script</u><br>
See the **[PlayState](./playstate.md)** documentation for more info.

- `./data/global.hx`<br>
When creating a script name called `global` in `./data/`, it will load the script when your mod first loads up, and is always active. Known as the <u>**[Global Script](./global.md)**</u>

- `./data/discord.hx`<br>
When creating a script named `discord` in `./data/`, it will load when Discord initalizes and will call various functions

- `./data/characters/[CHARACTER NAME].hx`<br>
This script will load whenever the respective character is also created, and is bounded to the `Character` class. It is seperate from **[PlayState](./playstate.md)** altogether. Known as the <u>Character Script</u>

- `./data/events/[CUSTOM EVENT NAME].hx`<br>
See the **[Events](./events.md)** documentation for more information.

- `./data/stages/[STAGE NAME].hx`<br>
When creating a Script with the same name as your **[Stage]** XML, it will load when the stage also loads. Known as the <u>Stage Script</u>

- `./data/states/`<br>
See the **[States](./states.md)** documentation for more information.

- `./source/`
Any script here will be classified for **[Custom Classes](./classes.md)**

</details>
<!-- #endregion -->

<!-- TODO: Add more info here, idk what else to add for introduction tbh -->

Next steps in learning the In-and-out's of HScript
- [[NEXT] Features](./features.md)
- [Formatting, and Basic Syntax](./style.md)
- [Event Callbacks](./events.md)
- [PlayState Interaction](./playstate.md)
- [Custom States / SubStates](./states.md)
- [Global Script](./global.md)
- [Custom Classes](./classes.md)