# Dotfiles .:.

##### Update the `.gitignore` file when a new dotfile is added

Use `git add -f <path>` then, `:r !git ls-files` in Vim to paste the complete
list. Simply add a `!` in front of each path to exclude them from the current
ignorelist.
