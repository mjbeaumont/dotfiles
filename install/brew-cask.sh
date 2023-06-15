taps=(
    homebrew/cask-fonts
)

apps=(
    1password
    alfred
    altair-graphql-client
    firefox
    font-fira-code
    font-fontawesome
    google-chrome
    insomnia
    karabiner-elements
    keycastr
    kitty
    meetingbar
    ngrok
    postico
    postman
    sf-symbols
    slack
    spotify
    vlc
    zoom
)

brew tap "${taps[@]}"
brew install "${apps[@]}" --cask
