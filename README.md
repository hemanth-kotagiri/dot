![image](./image.png)

<table>
    <tr>
        <td>Operating System</td>
        <td>Arch Linux</td>
    </tr>
    <tr>
        <td>Editor</td>
        <td>Vim</td>
    </tr>
    <tr>
        <td>Terminal Emulator</td>
        <td>Alacritty</td>
    </tr>
    <tr>
        <td>Window Manager</td>
        <td>i3</td>
    </tr>
    <tr>
        <td>File Manager</td>
        <td>Ranger</td>
    </tr>
</table>

### Vim
I use the Nightly build, so some features may not work if you install previous builds and intend to use my configuration.

- To install in Arch :
     ```
     sudo pacman -S neovim
     ```

    Note: Make sure that you have Git installed.
- I would recommend the following plugin managers:

    Personally, I use Vim-Plug.

    1. [Vim-Plug](https://github.com/junegunn/vim-plug) 
         - To install in a Windows machine using powershell.
        ```sh
        iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
        ```
        - To install in a Unix environment.
        ```sh
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        ```

    2. [Vundle](https://github.com/VundleVim/Vundle.vim)
        - To install in any environment:

        ```sh
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        ```

