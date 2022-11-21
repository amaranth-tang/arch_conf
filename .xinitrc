setxkbmap -option caps:swapescape


xrandr --output HDMI-0 --auto --primary

export GLFW_IM_MODULE=ibus
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

xrdb -load ~/.Xresources
numlockx &

exec i3
