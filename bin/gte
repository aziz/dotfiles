#!/bin/bash
# This script will create a .gitignore  file in all empty subdirectories

find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \; 
