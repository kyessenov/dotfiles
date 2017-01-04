if test -f ~/.bash_aliases
  source ~/.bash_aliases
end

# Homebrew stuff
if test -d $HOME/homebrew/bin
  set -gx PATH $HOME/homebrew/bin $PATH
end
set -gx HOMEBREW_NO_ANALYTICS 1

# Go stuff
if test -d $HOME/homebrew/go/bin
  set -gx PATH $HOME/homebrew/go/bin $PATH
end
set -gx GOPATH $HOME/homebrew/go
