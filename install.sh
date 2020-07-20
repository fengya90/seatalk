mkdir -p ~/.local/bin
cp seatalk ~/.local/bin/
mkdir -p ~/.local/share/icons/hicolor/128x128/apps/
cp other/seatalk.png ~/.local/share/icons/hicolor/128x128/apps/
mkdir -p ~/.local/share/applications/
echo -e "[Desktop Entry]\nName=SeaTalk\nGenericName=SeaTalk\nComment=seatalk.io\nExec=seatalk\nIcon=${HOME}/.local/share/icons/hicolor/128x128/apps/seatalk.png\nTerminal=false\nType=Application\nCategories=Network;InstantMessaging;"  > ~/.local/share/applications/seatalk.desktop

