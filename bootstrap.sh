#!/bin/sh

##################################
# Setup codespaces environment
##################################

if [ -z "$USER" ]; then
    USER=$(id -un)
fi

echo >&2 "====================================================================="
echo >&2 " Setting up codespaces environment"
echo >&2 ""
echo >&2 " USER        $USER"
echo >&2 " HOME        $HOME"
echo >&2 "====================================================================="

cd $HOME

# Make passwordless sudo work
export SUDO_ASKPASS=/bin/true

# Install neovim
NVIM_VERSION=0.8.1
sudo apt-get install -y libfuse2
curl -L -o $HOME/bin/nvim https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim.appimage
chmod a+x $HOME/bin/nvim
