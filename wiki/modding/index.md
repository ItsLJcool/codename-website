---
author: ItsLJcool
desc: Basic tutorial on how to setup and initalize your own mod!.
lastUpdated: 2025-11-15T05:32:50.298Z
title: Modding The Engine - Softcoding
---

# Modding The Engine - Softcoding
No matter what you do, editing the `./assets/` folder is not recommended, as it's used as your Backup folder / Mod if assets or data cannot be found, it will use the `./assets/` as a saftey catch. You should only make `Mods` in the `./mods/` folder.

There is also an `./addons/` folder which is somewhat similar to the way `./mods/` works, but it has it's own set of rules and best practices to follow.
#### TODO: Add a link to know how to make an Addon.

## THIS IS NOT A GUIDE FOR SOURCE MODDING!!
If you want to know how to make a Mod in Source, [TODO: Write a Doc.md for seting up a Source Project and link it from here!]

## <h2 id="folder-structure" sidebar="Folder Structure">How should I structure my folders</h2>

For starters, this is what an average Mod Folder will contain. We will go over some folders that require more explanation later.
<details>
    <summary>Click to expand</summary>
```text
└─ 📂 My Mod/                                
   ├─ 📂 data/                                # Usually contains configuration, or information you want to store.
   │  ├─ 📂 characters/                       # Contains your Character's XML data.
   │  ├─ 📂 config/                           # Configuration stuff.
   │  │  └─ 📄 modpack.ini                   
   │  ├─ 📂 dialogue/                        
   │  │  ├─ 📂 boxes/                        
   │  │  └─ 📂 characters/                   
   │  ├─ 📂 events/                           # Contains your Custom Events.
   │  │  ├─ 📄 Example Event.hx              
   │  │  ├─ 📄 Example Event.json            
   │  │  └─ 📄 Example Event.ui.hx           
   │  ├─ 📂 library/                          # This is where you put Scripts for ScriptedAssetLibrary! We Will go over this later.
   │  ├─ 📂 notes/                            # Custom NoteType Scripts (And adds them in the Charter!)
   │  │  └─ 📄 Example Note.hx               
   │  ├─ 📂 splashes/                        
   │  ├─ 📂 stages/                           # Where your Stage `.xml` and/or `.hx` file for your stage is located.
   │  ├─ 📂 states/                           # Scripts that run when States are switched to, or when loading a ModState!
   │  ├─ 📂 titlescreen/                     
   │  ├─ 📂 weeks/                           
   │  │  ├─ 📂 weeks/                        
   │  │  │  ├─ 📄 Example Week.xml           
   │  │  │  └─ 📂 characters/                
   │  │  ├─ 📂 characters/                   
   │  │  │  └─ 📄 Example Character.xml      
   │  │  └─ 📄 weeks.txt                     
   │  └─ 📄 global.hx                         # This script runs all the time, above any state switching, and never deloads (unless you switch mods).
   ├─ 📂 fonts/                              
   ├─ 📂 images/                             
   │  ├─ 📂 characters/                       # Contains your Character Spritesheet `.png` and `.xml` Animation.
   │  ├─ 📂 game/                             # Stuff usually found for global PlayState graphics.
   │  ├─ 📂 icons/                            # Where your Character's icons will be located.
   │  └─ 📂 stages/                           # Images of your stage can go here, but it's not required.
   ├─ 📂 languages/                           # Custom Languages support for your mod!
   │  └─ 📂 en/                               # The language you want to edit / create
   │     ├─ 📄 config.ini                    
   │     ├─ 📄 Editors.xml                   
   │     ├─ 📄 Main.xml                      
   │     └─ 📄 Options.xml                   
   ├─ 📂 music/                              
   ├─ 📂 shaders/                            
   ├─ 📂 songs/                               # Where songs are located, along with charts, events, scripts, audio, meta, etc.
   │  ├─ 📄 Example Global Song Script.hx     # Scripts inside the `./songs/` folder will load for every song.
   │  └─ 📂 example-song-here/               
   │     ├─ 📂 charts/                       
   │     │  └─ 📄 hard.json                  
   │     ├─ 📂 song/                          # Supports `Inst.ogg` / `Voices.ogg` and suffixes like `-bf`. Also supports difficulties.
   │     │  ├─ 📄 Inst.ogg                   
   │     │  ├─ 📄 Inst-hard.ogg              
   │     │  ├─ 📄 Voices-bf.ogg              
   │     │  ├─ 📄 Voices-bf-hard.ogg         
   │     │  ├─ 📄 Voices-dad.ogg             
   │     │  └─ 📄 Voices-dad-hard.ogg        
   │     ├─ 📂 scripts/                       # Scripts loaded for this specific song.
   │     ├─ 📄 events.json                   
   │     └─ 📄 meta.json                     
   ├─ 📂 sounds/                             
   ├─ 📂 source/                              # Custom Classes go here.
   └─ 📂 videos/                             
```

#### NOTE!
This might not be EVERYTHING, but it's a good chunk of the folders CodenameEngine interacts with.
</details>

Don't be scared by the amount of folders, usually you only mess with the `./songs/`, `./data/`, and `./images/` folders most of the time.
<br>It's good to have a reference of what you can do at least, so this will be updated from time to time with new updates (hopefully 😭).

## Sections
These areas will split up into their own sub-pages, and they will explain to you what each folder is for, what files you can add, and how to effectively use them.
- <a href="./config.md">Configuration</a>
- <a href="./libraries.md">What is a "AssetLibrary"?</a>
- <a href="./scripting/index.md">Scripting</a>
    - <a href="./scripting/features.md">Scripting Features</a>
    - <a href="./scripting/style.md">Code Formatting / Style</a>
    - <a href="./scripting/events.md">Events / Callbacks</a>
    - <a href="./scripting/playstate.md">PlayState Scripting</a>
    - <a href="./scripting/states.md">Custom States / SubStates</a>
    - <a href="./scripting/global.md">Global Script(s)</a>
    - <a href="./scripting/classes.md">Custom Classes</a>
- <a href="./editors/index.md">Editors Introduction</a>
    - <a href="./editors/chart.md">Chart Editor</a>
    - <a href="./editors/character.md">Character Editor</a>
    - <a href="./editors/stage.md">Stage Editor</a>
    - <a href="./editors/alphabet.md">Alphabet Editor...?</a>
    - <a href="./editors/character.md">Custom Editors</a>
- <a href="./hxvlc.mdhxvlc.md">Using hxvlc for Videos</a>
- <a href="./advanced/index.md">Intro to Advanced Topics</a>

All of those above are for Softcoding, if you want to learn how to mod Source, you can check out the Introduction here
- <a href="./source/index.md.md">Modding The Engine - Source</a>