# vimrc

Execute the following command to make your setup your vim.
```bash
cd ~/.vim
git init
git remove add origin https://github.com/thynson/vimrc.git
git pull origin master
git submodule init
git submodule update
ln -sf ~/.vim/vimrc ~/.vimrc
```

