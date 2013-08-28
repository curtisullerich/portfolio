---
layout: page
title: Pitch Trail Composer
header: Pitch Trail Composer
group: music-technology
---
{% include JB/setup %}

### Pitch Trail Composer and My Experience with Max/MSP
{% fancyimage left /img/pitchtrails.png 400x200 Pitch trails %}
As my final project for [Music 446](http://www.music.iastate.edu/courses/446/), Electronic Music Synthesis, I designed and programmed an application in Max/MSP for composing music using "pitch trails" which I defined as a tone moving linearly from one pitch to another; essentially, glissandi.

#### My experience with Max/MSP.
Max/MSP is a visual programming environment used for sound synthesis and MIDI processing. I first encountered Max/MSP during my introductory music technology class at Iowa State, [Music 246](http://www.music.iastate.edu/courses/246/), which focuses around mixing and mastering of recorded audio in ProTools. I had a strong interest in the class and wanted to take my involvement a step further than required by the syllabus. I worked with my professor, Dr. Hopkins, to add an additional project component by taking the class for Honors credit. I worked outside of class time to develop an arpeggiator patch in Max/MSP, exploring the environment on my own. I designed the project independently from the ground up, seeking guidance when needed. 

I worked with Max/MSP much more during Music 446. This class explores the concepts of additive and subtractive synthesis. For an overview of synthesis concepts discussed here, see this brief [discussion](http://www.sonicspot.com/guide/synthesistypes.html). 

Pitch Trail Composer features a canvas  upon which the user draws lines with the mouse. The vertical dimension is pitch and the horizontal dimension is time. A progress bar moves across the canvas as it is played. The pink box in the upper left is a `nodes` object. The placement of the cursor in this box determines the amplitudes of four oscillators used to drive the sound. The four oscillators are sawtooth, square, sine, and white noise, which is run through a bandpass filter, the quality factor of which is adjustable using the slider.  
{% fancyimage center /img/composing.png 984x928 %}  
<br/>
  
Listen to the example from the above image:

<center><iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F74590917&amp;color=33b5e5&amp;auto_play=false&amp;show_artwork=false"> </iframe></center>
All compositions are serialization and can be opened by Pitch Trail Composer. The format is simple, and can be specified by hand or script, if desired.

(Because of the object used in Max to store the data) each line must begin with a unique ID. In Max, I use the system time to generate this. Then, two x-y pairs, and a semicolon. The x-y pairs are pitch and time, but specified as offsets within the graphical representation.  

{% highlight javascript %}
949470049, 49 20 188 91; 
954610060, 60 100 138 20;
968070100, 100 0 274 82;
975940042, 42 15 302 88;
982350148, 148 8 358 69;
993050058, 58 75 357 17;
918510047, 47 55 203 115;
925640100, 100 129 284 60;
{% endhighlight %}

This is an example score of a more complex etude which was part specified with PTC, part in data form.

{% fancyimage center /img/etude.png 1834x769 %}


####Listen to this etude
<center><iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F74578364&amp;color=33b5e5&amp;auto_play=false&amp;show_artwork=false"> </iframe></center>

#### The help file from the application.
> **What you need to know to use Pitch Trail Composer**  
>  
> The large white canvas you see is where you can draw pitch trails (line segments). To input a pitch trail, click the toggle next to "Composing mode" in the main window. After enabling composing mode, don't click anything outside of the composing window. Composing may be enabled at any point, as long as this rule is followed.   
>  
> Move the main playback position via the playback position slider control on the left. Play or pause the composition by clicking the toggle next to play/pause. Note that all pitch trails completely sound after their initation. Pausing playback halts the onset of further pitch trails. This could be used as a performance tool if exploited creatively.  
>  
> You can modify the sound spectrum of the total synthesized output with the parametric equalizer on the left.  
>  
> The pink object in the upper left modifies which oscillator is used to produce sound. The cursor inside the nodes object may be placed manually or controlled during playback. To allow the cursor to move in a circle automatically during playback, toggle the auto-move switch.   
>  
> The synth controlled by the upper left node is subtractive (uses a reson filter), the Q value of which can be modified using the Bandpass Q slider control.  
>  
> To save a composition, click "open" and save the file to disk using the text editor. To erase the current composition (even one open on disk) click "clear." To read a composition file from disk, click "read," select the desired file, and then click "load." If you clear the current composition, you empty the currently opened file. To save it before clearing to start again, open it and select File > Save As  
>  
> The three volume sliders control the left channel, right channel, and combined audio output, respectively.  


**Download a standalone version of my Pitch Trail Composer application for [Windows](/files/ptc-win7.zip) or [Mac OS X](/files/ptc-osx.zip).** I've had mixed luck with getting these to work on various computers. If it doesn't work for you and you would like a copy, let me know, and I'll do what I can to build one for your system. You can also download the Max/MSP source [here](/files/ptc-src.zip), which has been tested with Max 5 and 6 on Windows 7 and OS X.
