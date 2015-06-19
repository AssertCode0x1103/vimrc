
-------------------------------------------------------------------------------
vimrc File Directions
-------------------------------------------------------------------------------

Linux:
   # Link vim-dotfiles to ~/.vim
   git clone http://ssdfwlinux100.rochester.hgst.com/thallett/vim-dotfiles.git
   ln -s vim-dotfiles ~/.vim

   # Add a symlink to vim-dotfiles/.vimrc
   ln -s vim-dotfiles/.vimrc ~/.vimrc

   # Create temp dirs
   mkdir ~/.vim/{backup,tmp}

Windows:
   # Checkout repository to ~\vimfiles
   cd %HOMEDRIVE%%HOMEPATH%
   git clone http://ssdfwlinux100.rochester.hgst.com/thallett/vim-dotfiles.git vimfiles

   # _vimrc --- Copy .vimrc to _vimrc
   copy .vimrc ..\_vimrc

   # Create temp dirs
   mkdir %HOMEDRIVE%%HOMEPATH%\vim
   mkdir %HOMEDRIVE%%HOMEPATH%\vim\backup
   mkdir %HOMEDRIVE%%HOMEPATH%\vim\tmp

-------------------------------------------------------------------------------
git Submodule Update Directions
-------------------------------------------------------------------------------
To get the git submodules primed/checked out, do the following
  git submodule init
  git submodule update

TODO:  Ask Tim 
