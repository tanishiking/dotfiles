export ZDOTDIR=$HOME/.zsh

path_prepend_if_exists() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) [ -d "$1" ] && export PATH="$1:$PATH" ;;
    esac
}

if [ -z "$JAVA_HOME" ] && [ -d "$HOME/.sdkman/candidates/java/current" ]; then
    export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
fi

[ -n "$JAVA_HOME" ] && path_prepend_if_exists "$JAVA_HOME/bin"
path_prepend_if_exists "$HOME/.local/bin"
unset -f path_prepend_if_exists
