ratwm - dynamic window manager
============================
ratwm is an extremely fast, small, and dynamic window manager for X.


Requirements
------------
In order to build ratwm you need the Xlib header files.


Installation
------------
Edit config.mk to match your local setup (ratwm is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install ratwm (if
necessary as root):

    make clean install


Running ratwm
-----------
Add the following line to your .xinitrc to start ratwm using startx:

    exec ratwm

In order to connect ratwm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec ratwm

(This will start ratwm on display :1 of the host foo.bar.)

In order to display status info in the bar, you can do something
like this in your .xinitrc:

    while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
    do
    	sleep 1
    done &
    exec ratwm


Configuration
-------------
The configuration of ratwm is done by creating a custom config.h
and (re)compiling the source code.
