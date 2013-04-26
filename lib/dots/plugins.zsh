# Load the plugin architecture
source "$ZSH/vendor/antigen/antigen.zsh"

# Set up the plugin architecture
antigen-lib

# Local modifications to OMZ plugins
antigen-bundle $HOME/.dots lib/plugins/bundler
antigen-bundle $HOME/.dots lib/plugins/git
antigen-bundle $HOME/.dots lib/plugins/knife
antigen-bundle $HOME/.dots lib/plugins/osx
antigen-bundle $HOME/.dots lib/plugins/rails3

# From alternative sources
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle kennethreitz/autoenv

# Apply loaded plugins to the environment
antigen-apply
