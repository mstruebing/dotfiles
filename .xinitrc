xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96
eval $(ssh-agent)
exec i3
