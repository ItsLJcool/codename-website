---
author: ItsLJcool
desc: All the features (and syntax) that Codename Engine allows for softcoding
lastUpdated: 2025-11-15T05:32:50.298Z
title: Scripting - Features
---

# TODO
Explain all the features scripts can use. (i.e getter / setter, enums, imports, using, etc.)

### Differences between `Script` and `ScriptPack`
When looking through the source, you might find that there is 2 commonly used Classes for Scripts 

### Anonymous Structures
Anonymous structures are objects that allow for storing multiple values in a key-value pair format, separated by commas. They are features of Haxe and HScript that provide data grouping in general. Keys must be regular Haxe identifiers, and values are dynamic. They are useful to share data around in a compact manner. Anonymous structures themselves are treated as dynamic values.

Code-wise, structures look similar to JSON, or Javascript Object Notation. However, there are important distinctions between them: JSON objects are explicitly strings, including keys, while Haxe keys are regular identifiers and values are regular Haxe types. It is generally safe to serialize structures into JSON objects and deserialize structures from JSON objects, though.

Anomyous structures generally look like this:

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

Next steps in learning the In-and-out's of HScript
- [Features](./features.md)
- [[NEXT] Formatting, and Basic Syntax](./style.md)
- [Event Callbacks](./events.md)
- [PlayState Interaction](./playstate.md)
- [Custom States / SubStates](./states.md)
- [Global Script](./global.md)
- [Custom Classes](./classes.md)