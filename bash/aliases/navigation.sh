#===============================================================================
# Navigation Aliases
# Author: srees
# Description: Directory navigation and file management shortcuts
# Last Modified: 2026-02-16
#===============================================================================

#-------------------------------------------------------------------------------
# Directory Navigation
#-------------------------------------------------------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="clear"

#-------------------------------------------------------------------------------
# Listing
#-------------------------------------------------------------------------------
alias la="ls -lah --color=auto"        # List all incl. hidden
alias ll="ls -lh --color=auto"         # List long format

#-------------------------------------------------------------------------------
# File Operations
#-------------------------------------------------------------------------------
alias rd="rmdir"                       # Remove directory
alias cpv="rsync -ah --progress"       # Copy with progress bar
alias mvv="mv -iv"                     # Move interactive verbose


