---
author: ItsLJcool
desc: Basic and (somewhat) Advanced explanation on how AssetLibrary's work.
lastUpdated: 2024-09-20T15:19:41.000Z
title: Modding The Engine - AssetLibrary
---
# AssetLibrary, ScriptedAssetLibrary, ModsFolderLibrary, etc
This section isn't CodenameEngine specific, but it is still relevant to how you make your CodenameEngine Mods.

### ⚠️ Warning ⚠️
If you do not care about the in-depth explanation, or care about Library's you are free to skip this section, although there is some things to note before doing so.

From now on, we will be referencing your Mod as some of the following:
- Mod Library
- ModsFolderLibrary
- Library
- Custom Library
- Compressed Library

This is because your entire mod is based around the `ModsFolderLibrary`, which is an extension of `AssetLibrary`. If you wish to fully understand the concept, this guide will attempt to explain it as simple as possible.

It is reccomended you read this section, as it will help you better understand how to use your Modpack to the fullest, using the engine to it's fullest.

<h2 id="what-is-a-library" sidebar="What is a Library?">What is a Library?</h2>

In this context, a Library is literally what you'd expect it to mean. It's just a class you interact to get Assets from. You can think of it being a folder, and all of it's contents are indexed by the folder's location.

For example, if you want to path to a file like `./images/stages/stage.png`, you would do `Library.getPath('assets/images/stages/stage.png')`. This would return the file's location based on the context of where your library wants to locate for your files.

To Haxe, usually you want the absolute path relative to your project's root, which is prefixed by the common `./`. In CodenameEngine's case, it will return the path in the mod's folder. `./mods/My Mod/images/stages/stage.png`.

### Why does it return `assets/My Mod/images/stages/stage.png` when debugging?
This is because of Manifests. All you need to know for Modding purposes, is because AssetLibrary just needs the relative path to the file from `./assets/`.

Since the Library already knows where the folder is located, and because of some black magic that we don't care about right now, you must path from the `./assets/` folder.

<h2 id="should-i-care" sidebar="Why should I care?">Why should I care about AssetLibrary?</h2>

You really shouldn't, unless you are wanting to make support for either addons, other mods, etc. Though, any Compressed Library's (i.e. ZipFolderLibrary) you really need to care about, because all of your assets are compressed. Meaning you can't access your data unless you decompress it.

This is mainly why you should at least understand the bare concept of Library's, because of the things you can do with them.

<h2 id="scripted-asset-library" sidebar="ScriptedAssetLibrary">ScriptedAssetLibrary</h2>

This section, is for advanced information. You are not required to understand or know this.

#### got bored so im stoping here LOL