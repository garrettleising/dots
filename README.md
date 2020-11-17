# Dot Files
Custom Dot Files for my Linux Mint setup

## Install

### Step 1: Install dependencies
```
sudo apt-get update
sudo apt-get install zsh
sudo apt-get install firefox
```

### Step 2: Create Projects directory and clone repository
```
mkdir ~/Projects
```
This is so all the the aliases will work
```
git clone git@github.com:garrettleising/dots.git ~/Projects/dots
```

### Step 3: Install ohmyzsh if not already installed
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Step 4: Install personal themes and plugins
```
sh install.sh
```

### Step 5: Restart Zsh
```
exec zsh
```
