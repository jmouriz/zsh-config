        ____      _      ____            __ _           
       |___ \ ___| |__  / ___|___  _ __ / _(_) ___ _ __ 
         __) / __| '_ \| |   / _ \| '__| |_| |/ _ \ '_ \
        / __/\__ \ | | | |__| (_) | |  |  _| |  __/ | | |
       |_____|___/_| |_|\____\___/|_|  |_| |_|\___|_| |_|

                  z s h   p r o m p t   s y s t e m

# zsh-config

Configuración personalizada de Zsh para servidores Linux (GAIA, TERMINUS y futuros VPS).  
Incluye un sistema modular para el prompt, funciones de abreviación inteligente de rutas y un comando interactivo para cambiar estilos dinámicamente.

## ✨ Características

- Prompt personalizado con acortamiento dinámico del `PWD`.
- Tres estilos de acortamiento:
  - **elipsis** — abrevia segmentos largos con `abc...xyz`
  - **initials** — usa solo iniciales excepto el último segmento
  - **mixed** — mezcla segmentos completos, iniciales y compresión central
- Comando interactivo `chsps` para cambiar el estilo:
  - `chsps elipsis`
  - `chsps initials`
  - `chsps mixed`
  - `chsps next` (rota entre los estilos)
- Configuración modular:
  - `lib/shorten.zsh` — funciones de acortamiento
  - `lib/prompt.zsh` — configuración del prompt
  - `lib/chsps.zsh` — comando para cambiar estilos
- Instalación mediante `Makefile`.

## 📦 Instalación

Clonar el repo en el home:

```bash
git clone https://github.com/tuusuario/zsh-config ~/.zsh-config
cd ~/.zsh-config
make install
