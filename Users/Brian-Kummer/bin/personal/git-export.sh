# https://ranxing.wordpress.com/2016/12/13/add-zip-into-git-bash-on-windows/
git ls-files --modified --others --exclude-standard | xargs zip "$1"