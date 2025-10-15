---
author: ItsLJcool
desc: Basic tutorial on how to setup and initalize your own mod!.
lastUpdated: 2024-09-20T15:19:41.000Z
title: Modding The Engine
---
# Modding The Engine
No matter what you do, editing the `./assets/` folder is not recommended, as it's used as your Backup folder / Mod if assets or data cannot be found, it will use the `./assets/` as a saftey catch. You should only make `Mods` in the `./mods/` folder.

There is also an `./addons/` folder which is somewhat similar to the way `./mods` works, but it has it's own set of rules to follow, and best practices.
#### TODO: Add a link to know how to make an Addon.

## How should I structure my folders?
For starters, this is what an average Mod Folder will contain. We will go over some folders that require more explanation later.
<details>
    <summary>Click to expand</summary>
```text
└─ 📂 My Mod/                                
   ├─ 📂 data/                                # Usually contains configuration, or information you want to store.
   │  ├─ 📂 characters/                       # Contains your Character's XML data.
   │  ├─ 📂 events/                           # Contains your Custom Events.
   │  │  ├─ 📄 Example Event.hx              
   │  │  ├─ 📄 Example Event.json            
   │  │  └─ 📄 Example Event.ui.json         
   │  ├─ 📂 config/                           # Configuration stuff.
   │  │  └─ 📄 modpack.ini                   
   │  ├─ 📂 dialogue/                        
   │  │  ├─ 📂 boxes/                        
   │  │  └─ 📂 characters/                   
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
   │  └─ 📂 stages/                           # Images of your stage cna go here, but it's not required.
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
   │     ├─ 📂 song/                          # Supports `Inst.ogg` / `Voices.ogg` and suffix's like `-bf`. Also supports difficulties
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
</details>

Don't be scared by the amount of folders, usually you only mess with the `./songs/`, `./data/`, and `./images/` folders most of the time.

It's good to have a reference of what you can do at least, so this will be updated from time to time with new updates (hopefully 😭).