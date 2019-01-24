if not command -s pyenv > /dev/null
    echo "Install <github.com/yyuu/pyenv> to use 'pyenv'."
    exit 1
end

set --local pyenv_root ""

if test -z "$PYENV_ROOT"
    set pyenv_root ~/.pyenv
    set --export PYENV_ROOT "$pyenv_root"
else
    set pyenv_root "$PYENV_ROOT"
end

if status --is-interactive
    if set --local index (contains --index -- $PYENV_ROOT/shims $PATH)
        set --erase PATH[$index]
    end
    set -export PATH "$pyenv_root/shims" $PATH
    set -export PYENV_SHELL fish
end
command mkdir -p "$pyenv_root/"{shims,versions}
