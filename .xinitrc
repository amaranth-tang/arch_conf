setxkbmap -option caps:swapescape

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xrdb -load ~/.Xresources
numlockx &

exec i3
