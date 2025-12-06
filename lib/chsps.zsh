chsps() {
  local styles=("elipsis" "initials" "mixed")

  if [[ -z "$1" ]]; then
    echo "Estilo actual: $SHORT_PWD_STYLE"
    return
  fi

  case "$1" in
    elipsis|initials|mixed)
      export SHORT_PWD_STYLE="$1"
      echo "Estilo cambiado a: $SHORT_PWD_STYLE"
      ;;
    next)
      local i
      for i in {1..${#styles[@]}}; do
        if [[ "${styles[i]}" == "$SHORT_PWD_STYLE" ]]; then
          local next_index=$(( (i % ${#styles[@]}) + 1 ))
          export SHORT_PWD_STYLE="${styles[next_index]}"
          echo "Estilo cambiado a: $SHORT_PWD_STYLE"
          return
        fi
      done
      export SHORT_PWD_STYLE="elipsis"
      echo "Estilo cambiado a: elipsis"
      ;;
    *)
      echo "Uso: chsps {elipsis|initials|mixed|next}"
      ;;
  esac
}
