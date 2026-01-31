---
author: ItsLJcool
desc: Explains how Custom Classes work
lastUpdated: 2025-11-15T05:32:50.298Z
title: Scripting - Custom Classes
---

# TODO:
Explain how you define custom classes, and detail the current limitations as follows:
- Cannot extend FlxState and use for actual States. (Including things that EXTEND FlxState)
- Static Variables are not exactly static.
  - They are only locally static. You can explain how to make a true static class with GlobalScript.
  - UPDATE: This is being changed (fixed) as it was an issue.
- Extended classes must override a function if you also want to override that function.

Also explain you can use the `source/` folder in your Library to add Custom Classes, and show how you can use `import` and `using`.