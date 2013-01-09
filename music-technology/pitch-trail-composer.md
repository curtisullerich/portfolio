---
layout: page
title: Pitch Trail Composer
header: Pitch Trail Composer
group: music-technology
---
{% include JB/setup %}

### Pitch Trail Composer and My Experience with Max/MSP

{% fancyimage left /img/sliders.jpg 400x200 Soundboard %}
As my final project for Music 446, Electronic Music Synthesis, I designed and programmed an application in Max/MSP for composing music using "pitch trails" which I defined as a tone moving linearly from one pitch to another; essentially, glissandi.

First, a bit my experience with Max/MSP. Max/MSP is a visual programming environment used for sound synthesis and MIDI processing. I first encountered MaxMSP during my introductory music technology class at Iowa State, [Music 246](http://www.music.iastate.edu/courses/246/), which focuses around mixing and mastering of recorded audio in ProTools. I had a strong interest in the class and wanted to take my involvement a step further than required by the syllabus. I worked with my professor, Dr. Hopkins, to add an additional project component by taking the class for Honors credit. I worked outside of class time to develop an arpeggiator patch in MaxMSP, exploring the environment on my own. I designed the project independently from the ground up, seeking guidance when needed. 

I worked with MaxMSP much more during [Music 446](http://www.music.iastate.edu/courses/446/): Electronic Music Synthesis. This class explores the concepts of additive and subtractive synthesis using software like MaxMSP and ProTools. For an overview of synthesis concepts discussed here, see this brief [discussion](http://www.sonicspot.com/guide/synthesistypes.html). Music 446 is project based, focusing on either instrument design or composition. I chose to explore instrument design, as I already had a strong background in electronic composition. My patch first allowed the user to select a key on  a MIDI keyboard to use as a divider, and then select different waveforms to use above and below this divider. 

For my second project, the additive synthesis unit, I designed an abstraction called pitchtrail~ that generated a glissando from a starting note to an ending note in a specified amount of time. I learned a lot about the inner workings of MaxMSP during this project, as composing using pitch trails pushes many areas of MaxMSP to their limits--primarily timing and processor power.

My inexperience with advanced MaxMSP programming actually furthered my knowledge of how the environment works on a low level; I accidentally implemented some standard library objects to be used in my project, not knowing of their existence until after completing it. In the end, my project worked exactly as I wanted, but was extremely processor intensive. With my DSP setup at the time, this meant that my sample composition ran exactly as expected, just at about 10% of real time.

<b>Download  a standalone version of my Pitch Trail Composer application for [Windows](http://dl.dropbox.com/u/3942841/Pitch%20Trail%20Composer%20-%20Windows.zip) or [Mac OS X](http://dl.dropbox.com/u/3942841/Pitch%20Trail%20Composer%20-%20Mac%20OS%20X.zip).</b>
