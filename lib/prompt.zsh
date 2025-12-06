# Estilo por defecto
typeset -g SHORT_PWD_STYLE="elipsis"

shorten_path() {
  case "$SHORT_PWD_STYLE" in
    elipsis)  shorten_path_elipsis ;;
    initials) shorten_path_initials ;;
    mixed)    shorten_path_mixed ;;
    *)        shorten_path_elipsis ;;
  esac
}

if [[ $EUID -eq 0 ]]; then
  color="red"
else
  color="green"
fi

setopt prompt_subst
PROMPT='%F{'$color'}%n%F{yellow}@%F{magenta}%m%f:%F{cyan}$(shorten_path)%F{yellow} ➤%f '
