# Brew

https://brew.sh

https://github.com/Homebrew/install

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

https://formulae.brew.sh

https://github.com/Homebrew/brew

https://github.com/Homebrew/homebrew-core

https://github.com/Homebrew/homebrew-cask

https://github.com/Homebrew/homebrew-services

```
brew list
brew update
brew upgrade -n

brew search bash
brew info bash
brew install bash
brew uninstall bash

brew search --cask chrome
brew info google-chrome
brew install --cask google-chrome

brew config
brew doctor -v
```

https://github.com/homebrew/install#uninstall-homebrew

```
brew remove --force $(brew list) --ignore-dependencies
brew uninstall $(brew list --cask)
brew cleanup
brew cleanup -s
rm -rf "$(brew --cache)
```

Related history
- https://scriptingosx.com/2019/06/moving-to-zsh/

Ideas
- disable chrome autoupdates


# Setapp


# Apple

```
Short user, host names
echo $USER@$HOSTNAME
sc@mbp.lan

Software Update

App store - Xcode

#xcode - Preferences - Locations - Command line tools = "Xcode 10.1"
#xcode-select --install

Terminal Preferences 
Profiles - Keyboard - Use option as meta key
Profiles - Text - Font 18pt

System Preferences

General - Appearance Dark
Sidebar icon size large
Show scroll bars always

Desktop & Screen Saver black

Mission Control - Hot Corners - null, mission control, desktop, null

Notifications
Do Not Disturb from 6pm to 6am

Internet Accounts
iCloud - disable mail, news, stocks

Accessibility - Pointer Control - Trackpad Options - Enable dragging with 3 fingers, Bump scrolling speed

Extensions - disable added extensions

Security & Privacy 
General
Require password 4 hours after sleep
Allow apps downloaded from App Store and identified developers
FileVault On, create a recovery key and do not use my iCloud account
Firewall On - Block all incoming connections
Privacy
Apple advertising - uncheck personalized ads
Analytics - uncheck all

Software update:
Check for updates 
Download new updates when available
Install system data files and security updates

Keyboard
Adjust brightness in low light
Turn backlight off after 30s
Press Fn key to show emoji & symbols
Modifier keys - Caps Lock Key = Escape

Trackpad - Bump tracking speed

Displays 
Display - Optimize for DELL U2711 / Best for DELL U2711
Automatically adjust brightness
Night Shift - 4pm to 6am, 75%

Battery - Health - Manage battery longevity

Finder
View - Show Path Bar, Show Tab Bar
Favorites
+ workspace, scratch, deploy, home, desktop 
- Setapp, Documents
Collapse: locations, Tags 
```

![Dock](dock.png)
![Touch Bar](touchbar1.png)
![Touch Bar](touchbar2.png)


## Time Machine

```
System Preferences -> Time Machine
Back Up Automatically
Select Disk: time_machine_backups
Exclude:
Macintosh HD
time_machine_backups
+ all APFS volumes on usb HDD

sudo echo "" > sc.cron.log
sudo chown sc /var/log/sc.cron.log

$ crontab -l
crontab: no crontab for sc

$ crontab -e
*/5 * * * *  tmutil localsnapshot >>/var/log/sc.cron.log 2>&1

$ crontab -l
*/5 * * * *  tmutil localsnapshot >>/var/log/sc.cron.log 2>&1
```


# Get Backup Pro

- bootable clone
- home
- workspace
