#!/bin/bash

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

cp ~/Projects/dots/Zsh-Dots/.zprofile ~/
cp ~/Projects/dots/Zsh-Dots/.zshrc ~/
cp ~/Projects/dots/Zsh-Dots/themes/garrett.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/
cp ~/Projects/dots/Zsh-Dots/themes/zeta.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/

echo "Finished Zsh dots install!"
