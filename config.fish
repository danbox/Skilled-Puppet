set PATH /home/danbox/.cargo/bin/ $PATH

if status is-interactive
and not set -q TMUX
	exec tmux
end

set -x VAGRANT_DEFAULT_PROVIDER virtualbox

