---
author: ItsLJcool
desc: Explains how Custom Classes work
lastUpdated: 2025-11-15T05:32:50.298Z
title: Scripting - Custom Classes
---

# HScript's Classes and it's quirks
HScript allows for Custom classes, and it is not a 1:1 copy-paste from how source classes works, there is some limitations but those issues are being worked on.

You can define a Custom Class to import into any script by adding a file in `./source` in your Modpack called the Class name. You can add sub-folders for organization as well.
<div style="display: grid; justify-content: left;">

```text
└─ 📂 My Mod/                                
   └─ 📂 source/                              # Custom Classes go here.
      ├─ 📄 MyCustomClass.hx                  # `import MyCustomClass;` in your code.
      └─ 📂 extra/                           
         └─ 📄 CoolClass.hx                   # `import extra.CoolClass;` in your code.
```

Here is an example of a Custom Class:
```haxe
class MyCustomClass { 

    private var my_private:Int = 0;
    public var my_public(get, never):Float;
    // Getters / Setters can be public or private it doesn't matter, as both `private` and `public` variables are accessable anyways...
    private function my_public():Float { return FlxG.random.float(-10, 10); }

    var my_random_var:Bool = true;

    static var my_static_var:Dynamic;

    public function new(arg1:Bool, arg2:String) {
        trace('you\'ve entered $arg1 and "$arg2"');
    }

    public function myFunc() {
        trace("Hey look! I've been called!");
        my_static_var = "myFunc";
    }

    public static function staticFunc() {
        trace("Oh wow look im a static callback!");
        my_static_var = "staticFunc";

        // trace(my_random_var); // Cannot access non-static instances inside a static function
    }

    private function myPrivateFunc() {
        trace("ooh you shouldn't call me directly!!");
    }
}
```
</div>

Now as of v1.0.1 and it's Experimentals, Static variables in Custom Classes are *not exactly static*, but are <u><i>locally static.</u></i><br>
This means if you import it in 2 different scripts they can have different static values. This can be easily fixed with a simple workaround, if your using the `./source/` folder for your class initalization.

```haxe
/* Custom Class Script in `./source/RealClassName.hx` */
// You want the actual class to not be your real class name, as we will make a static variable with the class name you desire.
class InternalClassName {
    static var my_static_var:String = "Test";
}

// This will define this 1 static class 
static var RealClassName:Class = InternalClassName;

```

My cat wants me to lay down so that's all im saying rn 🙏🙏🔥🗣️

# TODO:
Explain how you define custom classes, and detail the current limitations as follows:
- Cannot extend FlxState and use for actual States. (Including things that EXTEND FlxState)
- Static Variables are not exactly static.
  - They are only locally static. You can explain how to make a true static class with GlobalScript.
  - UPDATE: This is being changed (fixed) as it was an issue.
- Extended classes must override a function if you also want to override that function.

Also explain you can use the `source/` folder in your Library to add Custom Classes, and show how you can use `import` and `using`.

Next steps in learning the In-and-out's of HScript
- [Features](./features.md)
- [[PREV] Formatting, and Basic Syntax](./style.md)
- [Event Callbacks](./cancellables.md)
- [[NEXT] PlayState Interaction](./playstate.md)
- [Custom States / SubStates](./states.md)
- [Custom Events / Notetypes](./events.md)
- [Global Script](./global.md)
- [Custom Classes](./classes.md)