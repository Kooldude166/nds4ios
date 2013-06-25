nds4ios - iOS 6 + 7
=======

nds4ios is a port of nds4droid to iOS, which is based on DeSmuME.

http://nds4ios.angelxwind.net/

[DeSmuME](http://desmume.org/) 

[nds4droid](http://jeffq.com/blog/nds4droid/) 

iOS 5 allowed but untested.

Build Instructions
------------------------

IMPORTANT: Make sure your working directory is devoid of spaces. Otherwise, bad things will happen.

### Option 1


1.  Open Terminal and go to your working directory;

2.  Do
<code>git clone https://github.com/angelXwind/nds4ios.git</code>

3.  then
    <code>cd nds4ios</code>

4.  then
    <code>git submodule update --init</code>

5. Open "nds4ios.xcodeproj", connect your device, select it on Xcode and click the "Run" button (or Command + R). Don't build it for the iOS Simulator. IMPORTANT: Make sure you change your running scheme to Release first. Otherwise you will get errors on compile!

#### Option 1a
1. Alternatively, run
    <code>xcodebuild -configuration Release</code>
   from Terminal and then copy the resulting *.app bundle to your /Applications directory on your device.

### Option 2

1. Click the button below from your device or desktop:

<!-- MacBuildServer Install Button -->
<div class="macbuildserver-block">
    <a class="macbuildserver-button" href="http://macbuildserver.com/project/github/build/?xcode_project=nds4ios.xcodeproj&amp;target=nds4ios&amp;repo_url=https%3A%2F%2Fgithub.com%2FangelXwind%2Fnds4ios.git&amp;build_conf=Release" target="_blank"><img src="http://com.macbuildserver.github.s3-website-us-east-1.amazonaws.com/button_up.png"/></a><br/><sup><a href="http://macbuildserver.com/github/opensource/" target="_blank">by MacBuildServer</a></sup>
</div>
<!-- MacBuildServer Install Button -->

### Option 3

1. Install it from the aXw repo if you're jailbroken: [http://cydia.angelxwind.net](http://cydia.angelxwind.net)

How To Load ROMs
------------------------
##### Since this apparently needs explaining

### Option 1
1. Plug your device into your computer and launch iTunes.
2. Go to your iDevice's info page, then the apps tab.
3. drag and drop .nds files that you have (preferably ones you legally own the actual game cartridge for) into the iTunes file sharing box for nds4ios.
4. Kill nds4ios from the app switcher if it's backgrounded, and launch it again to see changes.

### Option 2
1. If you're jailbroken, grab one of the many download tweaks available for Mobile Safari or Chrome for iOS, or grab one of the many web browsers available with download managers built in, such as [Cobium](https://itunes.apple.com/us/app/cobium-simple-browsing/id502426780?mt=8) (This is totally not a shameless plug).
2. With the new browser or tweak, download a rom, preferably one you own the actual cartridge for.
3. Using iFile or similar too, move the .nds file to the nds4ios directory, into the documents folder.
4. Kill nds4ios from the app switcher if it's backgrounded, and launch it again to see changes.

### Option 3 (coming soon)
1. In nds4ios, press the + button in the upper right hand corner.
2. Enter a URL that DIRECTLY links to a rom that preferably you own the actual cartridge for.
3. Hit OK, and nds4ios will automatically download and place it into the correct directory. This will probably not work for sites such as c**lr*m or similar redis sites, but will instead work better for files hosted on your own private server.
4. No need to kill and restart nds4ios, it will automatically reload.

To-do
------------------------
###### We'll get to these, really!
* Clean up and refactor code, remove the ugly hacks used (see nds4ios-Prefix and android/log.h)
* JIT/Dynarec (very hard to achieve this using the clang compiler, in progress)
* OpenGL ES rendering
* Sound
* Save states
* Fix loading game saves on some games
* Native iPad UI
* New file chooser (in progress)
* Option to hide the onscreen controls entirely (in progress)
* Change buttons to allow for button sliding.
* Use of cmake to generate Xcode project
* Much more.

Contributors
------------------------
###### We stand on the shoulders of these people
* [The DeSmuME Guys](http://desmume.org/)
* [The nds4droid Guy](http://jeffq.com/blog/nds4droid/)
* [rock88](http://rock88dev.blogspot.com/)
* [angelXwind](http://angelxwind.net/)
* [inb4ohnoes](http://brian.weareflame.co/)
* maczydeco
* [W.MS](http://github.com/w-ms/)
* rileytestut
* dchavezlive
