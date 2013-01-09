---
layout: page
title: Kontakt Scripting
header: Kontakt Scripting
group: music-technology
---
{% include JB/setup %}

{% fancyimage left /img/speaker.jpg 350x200 Speaker %}
While taking Music 346 (Sampling Synthesis) I wrote a variety of Kontakt Scripts. Kontakt is a MIDI sampling engine that, at its most basic level, maps a set of audio samples to MIDI events like key presses. I had some fun with it and wrote some cellular automata and basic algorithmic improvisation into my projects.  

#### Conway's Harp of Life
Conway's Game of Life, one of the most popular cellular automata models, is a mathematical game in which the life or death of a cell is iteratively calculated by the number of neighboring cells alive in a 2D grid. I used Conway's rule set to generate music. Keyboard presses placed a specific arrangement of live cells onto the grid called a 'glider.' These move across the grid diagonally, which creates interesting musical patterns. On my grid, I had the horizontal dimension correspond to the velocity with which the key was hit, and the vertical dimension correspond to the MIDI note number (pitch) of the key. On each iteration, the 'live keys' are all struck. Because using a full chromatic range sounds like slamming one's fists against the keyboard, I reduced the allowable keyset to those within a four-tone arpeggio. Based on a previous concept, I added dials to the UI that allow the user to dynamically change the current key and mode of the note set, within the 12 western keys in major, minor, augmented, diminished, and half-diminished.  

One particular challenge of this is the lack of functions or data structures in the scripting language aside from 1D arrays. I wrote out all of the 2D array indexing manually based on 2D logic. It was a fun exercise, trying to conform to the lack of features in the language. You can download the script, Kontakt instrument, and audio samples [here](https://dl.dropbox.com/u/3942841/Conway.zip).  

#### Scat Engine
I also wrote an integrated Kontakt instrument designed to be a scat singing engine. I recorded a friend singing five words containing about a dozen syllables across a three octave range. I used start consonants b, d, z; vowels ah, ee, oo, ih; and ending consonants m, p, and t. I used amplitude envelopes in Kontakt to extract individual phonemes from the words and used scripting to sequence them as full scat words based on user-configurable settings. One mode was deterministic (hard coded by the user) and another was set based on probabilities that a particular syllable would be used. This creates the most realistic effect, while the deterministic mode allows the user to create a chorus of "doos" or "ahs," for instance.  

On top of this scat machine, I wrote an algorithmic improvisation script that detects chords held on the keyboard and triggers consonant notes in an improvisational fashion. For each supported three or four notes chord type I have a hard-coded list of notes that are allowed to play when each chord is held. All note selections and chord detections disregard octaves. Notes are triggered in an on-listener callback that is dependent on Kontakt's metronome speed, and the user can select both a subdivision and a duration. I confine the distance between consecutive notes to within a fifth, so that large jumps do not happen. When a note is selected that does not fit this parameter, it is simply not played, which increases the rhythmic interest. Every twenty notes, 12, 0, or -12 is randomly added to the note offset so that the improvisation slowly moves through the range of the instrument.  

Chord detection proved to be an interesting problem that wasn't terribly hard to solve. I loop through the values 0 through 11, checking a particular pattern of intervals using a mod operation to handle wrapping across octaves. To detect any type of chord, the scripter needs to specify the interval set inside the loop. Upon detection, the root note is immediately known, so the key can be set, and any action can be performed (note generation, in my case).  

You can download my [scat](https://dl.dropbox.com/u/3942841/scat.kscript) and [improv](https://dl.dropbox.com/u/3942841/improv.kscript) Kontakt scripts.

