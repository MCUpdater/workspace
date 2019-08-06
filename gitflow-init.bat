@echo off
for /F "tokens=*" %%A in (projects) do (
    cd %%A
    git checkout master
    git checkout develop
    git flow init
    cd ..
)