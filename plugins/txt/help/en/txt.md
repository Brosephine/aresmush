---
toc: 4 - Writing the Story
summary: How to send telegrams.
aliases:
- telegram
- Telegraming
- telegrams
---
#Telegrams
Send telegram messages to other characters.

> Learn how the telegram system works in the [Telegram Tutorial](/help/telegram_tutorial).

## Telegraming from the Web-Portal
There is a "Telegram" button on any active scene in the web-portal. Telegraming into a scene will send a message in-game, if the character is connected. By default, telegramming on the portal will send a telegram to all participants of the scene.

`<name>=<message>` - Send a message to a specific person from the webportal. Adds recipients to scene if not already a participant.

>  **Note:** Someone who's not logged in may not know they've been telegramed unless they notice their notifications!

## Commands
`telegram/newscene <name> [<name> <name>]=<message>` - Starts a new scene + sends a message to those names + the scene.

`telegram <name> [<name> <name>]=<message>` - Send a message to name(s) outside of a scene.
`telegram <name> [<name> <name>]/<scene #>=<message>` - Send a telegram to name + add it to a scene. Adds recipients to scene if not already a participant.
`telegram [=]<message>` - Send a message to your last telegram target + last scene.

`telegram/reply` - See who last telegramed you.
`telegram/reply <message>` - Reply to the last telegram (including all recipients + scene, if there is one)

<<<<<<< HEAD
`telegram/color <color>` - Color the (Telegram to <name>) prefix. Use ansi color format for this, ex: \%xh\%xr for red highlight, \%xh\%xg for green highlight.
=======
`telegram/color <color>` - Color the (Telegram to <name>) prefix. Use ansi color format for this, ex: \%xh\%xr for red highlight, \%xh\%xg for green highlight.
>>>>>>> 47eaa7455336713d3fe102e09f2d8324a6d0d5aa

>  **Note:** If you do not wish to receive telegrams (in general, or from a specific person), the `page/ignore <name>=<on/off>` and `page/dnd <on/off>` commands will block telegrams as well.
