if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Alias
alias flatseal="flatpak run com.github.tchx84.Flatseal"
alias ll="ls -la"
alias discord="flatpak run dev.vencord.Vesktop --disable-gpu"
alias protontricks="flatpak run com.github.Matoking.protontricks"
alias protontricks-launch="flatpak run --command=protontricks-launch com.github.Matoking.protontricks"
alias spotify="flatpak run com.spotify.Client"
alias steam="flatpak run com.valvesoftware.Steam"
alias obs="flatpak run com.obsproject.Studio"
alias monitor="flatpak run io.missioncenter.MissionCenter"


# Add path
set -U fish_user_paths ~/dev/eww/target/release/ ~/bin ~/.cargo/bin
set -U EDITOR nvim

# Remove header
set fish_greeting

starship init fish | source
