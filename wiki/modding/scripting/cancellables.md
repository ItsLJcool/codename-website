---
author: clairedeluneee
desc: Explains what Events are and why Codename Engine uses them to their fullest extent.
lastUpdated: 2025-11-15T05:32:50.298Z
title: Scripting - Event Callbacks
---
*This is about the callbacks HScript calls in scripts. For the creation of custom events, see [Custom Events / Notetypes](./events.md).*

Callbacks are an integral part of scripts as they fire when specific things happen in the engine, such as frame updates, state creation, and others. All scripts leverage this in order for them to do their thing.

## Key callbacks
These are present in nearly every state you're in.
| Name      | When this is called |
| ----      | ------------------- |
| `create`  | State creation |
| `postCreate` | After state variables are instantiated (are not `null`) |
| `update`  | Every frame (sprite updating) |
| `draw` | Every frame (render sprites to screen) |
| `destroy` | State destruction (such as switching states) |

# `CancellableEvent`
Majority of the callbacks, especially in `PlayState`, inherit the `CancellableEvent` class, which means that the specific callback may be **cancelled** if you wish to change what the callback usually does.

For example, take the below callback that is called once the countdown is started.
```hx
function onStartCountdown(event) {

}
```
If you wish to stop the countdown from starting, you call `event.cancel()`, like so:
```hx
function onStartCountdown(event) {
    event.cancel(); // Stops the event from continuing.
}
```
If you have worked with PsychLua before, you might see this method familiar. That's because this is exactly the Codename equivalent of `Function_Stop`. Here's an equivalent of the above code in Lua:
```lua
function onStartCountdown()
    return Function_Stop
end
```



Next steps in learning the In-and-out's of HScript
- [Features](./features.md)
- [[PREV] Formatting, and Basic Syntax](./style.md)
- [Event Callbacks](./cancellables.md)
- [[NEXT] PlayState Interaction](./playstate.md)
- [Custom States / SubStates](./states.md)
- [Custom Events / Notetypes](./events.md)
- [Global Script](./global.md)
- [Custom Classes](./classes.md)