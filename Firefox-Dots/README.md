# Firefox Dot Files
Custom Firefox profile with CSS customizations

## Install

### Step 1: Install Firefox
```
sudo apt-get update
sudo apt-get install firefox
```

### Step 2: Create Projects directory and clone repo
```
mkdir ~/Projects
```
This is so all the the aliases will work
```
git clone git@github.com:garrettleising/dots.git ~/Projects/dots
```

### Step 3: Install Firefox customizations
```
sh install.sh
```

### Step 4: Restart Zsh
```
exec zsh
```
