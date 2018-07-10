set fish_greeting ""

set PATH /home/danbox/.cargo/bin/ $PATH

#if status is-interactive
#and not set -q TMUX
	#exec tmux
#end

set -x VAGRANT_DEFAULT_PROVIDER vmware_desktop
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 0

