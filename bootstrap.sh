#!/usr/bin/env bash
set -e

REPO_SSH="git@github.com:jmouriz/zsh-config.git"
REPO_HTTPS="https://github.com/jmouriz/zsh-config.git"
TARGET="${HOME}/.zsh-config"

USE_HTTPS=0
WITH_PLUGINS=0

usage() {
  echo "Uso: $0 [--with-plugins] [--https]"
  echo "  --with-plugins   Clona también los plugins (zsh-autosuggestions, zsh-syntax-highlighting)"
  echo "  --https          Usa HTTPS en lugar de SSH para clonar el repo"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --with-plugins)
      WITH_PLUGINS=1
      shift
      ;;
    --https)
      USE_HTTPS=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Opción desconocida: $1"
      usage
      exit 1
      ;;
  esac
done

if [[ $USE_HTTPS -eq 1 ]]; then
  REPO_URL="$REPO_HTTPS"
else
  REPO_URL="$REPO_SSH"
fi

echo ">> Usando repo: $REPO_URL"
echo ">> Directorio de destino: $TARGET"

if [[ -d "$TARGET/.git" ]]; then
  echo ">> Actualizando repo existente…"
  git -C "$TARGET" pull --rebase || true
else
  echo ">> Clonando repo…"
  git clone "$REPO_URL" "$TARGET"
fi

cd "$TARGET"

if [[ $WITH_PLUGINS -eq 1 ]]; then
  echo ">> Instalando plugins…"
  make plugins
fi

echo ">> Instalando configuración…"
make install

echo
echo "Listo."
echo "Si es la primera vez, corré:  source ~/.zshrc"
echo
