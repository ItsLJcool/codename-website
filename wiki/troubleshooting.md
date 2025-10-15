---
author: Ne_Eo
desc: This page explains how to fix common issues.
lastUpdated: 2025-01-08T23:43:42.123Z
title: Troubleshooting
---
# Troubleshooting

# TODO - REMAKE THIS EITHER A BETTER FAQ, OR MOVE ALL THE INFO INTO SCRIPTING FAQ'S!!

## <h2 id="notes-only-on-left-side" sidebar="Notes only on left side of the screen.">My notes are only appearing on the left side of the screen.</h2>

Open the strumline options and for the bf strumline set the X ratio to 0.75, and for the dad strumline set the X ratio to 0.25.

## <h2 id="character-editor-buggy">The character editor is buggy.</h2>

Please have some patience as we are working on fixing the issues that are causing this.

## <h2 id="rotating-strum-moves-notes">Rotating a strum moves the notes.</h2>

To prevent this behavior, you can do <syntax lang="haxe">strum.noteAngle = 0;</syntax>

## <h2 id="velocity-not-working" sidebar="Velocity not working">Velocity/Acceleration doesn't move my sprite</h2>

You need to set `sprite.moves = true;` to make it move, its automatically enabled if you set the property using <syntax lang="xml">&lt;property /&gt;</syntax> on `velocity.x` and `velocity.y` or `acceleration.x` and `acceleration.y` in the stage xml.

We made it turned off automatically to optimize the game since it's useless to have it running for sprites that don't use it.

## <h2 id="flxbar-not-working" sidebar="FlxBar not working">FlxBar doesn't work</h2>

This is likely due to you are doing
```haxe
var variable:Float = 0;

bar = new FlxBar(x, y, FlxBarFillDirection.LEFT_TO_RIGHT, 400, 20, this, "variable");

variable = 50;
```

When you should be doing
```haxe
var barData = {
    variable: 0,
}

bar = new FlxBar(x, y, FlxBarFillDirection.LEFT_TO_RIGHT, 400, 20, barData, "variable"); // The change was changing `this` to `barData`

o.variable = 50;
```

The reason this happens is because the `this` variable points to PlayState.instance, instead of what you expect to be the script, and even if you do `__script__` it still sadly won't work since FlxBar doesn't check variables in the script.

Small tip: if you want the bar to be smooth you should do `bar.unbounded = true;`


## <h2 id="atlas-anim-not-working" sidebar="Atlas animation not working">Atlas animations don't work</h2>

This could be due to multiple reasons, but one of the most common ones are that you are using `sprite.animation.play("animation")` instead of `sprite.playAnim("animation")`.
If you are using the raw FlxAnimate class then you need to use `sprite.anim.play("animation")` instead.

## <h2 id="stage-var-not-working" sidebar="&quot;stage&quot; variable not working">The &quot;stage&quot; variable doesn't work</h2>

This could be because you are using a stage xml with a sprite with the name "stage", this issue only happens in the stage script.

To fix this, rename the sprite to something else.

## <h2 id="git-clone-error" sidebar="Git clone error">I get a git clone error</h2>

This is a known issue with the repository, and is being worked on.

For now you can use the following command to fix it:

```txt
git config --global http.postBuffer 524288000
```
<!--
Hidden, since it might cause issues
git clone --depth=1 https://github.com/CodenameCrew/CodenameEngine.git
git fetch --unshallow
-->