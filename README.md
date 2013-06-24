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
