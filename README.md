I own a 2015 Mazda 3.  The entertainment system -- Mazda calls it an _Infotainment system_ --
does this annoying thing when start the car: it pops up a disclaimer dialog  like this:

![](disclaimer-dialog.jpg)

The dialog goes away after a few seconds even if you don't press the big red button.  

It turns out the entertainment system runs Linux, and you can upgrade the firmware using
one of the USB ports.  People have written tweaks to that firmware.  There's even an open-source
project, [AIO](https://mazdatweaks.com/), that lets you choose from a menu of tweaks and then writes the appropriate files to a directory that you can copy to your USB drive.

I wanted to install AIO to try it out, but I didn't want to clutter up my laptop with all the 
crud that the AIO Debian package depends on.  So I wrote a Dockerfile that installs AIO in a 
container.  

Assuming Docker is already installed, you just go to the top of this project and run this:

    docker build -t mzd .

To run the image, do this:

    docker run -ti --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix mzd bash

In a separate shell, do this:

    docker exec -ti $(docker ps -q) bash

Then once you're inside the container, do this:

   /opt/MZD-AIO-TI/AIO

That should start the tweaks program.  After you compile your tweaks, AIO will write the results
to the /root/Desktop/_copy_to_usb inside the container.  You can copy them back out of the containerlike this:

    docker cp $(docker-ps -q):/root/Desktop/_copy_to_usb /tmp/_copy_to_usb

