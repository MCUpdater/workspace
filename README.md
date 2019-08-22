# MCUpdater Workspace

Workspace for the entire MCUpdater project set.

This project uses gradle for builds.  You can clone just this repository locally and it will automatically clone all of the other repositories when you build.

### Gradle commands

Command | Description
------- | -----------
./gradlew setupWorkspace | This will clone all of the repositories for you
./gradlew build | This will build all of the projects (includes setupWorkspace so you can build straight away)

# Creating MCUpdater Launcher
This project lets you create your own redistributable and potentially self updating modpack which you can give as a download and executable package to your playerbase.  Its intended to require as little brain power as technologically possible as well as allow you to add your own branding.

## Launcher Requirements
You will need at least `JRE7` installed on your clients computers to be capable of running this launcher.  That doesn't mean that mods you offer will not require a higher version of JRE like JRE8 but the launcher itself will work on JRE7.  It will launch in JRE6 but only far enough to tell you that its incompatible to avoid cryptic errors and goofy bugreports.

## Compiling Your Own Launcher Requirements
You will need to install these onto whatever operating system your running this build process on.  We're not writing a tutorial on how to install this stuff on 30 different operating systems.  So you'll have to Google it.

    JDK7 Installed (Should build with JDK8 as well.)
    Gradle Installed
    unzip/zip Installed
    https://github.com/MCUpdater/workspace Cloned and Built
    Your pre-generated FastPack xml file.

## Compile your MCUpdater Launcher

#### Step 1: Download the source code.
You can do this with one of two methods you can download the zip file directly.

Heres some vague linux instructions which should work on most linux terminals (this can technically include OS X)

    wget https://github.com/MCUpdater/workspace/archive/master.zip
    unzip master.zip
    cd workspace/

OR

    git clone https://github.com/MCUpdater/workspace.git ./workspace/
    cd workspace/


#### Step 2: Setup your workspace.
Once you've cloned the git repository `gradlew setupWorkspace` and it will download everything for you.


#### Step 3: Customize what modpack launches by default.
You can modify the [gradle.properties](https://github.com/MCUpdater/workspace/blob/master/gradle.properties) file to change the defaultPack to your own.

#### Step 4: Define java launch arguments.
Then in [MCU-Bootstrap/src/main/resources/config.properties](https://github.com/MCUpdater/MCU-Bootstrap/blob/master/src/main/resources/config.properties#L5), you can set passthroughArgs to something like "--defaultMem 4G" to make the default for min/max memory 4G (instead of 1G)

#### Step 5 (optional): Customize launcher name
If you want to change the generated path where it installs/saves the instances and settings for MCUpdater, open MCU-Bootstrap/src/main/java/org/mcupdater/BootstrapForm.java and change lines [88](https://github.com/MCUpdater/MCU-Bootstrap/blob/master/src/main/java/org/mcupdater/BootstrapForm.java#L77), [92](https://github.com/MCUpdater/MCU-Bootstrap/blob/master/src/main/java/org/mcupdater/BootstrapForm.java#L81), and [97](https://github.com/MCUpdater/MCU-Bootstrap/blob/master/src/main/java/org/mcupdater/BootstrapForm.java#L86) to change MCUpdater to something like MyServerLauncher

#### Step 6 (optional): Add your own Logo/Graphics.
If you so desire, you can also replace the [MCU-Bootstrap/src/main/resources/bg_main.png](https://github.com/MCUpdater/MCU-Bootstrap/blob/master/src/main/resources/mcu-logo-new.png) and mcu-logo-new.png files to display your own logo as well.

#### Step 7: Build your launcher.
Once you have made the changes you want, you can go back to the directory that has gradlew and execute it like this: "gradlew clean MCU-Bootstrap:build gatherArtifacts"

#### Step 8: Admire your work and be happy.
Once it finishes, you'll have a bunch of files in build/Artifacts

The one you want is MCU-Bootstrap.jar.

## Creating your own FastPack XML file.
This is an example which will generate the file which is required for completing **Step 3**.

[Basic Documentation for MCU-FastPack-latest.jar](http://mcupdater.com/fastpack-basics/)

    java -jar MCU-FastPack-latest.jar --path fptest --baseURL http://files.mcupdater.com/fptest --mc 1.7.10 --out FPTest.xml --id fptest --name "FastPack Test" --forge 10.13.4.1448

## FastPack directory structure.

    fptest
    ├── config
    │   └── Carnivora.cfg
    └── mods
    ├── carnivora-0.1.3.jar
    ├── ebxs-autumn-woods-0.0.3.jar
    └── ebxs-core-0.1.3.jar
