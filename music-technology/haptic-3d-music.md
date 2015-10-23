---
layout: page
title: Haptic 3D Music
tagline: honors project
group: music-technology
---
{% include JB/setup %}
 
This page is about my capstone project for the Honors program at Iowa State University. Under the guidance of Christopher Hopkins in the Music department and Tien Nguyen of the department of Electrical and Computer Engineering, I used scripting to modify haptic-enabled virtual reality environments. I used H3D API, X3D, and Python to design creative ways of interacting with 3D scenes for the purpose of electroacoustic music composition and performance. 

{% fancyimage center /img/theramin.png 1000x1000 A 3D theramin of sorts. %}

This is one example of haptic interaction, in which I mapped the x, y, and z axes to three different musical parameters to create a sort of virtual theramin. My first design in this project was implementing an H3D prototype to allow manual translation of any shape in any coordinate system with minimal implementation detail for the user. Next I worked on creating a variable grid that allows the user to specify the size in each dimension. The LineSet composing the grid is generated in Python and contained in a prototype. The code is currently not online, but if this would help you out, just ask.

All audio generation is done in Max/MSP. Parameters are sent to Max over Open Sound Control (OSC), a messaging protocol implemented in this case in Virtual Environment Sound Control (VESC), Dr. Christopher Hopkins, PI, Karl Svec graduate research assistant, with myself and Cameron LaFollette as undergraduate research assistants.

I used all three of these to work on my final project during my second semester elbow-deep in H3D. I created a checkerboard-like interface for controlling the x-y pair inputs to a [Euclidean rhythm](http://www.hisschemoller.com/2011/euclidean-rhythms/) generator. I created another Python/X3D module that allows the user to spawn new discs by pressing a button. This required creating a routing structure for tracking all of the discs dynamically and reporting their current positions to Max/MSP.

During my final semester, I worked with another undergrad, Darren Hushak, on a virtual instrument design based on textures. I have become very interested in [mapping](http://delivery.acm.org/10.1145/1090000/1085207/p1-hunt.pdf?ip=65.110.254.40&acc=ACTIVE%20SERVICE&CFID=251752148&CFTOKEN=87889625&__acm__=1357930181_e70cb6d6d87420859d3df035d906b669) recently, so I used the same reporting
structure designed for the Euclidean rhythms generator to report the frictional values of the currently touched surface over OSC. In Max/MSP we combined these parameters with force, orientation, and velocity values retrieved from the haptics device using various mappings for sound synthesis.

Darren and I worked together on a recital full of original computer music pieces in the fall of 2013. You can watch it on YouTube, [including](http://www.youtube.com/c/curtisullerich) cleaner studio versions of several pieces.
