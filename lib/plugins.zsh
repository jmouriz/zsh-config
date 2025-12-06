# lib/plugins.zsh

# Directorio base de la config
: ${ZSH_CONFIG_DIR:="$HOME/.zsh-config"}

# Flags para activar/desactivar sin tocar el código
: ${ENABLE_ZSH_AUTOSUGGESTIONS:=1}
: ${ENABLE_ZSH_SYNTAX_HIGHLIGHTING:=1}

# Autosuggestions
if [[ $ENABLE_ZSH_AUTOSUGGESTIONS -eq 1 ]]; then
  if [[ -f "$ZSH_CONFIG_DIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$ZSH_CONFIG_DIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

    # Estilo discreto (color grisito)
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    # Estrategia: solo historial
    ZSH_AUTOSUGGEST_STRATEGY=(history)
  fi
fi

# Syntax highlighting
# Importante: este plugin debe ir lo más al final posible.
if [[ $ENABLE_ZSH_SYNTAX_HIGHLIGHTING -eq 1 ]]; then
  if [[ -f "$ZSH_CONFIG_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$ZSH_CONFIG_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  fi
fi
