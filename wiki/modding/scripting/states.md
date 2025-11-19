---
author: clairedeluneee & ItsLJcool
desc: Explains how you can make custom States / SubStates
lastUpdated: 2025-11-19T06:49:41.829Z
title: Scripting - Custom States / SubStates
---

# Custom States
`FlxState` (or **[MusicBeatState](../../../api-docs/funkin/backend/MusicBeatState.html)**) are your States that you can switch between on run-time, allowing for multiple scenes and organization of your code.

Custom States allow you to execute your own code in your own way, it's 99% similar to creating a State from source.
You **cannot** have [Custom Classes](./classes.md) extend from any form of `FlxState` or `FlxSubState` (also any class that inherits it), as it isn't supported by `hscript-improved`

## Changing existing states
With [`modpack.ini`](../config.md) you are able to override states such as **[FreeplayState](../../../api-docs/funkin/menus/FreeplayState.html)** with your own custom state.
Although, if you still wanted to use the base State and add on-to it with a script, then you can do so!

In CodenameEngine, appending a Script to a **[MusicBeatState](../../../api-docs/funkin/backend/MusicBeatState.html)** or **[MusicBeatSubState](../../../api-docs/funkin/backend/MusicBeatSubstate.html)** is very simple. All you need to do is place a file with the Class Name in `./data/states/`.

An example would be: `./data/states/MainMenuState.hx`. This script will append itself whenever **[MainMenuState](../../../api-docs/funkin/menus/MainMenuState.html)** is switched to!

As long as the class extends **[MusicBeatState](../../../api-docs/funkin/backend/MusicBeatState.html)** or **[MusicBeatSubState](../../../api-docs/funkin/backend/MusicBeatSubstate.html)** you can append a script onto it. So yes, you can append a script to **[UIState](../../../api-docs/funkin/editors/ui/UIState.html)**. This we will come back to, as it will prove useful in [Custom Editors!](../editors/custom.md)

### Why can't I append a Script in the `PlayState` class, and have a script running when the state loads?
Well you ***can,*** though the reasoning behind why you shouldn't really append a script to **[PlayState](../../../api-docs/funkin/game/PlayState.html)** State is easy to understand.

**[PlayState](../../../api-docs/funkin/game/PlayState.html)** handles it's own custom **[ScriptPack](../../../api-docs/funkin/backend/scripting/ScriptPack.html)**, and differs from the actual **[MusicBeatState](../../../api-docs/funkin/backend/MusicBeatState.html)**'s Scripts. Appending a Script in the **[PlayState](../../../api-docs/funkin/game/PlayState.html)** State only modifies the [`stateScripts`](../../../api-docs/funkin/backend/MusicBeatState.html#stateScripts), which isn't what `PlayState` itself manages for your Events, Callbacks, internal variables, etc.

Hovever, you can just modify the internals of the **[PlayState](../../../api-docs/funkin/game/PlayState.html)** by appending a script to the State, like an example:
```haxe
function create() {
    trace("PlayState state script initalized");
}

function onOpenSubState(event:StateEvent) {
    trace("We are opening a substate!!");
}
```
This is different from a `PlayState Script`, as you normally would need to run the `onSubstateOpen` callback, because `PlayState` actually never interacts with it's [`stateScripts`](../../../api-docs/funkin/backend/MusicBeatState.html#stateScripts) Scripts at all.

## Making custom states
While making scripts that change existing states, it's advised to use the source code of the state you're changing as a reference, so that you know what you're working with.

Custom States / SubStates may be created in the same fashion as other scripts do. These states go under your mod's `./data/states/` folder.

You can switch to any state by calling `FlxG.switchState` and supplying a new instance of the state as the parameter. With Custom States, you will need to use **[ModState](../../../api-docs/funkin/backend/scripting/ModState.html)** (and use **[ModSubState](../../../api-docs/funkin/backend/scripting/ModSubState.html)** for your SubStates) as they extend **[MusicBeatState](../../../api-docs/funkin/backend/MusicBeatState.html)** / **[MusicBeatSubState](../../../api-docs/funkin/backend/MusicBeatSubstate.html)** to manage your script automatically.

Do note that the **[ModState](../../../api-docs/funkin/backend/scripting/ModState.html)** and **[ModSubState](../../../api-docs/funkin/backend/scripting/ModSubState.html)** constructors append `./data/states/` to the supplied name, which means `new ModState("TestState")` looks for `./data/states/TestState.hx`. If the state you want to switch to is inside a folder in the states folder, you'll need to add that subfolder's name too.

For example, suppose that you have a custom state named `ResultsScreen.hx`. In order to enter this custom state, you run the below code:
```haxe
FlxG.switchState(new ModState("ResultsScreen")); // looks for data/states/ResultsScreen.hx
```

### SubStates
SubStates behave similar to states, with the difference being that substates can be put over states, and that substates may be nested (you can put substates over substates).

To open a substate, all you need to do is call [`openSubState`](../../../api-docs/funkin/backend/MusicBeatState.html#openSubState) the same way you use `FlxG.switchState`, although we don't append `FlxG` as [`openSubState`](../../../api-docs/funkin/backend/MusicBeatState.html#openSubState) is a function directly from the State itself. You would use **[ModSubState](../../../api-docs/funkin/backend/scripting/ModSubState.html)** for your SubStates. To return to the parent state, call `close()`.
```haxe
// this is our ModState script
function create() {
    trace("State initalized!");
}

function update(elapased:Float) {
    if (controls.ENTER) openSubState(new ModState("mySubState")); // looks for `./data/states/mySubState.hx`
}
```
```haxe
// This is our ModSubState Script
function create() {
    trace("SubState Opened!");
}

function update(elapsed:Float) {
    if (controls.BACK) close(); // when we press our `BACK` button we close this SubState.
}
```

I recommend you make sub-folders for organizing your States, from SubStates. (i.e `./data/states/substates/` && `./data/states/custom/`). You can name the folders whatever but it will be very useful down the line, when you have a lot of states for testing, or implementing new States.

## Hot-reloading states
With developer mode on, you can hit `F5` <i>(changable in Keybind Settings)</i> on your keyboard to reload the current state. Developer mode can be enabled by going to `Options Menu > Miscellaneous` and ticking the checkbox for Developer mode.

#### COOL TIP!
You can press `SHIFT` in any **[MusicBeatTransition](../../../api-docs/funkin/backend/MusicBeatTransition.html)** to instantly skip the Transition In / Out!
#### NOTE: Add Advanced Link here for Custom Transitions, and explaining to look here for more information!

## Including Custom Data in Custom States
You may pass something along with the State switch by supplying the **[ModState](../../../api-docs/funkin/backend/scripting/ModState.html)** constructor with another parameter. This parameter is of the `Dynamic` type, which means it could be anything. (This again, applies to **[ModSubState](../../../api-docs/funkin/backend/scripting/ModSubState.html)** as well)

Consider our previous example with `ResultsScreen.hx`. Should we want to also tell it the accuracy the player has gotten, then we modify the line so that it reads this:
```haxe
FlxG.switchState(new ModState("ResultsScreen", accuracy));
```

To access the data from the `ResultsScreen` script, simply read from the [`data`](../../../api-docs/funkin/backend/scripting/ModState.html#data) variable. Do note that reloading the state clears this, but the last non-null value of this is saved as a static variable and can be accessed with [`ModState.lastData`](../../../api-docs/funkin/backend/scripting/ModState.html#lastData) (Once again, **[ModSubState](../../../api-docs/funkin/backend/scripting/ModSubState.html)** also applies this same example.)

This is basically all you need to know about Custom States, and how to interact with them!