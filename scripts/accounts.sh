#!/bin/bash
# Combine grep with gpg
gpg --decrypt -q --no-tty ~/Drive/Notes/accounts.md.gpg | grep -i --color=always $1 | less -R
