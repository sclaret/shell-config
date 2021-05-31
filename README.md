# Bootstrap

``` bash
/bin/bash <(curl -fsSL "https://raw.githubusercontent.com/sclaret/dotfiles/master/bootstrap/github?$(date +%s)")
/bin/bash <(curl -fsSL "https://raw.githubusercontent.com/sclaret/dotfiles/master/bootstrap/dotfiles?$(date +%s)")

#/bin/bash <(curl -fsSL "https://raw.githubusercontent.com/sclaret/dotfiles/master/bootstrap/hard_reset?$(date +%s)")
```


# Vim

- https://github.com/vim/vim
- https://formulae.brew.sh/formula/vim
- https://neovim.io


# Emacs

- https://www.gnu.org/software/emacs/
- https://formulae.brew.sh/formula/emacs
- https://github.com/bbatsov/prelude
- https://www.spacemacs.org

``` bash
t .emacs.d/ .spacemacs*
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
editing style: vim, distribution: spacemacs
~/.spacemacs
dotspacemacs-configuration-layers
git
markdown
```
