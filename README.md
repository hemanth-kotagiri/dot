### Vim 


- I would recommend the following plugin managers:

    Note: Make sure to install Git.\
    Personally, I use Vim-Plug.

    1. [Vim-Plug](https://github.com/junegunn/vim-plug) 
         - To install in a Windows machine using powershell.
        ```
        iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
            ni $HOME/vimfiles/autoload/plug.vim -Force
        ```
        - To install in a Unix environment.
        ```
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

        ```

    2. [Vundle](https://github.com/VundleVim/Vundle.vim)
        - To install in any environment:

        ```
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

        ```

