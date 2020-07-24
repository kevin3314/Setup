# Install zsh
sudo apt-get install -y zsh
chsh -s /usr/bin/zsh
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install neovim by build
git clone https://github.com/neovim/neovim.git
cd neovim
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..

git clone https://github.com/kevin3314/NeoVimConfig.git
mkdir -p ~/.config
cp -r NeoVimConfig ~/.config/nvim

git clone https://github.com/kevin3314/Setup.git
cd Setup
chmod 775 dotfile.sh
./dotfile.sh
cd ..
