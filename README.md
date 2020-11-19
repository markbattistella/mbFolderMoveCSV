# Folder Mover from CSV file

## Requirements

1. Powershell with administrator rights

1. Access to the remote shares

1. System can run unsigned scripts

## Files

### [folder-move-basic](/folder-move-basic)

A stripped down version of the `folder-move-intermediate` script. Mostly just moving and nothing too special.

### [folder-move-intermediate](/folder-move-intermediate)

This script has move of the movements for placing folders into sub-folders, creating the new directories, and a few error checking steps.

### [folder-move-advanced](/folder-move-advanced)

This script is designed for moving the child items (files and folders) from `directory1` to `directory2`.

It then creates shortcuts in the original location to the moved destination files and folders.

# How to use

1. _**Run once:**_ run the code on line 6 in a Powershell window to enable the scripts running

1. Read the comments in the script and change it accordingly

1. Triple check the CSV you are using is relevant to the columns being pulled and used in the scripts
