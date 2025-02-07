function config --wraps='/usr/bin/git --git-dir=/Users/tillkammerer/.cfg/ --work-tree=/Users/tillkammerer' --wraps='git --git-dir=$HOME/.cfg/ --work-tree=$HOME' --description 'alias config=git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
        
end
