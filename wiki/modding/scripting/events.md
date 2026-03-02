---
author: clairedeluneee & ItsLJcool
desc: Explains what Events are and why Codename Engine uses them to their fullest extent.
lastUpdated: 2026-03-02T02:45:00.298Z
title: Scripting - Events
---

# TODO
Explain what [CancellableEvent](../../../api-docs/funkin/backend/scripting/events/CancellableEvent.html) does, and how you use Events to alter how source code handles it's functionality.

Also explain how you can use them for your applications!

<!-- 
Was originally made for the chart editor but decided to just place it here. 
-->
## Creating Custom Events
As is with anything else in this engine, custom events may be created to aid with various stuff that happens in songs.

To create a custom event, place a `.json` and a `.hx` in the folder `data/events` in your mod folder. Ensure that the file names match.

### The JSON
Your `.json` holds the all the parameters the event needs, and each parameter may be a different type and a default value. All parameters are listed in the code block below.
```json
{
    "params": [
        {
            "name": "Bool",
            "type": "Bool",
            "defaultValue": true
        },
        {
            "name": "Int",
            "type": "Int(0, 99, 1)",
            "defaultValue": 0
        },
        {
            "name": "Float",
            "type": "Float(0, 99, 1, 2)",
            "defaultValue": 0.00
        },
        {
            "name": "String",
            "type": "String",
            "defaultValue": "nothing"
        },
        {
            "name": "StrumLine",
            "type": "StrumLine",
            "defaultValue": 0
        },
        {
            "name": "ColorWheel",
            "type": "ColorWheel",
            "defaultValue": "#FFFFFF"
        },
        {
            "name": "DropDown",
            "type": "DropDown('entry one', 'entry two')",
            "defaultValue": "entry one"
        }
    ]
}
```
You may copy the above code block for your own JSON file.
- `Bool` generates a checkbox that returns either true or false.
- `Int(min, max, step)` returns an Int and has 3 parameters.
  - `min` is how low the value can get.
  - `max` is how high the value can get.
  - `step` determines how much each step can get (for example, stepping by 10, 15, and so on).
- `Float(min, max, step)` functions the same as `Int(min, max, step)`, except this uses Floats which allow for decimal input.
- `String` returns a string.
- `StrumLine` allows picking a specific strumline. This returns the index of where the picked strumline is located in the `strumLines` group, which is determined by how the chart's strumline is ordered.
- `ColorWheel` generates a color wheel, and returns the color as an Int, following the `0xAARRGGBB` format.
- `DropDown('entry1', 'entry2'...)` restricts the input to only the values put inside the parenthesis. Each value must be enclosed with a single quote `'` and must be separated by a comma `,`.

### The Script
With the JSON set, you may start work on your script file. The script may use only the `onEvent` callback, but nobody's stopping you if you wish to add more functionality. Event scripts are only ran if the corresponding event is used in the editor, so keep that in mind.

Below is a quick template you may use. The `"name"` is a placeholder, which means you need to plug in the name of your event.
```hx
function onEvent(e) {
    if (e.event.name != "name") return;

    var params = e.event.params;
    // code goes here
}
```
An important thing to note is that `e.event.params` returns an **array**, which means you will have to go back and forth between your script and your JSON, since the order of a parameter depends on where you put it in the JSON.

### The Icon
Icons are not required, but it is suggested that you make one, especially if you intend to have others use your event, or if you're charting and have a lot of events. Icons should have a size of 16x16 pixels, and should be put in `/images/editors/charter/event-icons`. Make sure that the name for the icon matches the name of the event.

Next steps in learning the In-and-out's of HScript
- [Features](./features.md)
- [[PREV] Formatting, and Basic Syntax](./style.md)
- [Event Callbacks](./events.md)
- [[NEXT] PlayState Interaction](./playstate.md)
- [Custom States / SubStates](./states.md)
- [Global Script](./global.md)
- [Custom Classes](./classes.md)