---
author: ItsLJcool
desc: Introduction on how Scripting works in your Library
lastUpdated: 2025-11-15T05:32:50.298Z
title: Scripting
---

# HScript, Lua, what's the difference?



<details>
    <summary>Moved this from `states.md`. Include this or reword it here please!</summary>
It is recommended that you have the console open while developing scripts as it displays any errors your scripts may have thrown, and helps you in pointing what part of your code had thrown it.

### Using anonymous structures
Anonymous structures are special objects that allow for storing multiple values in a key-value pair format, separated by commas in a format known as JSON (**J**ava**s**cript **O**bject **N**otation), which operates similarly to hashmaps / dictionaries with string keys. These allow you to fit a bunch of values in a format similar to objects.

An anonymous structure looks like this:

```haxe
var leStructure = {username: "mellowmeadow", score: 300, accuracy: 1, isValid: true};
```

Haxe does not care about whitespaces, which means the above code may be changed to the below for readability purposes: 

```haxe
var leStructure = {
    username: "mellowmeadow", 
    score: 300, 
    accuracy: 1, 
    isValid: true
    };
```

Anonymous structures can also be nested, meaning that you can place one inside another, like this:
```haxe
var structA = {
    structB: {
        sample: "code"
    }
};
```

Like other objects, fields of anonymous structures may be accessed using dot notation, that is:
```haxe
someStruct.someField = someValue;
```

This also works with nested structures - you just need an extra dot the deeper you're trying to access.
```haxe
structA.structB.key = value;
```

Since the state/substate's `data` field is of the type `Dynamic`, anonymous structures may be used as data you can pass over.

Going back to the results screen example, we may supply an anonymous structure to send over more information such as the player's accuracy, score, and others. As such, we can modify that line once more to do exactly that.

```haxe
FlxG.switchState(new ModState("ResultsScreen", {
    accuracy: accuracy, score: score, misses: songMisses
}));
```
</details>