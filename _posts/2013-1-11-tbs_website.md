---
layout: post
title: TBS Website Rebuild
header: TBS Website Rebuilt
tagline: 
group: blog
category: projects
tags : [web, projects]
---
{% include JB/setup %}

I'm currently the Tau Beta Sigma webmaster. During winter break I finally had time to give the website the attention it needed to standardize and clean up everything. Overall, the original design was clean, but after a couple of webmasters without previous web design experience, things had gotten a little hairy. In some places the CSS had become very hacky and most of the pages actually had invalid HTML that just happened to render nicely in the browser.

I ended up redesigning the site from the ground up, re-implementing the CSS using some CSS3 goodies and fixing some irregularities. 

I learned a lot in the process, and am now confident that I could design a simple site from scratch on my own, which is something I wasn't confident I could do previously.

I switched from the old web album library that required using an external application to generate a bunch of files to using lightbox2, with a PHP script to generate the album page given a directory name with the photos. In order to make it efficient, though, I do still generate thumbnails using imagemagick. 

The biggest switch was from using static member profile pages to dynamic. I created a json file that contains all of the profile information per member and two PHP files: one for the directory page and one for a profile. The directory page reads and sorts all entries, formatting them into a table and inserting links to each profile. The profile page uses URL parameters to locate the member's information in the json file and populate the page with all the information, properly excluding any missing information, and uses a default image if one is not available. 

Because SLOC is always the best metric for project </sarcam\>, here are some stats about the lines of original source (not including libraries):

|      | before | after |
|:-----|:-------|:------|
| php | 4117 | 595 |
| css |  241 | 136 |
| json | 0 | 537 |
| other | 2242 | 80 |
| total | 6600 | 1384 |  
  
<br/> 
Note that the lines of PHP are the total for PHP files, which are mostly HTML in the end. The lines also don't count the Javascript/CSS used in either the original or new photo album libraries. The "other" lines in the old site are due to some extra config files, txt, and html files.

My new implementation of member profiles cut down on a lot of duplication, but more importantly, it standardized the pages and made it trivially easy to add new members to the site or move their profiles to different pages.

After the rebuild, I was able to reduce the site's lines of code by 79%! My goal with the redesign was to make it trivially easy for me to maintain, and very easy for future webmasters to udpate and extend. I learned a lot and had some fun. All in all, a good two days. You can check out the results [here](http://music.iastate.edu/org/kkytbs/tbs/).
