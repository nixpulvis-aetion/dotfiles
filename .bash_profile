# Setup cargo's binary path.
export PATH=$HOME/.cargo/bin:$PATH

# Set the terminal variable helps i3 decide what to do.
if type alacritty > /dev/null; then
    export TERMINAL=alacritty
elif type termite > /dev/null; then
    export TERMINAL=termite
fi

# Start X if we should.
# TODO: Wayland
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 && $USER != "root" ]]; then
    exec startx &> $HOME/.Xoutput
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
