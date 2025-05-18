#----------------------------------------Commands to Run-----------------------------------------
neofetch

# wal --vte -i ~/Pictures/Wallpapers/Favorites/OrangeRedAbstraction.jpeg

#screenfetch -p

#----------------------------------------ALiases-------------------------------------------------
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

alias update="sudo apt update && sudo apt full-upgrade && omz update"

# edit dot files
alias ma="vim ~/.zprofile" # make alias
alias efsp="code ~/.mozilla/firefox/jiz1ctdu.default/startpage" # edit firefox start page
#---------------------------

alias switchToBash="chsh -s $(which bash)"

alias rconnection="nmcli radio wifi off && nmcli radio wifi on"

# Directory Changes
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias home="cd ~/"
alias p="cd ~/Projects && ls -AlF" # projects

alias st="exec zsh" # st = source terminal

# Just for fun
alias hypetrain="sl"
alias afk="cmatrix -s -b"
alias randoWal="wpg -m"

alias keybr="xdg-open https://www.keybr.com"

alias r=ranger-cd

#----------------------------------------Functions-------------------------------------------------

function ranger-cd {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

function ZshUpdate {
	cp ~/.zshrc ~/Projects/dots/Zsh-Dots
	cp ~/.zprofile ~/Projects/dots/Zsh-Dots
	cp ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/zeta.zsh-theme ~/Projects/dots/Zsh-Dots/themes
	cp ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/garrett.zsh-theme ~/Projects/dots/Zsh-Dots/themes
	cd ~/Projects/dots
}

function FirefoxUpdate {
	cp -r ~/.mozilla/firefox/*.default/startpage/ ~/Projects/dots/Firefox-Dots/
	cp -r ~/.mozilla/firefox/*.default/chrome/ ~/Projects/dots/Firefox-Dots/
	cp -r ~/.mozilla/firefox/*.default/newtab/ ~/Projects/dots/Firefox-Dots/
	cd ~/Projects/dots
}

#Get status of all projects
function pstatus {
  cd ~/Projects/
  ls
  for directory in *; do (cd "$directory" && pwd && git status && echo "\n"); done
}


#Find and open file
function faof {
	local path_variable=$(fzf --height 60% --reverse)
	xdg-open $path_variable
	cd $(dirname $path_variable)
}

#Script to remove duplicate files or photos
function removeDuplicates() {
	for d in ./*/; do (cd "$d" && rm *\(1\)*); done
}

#Change photos from HEIC to JPG in directory
funtion convertHeic() {
for f in *.HEIC; do (heif-convert $f $(basename $f .HEIC)"(converted)".jpg && rm $f); done
}

#Change photos from HEIC to JPG in subdirectories
function convertSubHeic() {
	for d in ./*/; do (cd "$d" && convertHeic); done
}

#Automatically run ls after cding if less than 10 files
function cd() {
   builtin cd $@ && if (( $(ls | wc -l) < 10)); then ls; fi
}
