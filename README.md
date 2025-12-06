        ____      _      ____            __ _           
       |___ \ ___| |__  / ___|___  _ __ / _(_) ___ _ __ 
         __) / __| '_ \| |   / _ \| '__| |_| |/ _ \ '_ \
        / __/\__ \ | | | |__| (_) | |  |  _| |  __/ | | |
       |_____|___/_| |_|\____\___/|_|  |_| |_|\___|_| |_|

                  z s h   p r o m p t   s y s t e m

# zsh-config

Configuración personalizada de Zsh para servidores Linux (GAIA, TERMINUS y futuros VPS).  
Incluye un prompt modular, funciones inteligentes para abreviar rutas, un comando para cambiar estilos dinámicamente y soporte liviano para plugins como autosuggestions y syntax highlighting, sin depender de frameworks pesados como Oh My Zsh.

---

## ✨ Características

- Prompt con acortamiento inteligente de `$PWD`.
- Tres estilos de abreviación:
  - **elipsis** — segmentos largos se muestran como `abc...xyz`
  - **initials** — segmentos intermedios muestran iniciales (`w/s/p/...`)
  - **mixed** — combinación equilibrada de ambos estilos
- Comando `chsps` para cambiar estilos:
  - `chsps elipsis`
  - `chsps initials`
  - `chsps mixed`
  - `chsps next`
- Estructura modular:
  - `lib/shorten.zsh`
  - `lib/prompt.zsh`
  - `lib/chsps.zsh`
  - `lib/plugins.zsh`
- Plugins opcionales:
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
- Makefile para instalación, actualización y desinstalación.

---

## 📦 Instalación

Clonar el repositorio:

```bash
git clone git@github.com:jmouriz/zsh-config.git
cd zsh-config
```

(Con HTTPS si preferís)

```bash
git clone https://github.com/jmouriz/zsh-config.git
```

### (Opcional) Instalar plugins

```bash
make plugins
```

### Instalar en tu sistema

```bash
<<<<<<< HEAD
git clone https://github.com/jmouriz/zsh-config ~/.zsh-config
cd ~/.zsh-config
=======
>>>>>>> c1a6d5b (Initial zsh-config with prompt, shorten functions and plugins loader)
make install
```

Esto crea `~/.zsh-config` y agrega:

```bash
source ~/.zsh-config/zshrc
```

a tu `~/.zshrc` si no estaba.

Luego recargá:

```bash
source ~/.zshrc
```

---

## 🔧 Uso

### Cambiar estilo del prompt

```bash
chsps elipsis
chsps initials
chsps mixed
chsps next
```

### Ver estilo actual

```bash
chsps
```

### Actualizar configuración

```bash
make update
```

### Desinstalar todo

```bash
make uninstall
```

---

## 🧩 Plugins

Los plugins se cargan desde `lib/plugins.zsh` si están presentes.

### Instalar plugins

```bash
make plugins
make install
```

### Activar / desactivar plugins por servidor

En tu `~/.zshrc`:

```bash
export ENABLE_ZSH_AUTOSUGGESTIONS=1
export ENABLE_ZSH_SYNTAX_HIGHLIGHTING=1
source ~/.zsh-config/zshrc
```

Para desactivar:

```bash
export ENABLE_ZSH_AUTOSUGGESTIONS=0
export ENABLE_ZSH_SYNTAX_HIGHLIGHTING=0
```

---

## 📁 Estructura del proyecto

```text
zsh-config/
├── Makefile
├── README.md
├── zshrc
├── lib/
│   ├── prompt.zsh
│   ├── shorten.zsh
│   ├── chsps.zsh
│   └── plugins.zsh
└── plugins/
    ├── zsh-autosuggestions/        # opcional
    └── zsh-syntax-highlighting/    # opcional
```

---

## 🛠 Ideas para expansión futura

- Detectar el ancho de la terminal y cambiar el estilo automáticamente.
- Integrar información de Git compacta (branch y estado).
- Cambiar colores del prompt según host (GAIA / TERMINUS).
- Indicadores ligeros: exit status, tiempo de ejecución, carga del sistema.
- `make deploy-hosts` para instalar en varios servidores vía SSH + rsync.

---

## 📜 Licencia

Libre uso personal.  
Si este repo te resulta útil, una ⭐ en GitHub siempre se agradece.

---

Hecho con ❤️, Zsh y obsesión por los prompts.
