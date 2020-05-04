My [Fedora-KDE](https://spins.fedoraproject.org/kde/) setup

1. install all packages
    ```sh
    sudo dnf update -y
    sudo dnf install -y \
        git         `: `\
        neovim      `: prefered tui editor`\
            python3-neovim `: python support for nvim`
        zsh         `: prefered shell`\
        tmux        `: terminal multiplexer`\
        bat         `: modern cat written in rust`\
        exa         `: modern ls written in rust`\
        java-1.8.0-openjdk  `: for minecraft`\
        java-11-openjdk     `: for everything else`\

    # install oh-my-zsh and change default shell to zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
    After that, restart you terminal session and make sure you log in to zsh

    ```sh
    # install oh-my-zsh plugins
    git clone --depth=1 https://github.com/zsh-users/zsh-completions              $ZSH_CUSTOM/plugins/zsh-completions
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions          $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git  $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git              $ZSH_CUSTOM/themes/powerlevel10k
    ```

2. setup firefox

    While all packages are installing, setup firefox:\
    goto [duckduckgo](https://duckduckgo.com/app) and install firefox extension\
    install [Plasma Integration Extension](https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/)\
    optional, goto [1password](https://my.1password.com/signin?l=en), signin and download [extension](https://addons.mozilla.org/en-US/firefox/addon/1password-x-password-manager/)\
    optional, goto [windscribe](https://windscribe.com/download) and download [windscribe for firefox](https://addons.mozilla.org/en-US/firefox/addon/windscribe/). Then run this to install `windscribe-cli`
    ```sh
    sudo wget https://repo.windscribe.com/fedora/windscribe.repo -O /etc/yum.repos.d/windscribe.repo
    sudo dnf update -y
    sudo dnf install windscribe-cli
    ```

    Firefox Preferences
    1. General > Startup > Restore previous session = true
    1. General > Digital Rights Management (DRM) Content > Play DRM-controlled content = true
    1. General > Tabs > Ctrl+Tab cycles through tabs in recently used order = false
    1. Home > Firefox Home Content > Highlights = false
    1. Home > Firefox Home Content > Snippets = false
    1. Privacy & Seurity > Enhanced Tracking Protection = Strict
    1. Privacy & Seurity > Send websites a “Do Not Track”... = Always
    1. Privacy & Seurity > Logins and Passwords > Ask to save logins and passwords for websites = false
    1. Privacy & Seurity > Firefox Data Collection and Use > Allow Firefox to send backlogged crash reports on your behalf = true
    1. Sync > Sign in to Sync - sign in/sign up

3. dotfiles setup

    install dotfile manager and clone my repo. Then goto created folder and run rcm's `rcup`
    ```sh
    sudo dnf install rcm
    git clone --depth 1 https://github.com/randomunrandom/.dotfiles/blob/master/zshrc ~/.dotfiles/
    cd ~/.dotfiles
    rcup
    ```
4. git setup

    create GPG key, find it, export it and make git use it.
    ```sh
    gpg --default-new-key-algo rsa4096 --gen-key
    gpg --list-secret-keys --keyid-format LONG
    ```
    Find your key id, should look lik\
    `sec rsa4096/{YOUR KEY ID}`
    ```sh
    gpg --armor --export {YOUR KEY ID}
    ```
    Then add it to your [GitHub](https://github.com/settings/keys) and [GitLab](https://gitlab.com/profile/gpg_keys) accounts.
5. latte-dock and global menu setup

    install latte dock and dependencies for global menu
    ```sh
    sudo dnf install -y latte-dock \
        appmenu-qt5 libdbusmenu-gtk3
    ```
    run it in background(temporarym will self-setup and add to autostart)
    ```sh
    latte-dock &
    ```
    Right click and choose `Unity` under `Layouts`\
    Remove standart KDE panel at the bottom(right click > `Edit panel` > `Remove Panel`)
    run this to allow latte-dock to use `<Super>`
    ```sh
    kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.lattedock,/Latte,org.kde.LatteDock,activateLauncherMenu"
    qdbus org.kde.KWin /KWin reconfigure
    ```
    Widgets:
    1. Active Window Control
    1. Latte sidebar
    !!! configs: ~/.config/lattedock-appletsrc cat ~/.config/lattedockrc !!!

6. kde theme setup

    Goto System settings > Global Theme > Get New Global Themes... and search for [sweet](https://store.kde.org/p/1294729). After install close window, choose Sweet and Apply\
    Goto System settings > Startup and Shutdown > Login screen(SDDM), choose sweet and click Apply\
    Goto `System settings` > `Window Management` > `Task Switcher`, choose `Thumbnail Grid` undder `Visualization` and click Apply

    Choose on of the following:
    1. Basic setup:
    2. Advanced setup:
        Install [kvantum](https://github.com/tsujan/Kvantum) theme engine and Sweet kvantum theme:
        ```sh
        sudo dnf install -y kvantum
        ```
        Install [sweet kvantum theme](https://store.kde.org/p/1294013/) and extract it to ~/.themes/Kvantum-Sweet
        ```sh
        mkdir ~/.themes
        tar xf ~/Downloads/Sweet.tar.xz -C ~/.themes
        ```

        Then open Kvantum manaher and select created folder, i.e. `/home/random/.themes/kvantum-sweet`\
        Goto `Cahnge/Delete theme`, select Sweet at the very bottom and click `Use this theme`

        Open `System Settings` > `Application Style` > `Widget Style` and and choose `kvantum-dark`

Additional application setup
----------------------------
**NERD Fonts**
```sh
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts
cd ~/.nerd-fonts
./install Hack
./install JetBrainsMono
```

**MS Teams**
```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[teams]\nname=teams\nbaseurl=https://packages.microsoft.com/yumrepos/ms-teams\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/teams.repo'
sudo dnf check-update
sudo dnf install teams-insider
```

**VS Codium**
```sh
sudo tee -a /etc/yum.repos.d/vscodium.repo << 'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
EOF

sudo dnf install codium
```
**flameshot**
```sh
dnf install flameshot
```
**[Telegram](https://desktop.telegram.org/)**
**[JetBrains IDE](https://www.jetbrains.com/)**
