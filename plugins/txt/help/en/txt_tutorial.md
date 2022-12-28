---
toc: 4 - Writing the Story
tutorial: true
summary: How to send telegrams.
---
# Telegrams

The telegram plugin lets you send telegram messages to other characters.

It is generally considered fine to start a telegram scene with someone without permission - as long as you recognize that they may not see or respond to telegrams in a timely fashion. Please don't take the length of time between telegrams to be IC; sometimes OOC factors delay someone's ability to respond.

[[toc]]

##Sending Telegrams without a Scene

On the game, you can telegram characters online by sending a telegram without specifying a scene number. These telegrams are not added to any scene and will not be logged or saved unless you do so manually.

Do `telegram <name>=<message>` to send a telegram without adding it to a scene.

> **Note:** Telegraming characters without an attached scene only works when all characters are logged in to the game via telnet; it will not work via the portal. Telegraming via the portal requires a scene.

##Sending Telegrams in a Scene

###Starting a Scene

On game, you can start a new telegram scene in one easy step.

`telegram/newscene <name> [<name}]=<message>`

This will start a new scene, set the location and scene type, emit the telegram to all characters currently online, and add the telegram to the scene.

On the portal, you will need to [start a scene](/help/scenes_tutorial#starting-a-scene) and set the location (Telegram) and type (Telegram) manually.

###Replying to Telegrams

####On Game
If someone sends you a telegram, you can quickly reply to the telegram using `telegram/reply=<message>`. This will send your telegram to everyone in the recipient list and add it to the scene. To see who last telegramed you, type `telegram/reply`

On the game, the 'telegram' command will remember the last character and scene you telegramed. If you continue to telegram the same person, you can simply do `telegram <message>`.

If you're telegraming several different recipients or to several different scenes at once, you'll need to specify who you are telegraming and what scene it should be added to by doing `telegram <name> [<name}]/<scene>=<message>`.

If you telegram someone who was not previously in that scene, they will automatically be added to the scene.

####On the Portal
Telegrams sent from the portal add the telegrams to the scene and emit to anyone who is online on the game.

Send telegrams by using the 'Txt' button next to the 'Add OOC' and 'Add Pose' buttons on the portal. By default, this button telegrams everyone in the scene.

To send telegrams to a different recipient list, do `<name> [name]=<message>` and use the 'Txt' button.

##Telegram Settings

###Telegram Color

You can choose a personal telegram color to make telegram scenes more readable. Do `telegram/color <color>` to set your personal color.  You can view available colors by doing `colors`, `colors1`, `colors2`, etc.

Use the full ansi color format for this, ex: \%xh\%xr for red highlight, \%xh\%x46 for bright green highlight, etc.

###Ignoring or Blocking Telegrams

If you do not wish to receive telegrams (in general, or from a specific person), the `page/ignore <name>=<on/off>` and `page/dnd <on/off>` commands will block telegrams as well.
