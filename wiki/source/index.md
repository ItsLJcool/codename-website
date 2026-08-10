---
author: Skylime_
desc: Introduction to Source Modding.
lastUpdated: 2026-08-10T13:49:12.473Z
title: Modding The Engine - Source Modding
---

# An Introduction To Source Modding

Quick warning before anything else. Source modding is *not* the normal way to make a mod, and it's not what you should reach for first. It's a tool you pull out when softcoding genuinely can't do the thing, and even then you use both together.

## What it actually is

Softcoding means you write hscript (.hx) files inside your mod folder. The engine reads them while it's running. You save the file, you reload the state, and the change is there.

Source modding means you fork the engine itself, edit its Haxe code, compile the whole thing, and get your own copy of the game. You're not making a mod for the engine anymore. You're maintaining your own version of the engine that happens to have your mod inside it, which is probably a much bigger commitment than what it sounds like.

Codename Engine is built specifically so that softcoding can do basically everything source coding can. You can assume the thing you want already exists until you've properly checked.

## What you'll need

**Haxe**, more specifically the exact version the engine asks for.
**DO NOT** grab the latest version of Haxe just because it's newer.

**Git.** This one isn't optional, it's very much a requirement.

**A C++ compiler.** On Windows that's Visual Studio Build Tools 2022, and in the Individual Components tab, you want the MSVC v143 C++ x64/x86 build tools plus the Windows SDK. It's roughly ~1GB to download and ~5.5GB installed. On Linux you want g++ and gcc plus whatever dev packages the engine lists.

**The engine's libraries.** Run update.bat or update.sh and let it finish completely. Important: don't run haxelib upgrade afterwards. The engine uses its own forks of Lime, OpenFL, Flixel and hscript, and upgrading swaps them for the normal versions. Things then break in ways that are very annoying to track down.

**An editor.** Of course, this is optional, but reccomended. VS Code with the Haxe and Lime extensions is what most people use. Set up the hxcpp debugger early on.

You also need to actually know some things. Haxe as a language, how HaxeFlixel works, states, cameras, sprites, signals. What OpenFL is doing underneath all that, and how the engine itself loads mods and finds scripts.

Then there's time. First build is 10 to 40 minutes depending on your specs. Rebuilds after that are anywhere from 30 seconds to a few minutes. The whole setup will eat around 10GB once the caches pile up, and every extra platform you support is another full build and another round of testing.

## Getting set up

Fork the repo on GitHub.

Clone your fork, run the update script, then build the *completely untouched* engine and launch it. If it runs fine, you know your tools work. After that, make a branch and start editing. Do it in that order, because if something breaks later you'll know for certain it was you and not your setup.

## Now, why it isn't reccommended

Whatever version you forked the repo on, you keep forever. The engine updates won't be free any longer. Every new release is now a merge you do by hand and retest yourself.

You also lose compatibility with other mods. Softcoded mods stack on top of each other. Two source mods can never be installed together. That's just how it is.

Your mod becomes a whole executable. People download an exe instead of a folder, and unsigned builds set off an antivirus *(not like it does it as of now anyway)*. You will spend real time answering people asking if your mod is a virus.

Iteration gets slow. A tweak that takes three seconds in hscript now costs you a rebuild. Over a whole project that adds up more than anything else on this list, and it makes your mod worse because experimenting stops being quick.

Every bug becomes yours. Crash reports don't go to the engine devs anymore. They come to you, on your fork, with your changes. People can't turn your changes off. Softcoded stuff can be disabled or overridden. Compiled stuff can't.

There's no safety net. Hscript errors get caught and shown to you. A null in compiled code just takes the game down which is ***NOT** what you want.*, and it makes life harder for anyone helping you. The people you're collaborating with will now need a 5GB toolchain and a 20 minute build just to look at a change.

## The good parts

You get full access to practically everything.

It's genuinely faster. Compiled code with no interpreter in the way. That matters for things running every single frame, like heavy sprite counts (in the case you have a horrible, horrible computer).

You can change engine level behaviour that has no script hook at all, and you get build time control through project.xml defines and conditional compilation.

## The bad parts

The longer you go without updating, the worse it can get, and the more you lose on fixes or changes.

No compatibility with other source mods, and reduced compatibility with addons.

Slow iteration, which as mentioned, costs you more than you'd think.

Big unsigned platform specific downloads.

Licensing and credit obligations you have to actually keep up with.

A steep barrier for anyone joining your project.

You own every crash, including ones in code you never touched, and it's harder to hand off. Anyone can pick up a softcoded mod. A fork needs someone willing to maintain a fork.

## Use it alongside softcoding, not instead of it

This is the part that makes source modding better. The rule is simple:

**Source adds the hook. hscript does the actual work.**

When you want to build something, go through these in order and stop at the first yes.
Check if HScript can already do what you need to do. Check the API documentations.
Check if it really needs compiled access. Some things are slow in HScript, but if you have nothing to really sacrifice, **softcode it.**
Can hscript already do this? Check the API docs and the hook list properly before you answer. Most "impossible" things turn out to be documented somewhere. If yes, do it in hscript.

## If you publish it, you have to open source it

This is a **rule**, not a suggestion.

Shipping an executable mod built on the engine is explicitly allowed, as long as you clearly say it uses Codename Engine. You need to keep credits and attribution intact, so don't strip the credits menu or the splash.

People are running an unsigned exe you compiled. A public repo is the only thing separating that from downloading a random exe from a stranger. Source mods have been used to ship malware in this scene before, and a visible diff is the defence against that. Engine devs can't backport your fix if they can't see it. Public history proves you wrote what you wrote, and if you ever step away from the project, an open fork can be continued while a closed one just dies.

Practically, keep the fork public from day one. Tag a release for every build you hand out so the exe goes to a real commit. Link the repo in your mod description, your README and your in game credits. Keep the upstream LICENSE and NOTICE files and add your own copyright line next to theirs rather than replacing them.

## Treat everything like it's a pull request.

This is the habit that makes the whole thing sustainable.

One feature, any feature, with a name that says what it is. One thing per commit, with a message explaining what it does and why. Never reformat files you weren't already touching.
Match the style that's already in the repo rather than importing your own. Prefer adding things over changing things, and changing things over removing them.

Every change that gets merged upstream is one you delete from your fork and get for free forever. When something breaks you can bisect.

Then, actually send the PR. Worst case it gets declined and you keep it in your fork, exactly where it already was. Best case you stop maintaining it entirely.

Bug fixes especially. If you found a bug in the engine, that fix belongs upstream. Not sending in a PR can cause other mods to hit the same issue too, which is not what the devs want, or what you want either.

So, send in a PR.

### TL;DR, don't source mod it at all unless you run into serious issues.
Everything Codename Engine already offers for softcoding is in your favor. If you want to add fixes to the game that hasn't already been fixed or want to introduce your own ideas, make a PR. That's all.
