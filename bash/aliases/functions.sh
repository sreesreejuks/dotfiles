#!/usr/bin/env bash
#===============================================================================
# Navigation Functions
# Author: srees
# Description: Advanced navigation functions like mkcd and recent directories
# Last Modified: 2026-02-16
#===============================================================================

#-------------------------------------------------------------------------------
# Directory Operations
#-------------------------------------------------------------------------------
# Create and Enter Directory Function
md() {
    mkdir -p "$*" && cd "$*"
}

#-------------------------------------------------------------------------------
# History & Listing
#-------------------------------------------------------------------------------
# Show recent directories
recentdir() {
  local count=${1:-5}
  ls -lt --group-directories-first | awk 'NR>1 && /^d/' | head -n "$count" | nl
}

# Show recent files
recentfiles() {
  local count=${1:-5}
  ls -lt | grep "^-" | head -n "$count" | nl
}