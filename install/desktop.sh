#!/bin/bash

# Run desktop installers
# These apps are intentionally not part of this workstation baseline.
skip_installers=(
	"app-libreoffice.sh"
	"app-localsend.sh"
	"app-signal.sh"
	"app-typora.sh"
	"app-xournalpp.sh"
)

for installer in ~/.local/share/omakdeb/install/desktop/*.sh; do
	installer_name=$(basename "$installer")

	if [[ " ${skip_installers[*]} " == *" $installer_name "* ]]; then
		continue
	fi

	source "$installer"
done

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot || true
