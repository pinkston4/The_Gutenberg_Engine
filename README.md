# The Gutenberg Engine

Project Gutenberg is a public archive of all works of literature, and some music, within th public domain. It has existed since 1971 and has so far amassed a collection of over 55,000 works. And is projected to almost double in size by the end of 2019, with the expiration of the Copyright Terms Extension Act of 1998. Unfortunately despite their size and beautiful collection, they are not that well known. And their website is not that easy to navigate, so even if their archive contained the work you were looking for, that does not mean you are guaranteed to find it.
And that's where The Gutenberg Engine comes into play. The Gutenberg engine is a search tool for the archive. Allowing students, educators, or just people in general to access the archive and find what they need without having to jump through hoops.

![alt tag](https://github.com/pinkston4/The_Gutenberg_Engine/blob/master/img/gutenbergEnging.png)

## Set Up Locally
1. Before you clone this repo you will need to install R (and preferably, but not required, Rstudio as well)
1. You will need to download all metadata pertaining to project gutenbergs archive from https://www.gutenberg.org/wiki/Gutenberg:Feeds (scroll to the bottom of the page and look for the section entitled: "The complete project gutenberg catalog")
1. After you have the metadata files/folders following the instuctions here https://github.com/pinkston4/R_gutenberg_db so you can build the database
    -Unfortunately the redland package by default does not actually include the bdb option. I was using R with anaconda and the conda package manager, which required me to build all packages for R from source instead of doing a normal install. But if you build from source using conda then you should be good to go. No extra hoops.
1. Once the database is built you can clone this project down and move all database files (there should be 3) into this projects directory and then you should be good to go.
