# Godot template for 2D games

This template provides some basic structure to start a new 2D game with the [Godot engine](https://godotengine.org). 

The template currently includes:
 - A main menu
 - A settings menu
 - A playable level
 - Background music
 - Sound effects

Some generic components are present to speed up the prototyping:
 - A menu system with items highlighting on mouseover and clic sounds
 - A *scene* manager. Here, a *scene* is a set of Godot scenes. One for UI/controls, one for game elements. More can be added. 
 Each Godot scene is loaded in a separate node. This allows the main Godot scene to be always loaded, which helps keeping persistent elements between *scene* loads (e.g background music)
 - A sound effects (FX) manager. In Godot, an AudioStreamPlayer2D can only play one sound at a time. 
 So if multiple sounds have to be played at the same time, multiple AudioStreamPlayer2D must be created and properly managed. 
 The *FXPlayer* class can create a predetermined number of AudioStreamPlayer2D and automatically choose an unused one when asked to play a sound.
 - A settings manager that saves and loads game settings. A signal is emitted when a setting is changed so that it can be handled by another class. 
 Currently stores if the music and/or the sound effects must be played but can easily be expanded.
 - Basic player movement whith sound effect played on collision
 - A pause screen
 
The template can be tested online [here](https://benjaminnavarro.github.io/godot-template-2d/).
 
# Preview
 ![Template2D](https://media.giphy.com/media/U4vXCBuqDroFjDrQEd/giphy.gif)
