#!/bin/bash
# cat << 'EOF'
#
#  ▐▛███▜▌  
# ▝▜█████▛▘
#   ▘▘ ▝▝
#
# Loading...
#
# EOF

# # Fake loading bar
# printf "       ["
# for i in {1..50}; do
#     printf "█"
#     sleep 0.02
# done
# printf "]\n\n"

exec claude "$@"
