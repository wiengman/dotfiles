if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Add path
set -U fish_user_paths ~/dev/eww/target/release/ ~/bin ~/.cargo/bin
set -U EDITOR nvim
set fish_greeting

starship init fish | source
