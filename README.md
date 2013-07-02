nds4ios - iOS 5 ~ 7
=======
### This is not finished software. Do not open issues complaining about games being slow, we know about it already. 

nds4ios is a port of nds4droid to iOS, which is based on DeSmuME.

http://nds4ios.angelxwind.net/

[DeSmuME](http://desmume.org/) 

[nds4droid](http://jeffq.com/blog/nds4droid/) 

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

1. Click the button below to install it right on your device via MacBuildServer.

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

### Option 1 (Preferred Option)
1. In nds4ios, tap on the button in the upper right hand corner.
2. Download a ROM package of a ROM that you own the actual game cartridge for from a site such as CoolROM. It will come in a zip file. You do not have to have any sort of download manager for this, Safari will download zip files.
3. Tap the "Open in..." button in the top left hand corner, and select nds4ios.
4. nds4ios will automatically unzip the file, delete the readme, and refresh itself. Your ROM should show up in the list. Magic!

### Option 2
1. Plug your device into your computer and launch iTunes.
2. Go to your iDevice's info page, then the apps tab.
3. drag and drop .nds files that you have (preferably ones you legally own the actual game cartridge for) into the iTunes file sharing box for nds4ios.
4. Kill nds4ios from the app switcher if it's backgrounded, and launch it again to see changes.

### Option 3
1. If you're jailbroken, grab one of the many download tweaks available for Mobile Safari or Chrome for iOS, or grab one of the many web browsers available with download managers built in, such as [Cobium](https://itunes.apple.com/us/app/cobium-simple-browsing/id502426780?mt=8) (This is totally not a shameless plug).
2. With the new browser or tweak, download a rom, preferably one you own the actual cartridge for.
3. Using iFile or similar too, move the .nds file to the nds4ios directory, into the documents folder.
4. Kill nds4ios from the app switcher if it's backgrounded, and launch it again to see changes.



To-do
------------------------
###### We'll get to these, really!
* JIT/Dynarec (very hard to achieve this using the clang compiler, in progress)
* OpenGL ES rendering
* Sound
* Fix loading game saves on some games
* Ability to set the folder the rom chooser reads from
* Native iPad UI
* Use of cmake to generate Xcode project
* Much more.

Contributors
------------------------
###### We stand on the shoulders of these people
* [The DeSmuME developers](http://desmume.org/)
* [Jeffrey Quesnelle (jeffq), the developer of nds4droid](http://jeffq.com/blog/nds4droid/)
* [rock88](http://rock88dev.blogspot.com/)
* [Karen Tsai (angelXwind)](http://angelxwind.net/)
* [Brian Tung (inb4ohnoes)](http://brian.weareflame.co/)
* [Jesús A. Álvarez (maczydeco)](http://twitter.com/maczydeco)
* [W.MS](http://github.com/w-ms/)
* [Riley Testut (rileytestut)](https://github.com/rileytestut)
* [David Chavez (dchavezlive)](http://dchavez.net)
* [Michael Zhang (Malvix_)](https://twitter.com/Malvix_)
