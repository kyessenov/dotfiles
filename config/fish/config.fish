if test -f ~/.bash_aliases
  source ~/.bash_aliases
end

set -gx HOMEBREW_NO_ANALYTICS 1

# Home bin
if test -d $HOME/bin
  set -gx PATH $HOME/bin $PATH
end

# Go stuff
set -gx GOPATH $HOME/go
if test -d $HOME/go/bin
  set -gx PATH $HOME/go/bin $PATH
end
