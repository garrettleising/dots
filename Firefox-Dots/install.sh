#!/bin/bash

cp -r ~/Projects/dots/Firefox-Dots/startpage/ ~/.mozilla/firefox/*.default/
cp -r ~/Projects/dots/Firefox-Dots/chrome/ ~/.mozilla/firefox/*.default/
cp -r ~/Projects/dots/Firefox-Dots/newtab/ ~/.mozilla/firefox/*.default/

echo "Finished Firefox dots install!"
