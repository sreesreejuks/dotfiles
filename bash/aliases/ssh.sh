#===============================================================================
# SSH Aliases
# Author: srees
# Description: Shortcuts for SSH connections to remote servers
# Last Modified: 2026-02-16
#===============================================================================

#-------------------------------------------------------------------------------
# Raspberry Pi
#-------------------------------------------------------------------------------
alias rpi5='ssh -i $HOME/.ssh/id_ed25519_rpi5 -p22065 rpi@192.168.1.36'
alias xrpi5='ssh -X -i $HOME/.ssh/id_ed25519_rpi5 -p22065 rpi@raspberrypi5.local'

#-------------------------------------------------------------------------------
# Git Hosts
#-------------------------------------------------------------------------------
alias gitlab='ssh -i $HOME/.ssh/id_ed25519_gitlab git@gitlab.com'
alias github='ssh -i $HOME/.ssh/id_ed25519_github git@github.com'
