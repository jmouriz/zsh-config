# Remplaza $HOME con ~
shorten_base_path() {
  echo "${PWD/#$HOME/~}"
}

# Estilo: elipsis por segmento
shorten_path_elipsis() {
  local path=$(shorten_base_path)
  local IFS='/'
  local parts=(${(s:/:)path})
  local out=()

  for seg in $parts; do
    if [[ "$seg" == "~" ]]; then
      out+="$seg"
    elif [[ ${#seg} -gt 10 ]]; then
      out+="${seg[1,3]}...${seg[-3,-1]}"
    else
      out+="$seg"
    fi
  done

  echo "${(j:/:)out}"
}

# Estilo: iniciales
shorten_path_initials() {
  local path=$(shorten_base_path)
  local IFS='/'
  local parts=(${(s:/:)path})
  local count=${#parts}
  local out=()

  for i in {1..$count}; do
    local seg="${parts[i]}"

    if [[ "$seg" == "~" ]]; then
      out+="$seg"
    elif (( i == count )); then
      out+="$seg"        # último segmento completo
    else
      out+="${seg[1,1]}" # inicial
    fi
  done

  echo "${(j:/:)out}"
}

# Estilo: mixto
shorten_path_mixed() {
  local path=$(shorten_base_path)
  local IFS='/'
  local parts=(${(s:/:)path})
  local count=${#parts}

  (( count <= 5 )) && echo "$path" && return

  local out=()
  out+="${parts[1]}"
  out+="${parts[2]}"
  out+="${parts[3][1,1]}"
  out+="..."
  out+="${parts[-2]}"
  out+="${parts[-1]}"

  echo "${(j:/:)out}"
}
