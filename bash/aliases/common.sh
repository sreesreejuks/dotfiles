#!/usr/bin/env bash
#===============================================================================
# Common Aliases
# Author: srees
# Description: General utility aliases for text processing, clipboard, and safety
# Last Modified: 2026-02-16
#===============================================================================

#-------------------------------------------------------------------------------
# Text Operations
#-------------------------------------------------------------------------------
alias tolower="tr 'A-Z' 'a-z'"
alias toupper="tr 'a-z' 'A-Z'"

#-------------------------------------------------------------------------------
# Clipboard Operations
#-------------------------------------------------------------------------------
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'

#-------------------------------------------------------------------------------
# Text Editing & Tools
#-------------------------------------------------------------------------------
alias ts="date '+%Y-%m-%d-%H-%M-%S'"  # Generate timestamp
alias nano="nano -c"                   # Enable line numbers in nano
alias grep="grep --color=auto"         # Highlight grep matches
alias fz="fzf"                         # Quick search in files

#-------------------------------------------------------------------------------
# Safety Nets
#-------------------------------------------------------------------------------
alias cp='cp -iv'   # Interactive + Verbose
alias rm='rm -I'    # Prompt if deleting >3 files or recursive

#-------------------------------------------------------------------------------
# History
#-------------------------------------------------------------------------------
alias h='fc -l 1'   # List history with numbers (from 1)
