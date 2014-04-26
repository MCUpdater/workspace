MCUpdater Workspace
===================

Workspace for the entire MCUpdater project set.

This project uses gradle for builds.  You can clone just this repository locally and it will automatically clone all of the other repositories when you build.

Gradle commands
===============
./gradlew setupWorkspace    This will clone all of the repositories for you
./gradlew build             This will build all of the projects (includes setupWorkspace so you can build straight away)
