# zsh-config/zshrc
#
# Ruta al repo (ajustable)
export ZSH_CONFIG_DIR="$HOME/.zsh-config"

# Cargar módulos
source $ZSH_CONFIG_DIR/lib/shorten.zsh
source $ZSH_CONFIG_DIR/lib/prompt.zsh
source $ZSH_CONFIG_DIR/lib/chsps.zsh

# Plugins (si existen)
source $ZSH_CONFIG_DIR/lib/plugins.zsh
