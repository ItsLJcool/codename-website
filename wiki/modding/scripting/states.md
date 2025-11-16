---
author: clairedeluneee
desc: Explains how you can make custom States / SubStates
lastUpdated: 2025-11-16T13:15:34.000Z
title: Scripting - Custom States / SubStates
---

# Custom States
States are essentially the screens you see throughout HaxeFlixel games.

## Changing existing states
The fork of HScript Codename uses allows existing states such as `FreeplayState` to be modified with a script.

This can already be done in PlayState scripts, since `PlayState` itself is a state and scripts are allowed to change its content, such as in the instance of making a new HUD. This behavior is not exclusive to `PlayState` as it can be done on ***any*** state. 

While making scripts that change existing states, it's advised to hold on to a copy of the source code of the state you're changing so that you know what you're working with.

## Making custom states
Custom states and substates may be created in the same fashion as other scripts do. These states go under your mod's `data/states/` folder. If that folder doesn't exist, create it.

## Opening custom states
States you wrote may be opened by calling `FlxG.switchState` and supplying the function by using `new ModState([state name])`, replacing the `[state name]` placeholder with the name of the state you wish to load in quotes. 

Do note that the `ModState` and `ModSubState` constructors append "data/states/" to the supplied name, which means `new ModState("TestState")` looks for data/states/TestState.hx. If the state you want to switch to is inside a folder in the states folder, you'll need to add that subfolder's name too.

For example, suppose that you have a custom state named `ResultsScreen.hx`. In order to enter this custom state, you run the below code:
```hx
FlxG.switchState(new ModState("ResultsScreen")); // looks for data/states/ResultsScreen.hx
```

### Substates
Substates behave similar to states, with the difference being that substates can be put over states, and that substates may be nested (you can put substates over substates).

To open a substate, call `FlxG.state.openSubState` the same way you switch to a custom state, except you use `ModSubState` in place of `ModState`. To return to the parent state, call `close()`.

## Hot-reloading states
With developer mode on, you can hit F5 on your keyboard to reload the current state. Pressing this a second time during the transition will skip it, allowing you to view your changes faster. Developer mode can be enabled by going to `Options Menu > Miscellaneous` and ticking the checkbox for Developer mode.

It is recommended that you have the console open while developing scripts as it displays any errors your scripts may have thrown, and helps you in pointing what part of your code had thrown it.

## Passing a message
You may pass something along with the state switch by supplying the `ModState` constructor with another parameter. This parameter is of the `Dynamic` type, which means it could be anything.

Consider our previous example with `ResultsScreen.hx`. Should we want to also tell it the accuracy the player has gotten, then we modify the line so that it reads this:
```hx
FlxG.switchState(new ModState("ResultsScreen", accuracy));
```

To access the data from the `ResultsScreen` script, simply read from the `data` variable. Do note that reloading the state clears this, but the last non-null value of this is saved as a static variable and can be accessed with `ModState.lastData` (this is `ModSubState.lastData` for substates).

### Using anonymous structures
Anonymous structures are special objects that allow for storing multiple values in a key-value pair format, separated by commas in a format known as JSON (**J**ava**s**cript **O**bject **N**otation), which operates similarly to hashmaps / dictionaries with string keys. These allow you to fit a bunch of values in a format similar to objects.

An anonymous structure looks like this:

```hx
var leStructure = {username: "mellowmeadow", score: 300, accuracy: 1, isValid: true};
```

Haxe does not care about whitespaces, which means the above code may be changed to the below for readability purposes: 

```hx
var leStructure = {
    username: "mellowmeadow", 
    score: 300, 
    accuracy: 1, 
    isValid: true
    };
```

Anonymous structures can also be nested, meaning that you can place one inside another, like this:
```hx
var structA = {
    structB: {
        sample: "code"
    }
};
```

Like other objects, fields of anonymous structures may be accessed using dot notation, that is:
```hx
someStruct.someField = someValue;
```

This also works with nested structures - you just need an extra dot the deeper you're trying to access.
```hx
structA.structB.key = value;
```


Since the state/substate's `data` field is of the type `Dynamic`, anonymous structures may be used as data you can pass over.

Going back to the results screen example, we may supply an anonymous structure to send over more information such as the player's accuracy, score, and others. As such, we can modify that line once more to do exactly that.

```hx
FlxG.switchState(new ModState("ResultsScreen", {
    accuracy: accuracy, score: score, misses: songMisses
}));
```
