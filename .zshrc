#自動補完を有効にする
autoload -U compinit; compinit

#補完で小文字でも大文字にマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#もしかして
setopt correct

#色
autoload -U colors; colors

#プロンプト
PROMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "

#キーバインドvim
bindkey -v

#エイリアス
alias rm='rm -i'
alias cp='cp -i'
alias mv='cp -i'
alias mkdir='mkdir -p'

#sudoのあとのコマンドでエイリアスを有効
alias sudo='sudo '

