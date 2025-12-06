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
- Tres estilos de abreviación de ruta:
  - **elipsis** — segmentos largos se muestran como `abc...xyz`
  - **initials** — segmentos intermedios muestran iniciales (`w/s/p/...`)
  - **mixed** — combinación equilibrada de ambos estilos
- Comando `chsps` para cambiar de estilo al vuelo:
  - `chsps elipsis`
  - `chsps initials`
  - `chsps mixed`
  - `chsps next`
- Estructura modular:
  - `lib/shorten.zsh` — funciones de abreviación de ruta
  - `lib/prompt.zsh` — configuración del prompt
  - `lib/chsps.zsh` — comando para cambiar estilos
  - `lib/plugins.zsh` — carga opcional de plugins
- Soporte opcional para plugins:
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
- Makefile para instalación, actualización, desinstalación y manejo de plugins.
- Script `bootstrap.sh` para instalar todo en un servidor nuevo en un solo paso.

---

## 📦 Instalación

### Opción 1: usando `bootstrap.sh` (recomendada para nuevos servidores)

En un servidor nuevo, podés instalar todo directamente con:

```bash
curl -O https://raw.githubusercontent.com/jmouriz/zsh-config/main/bootstrap.sh
chmod +x bootstrap.sh
./bootstrap.sh --with-plugins
```

Opciones:

- `--with-plugins` → instala también `zsh-autosuggestions` y `zsh-syntax-highlighting`.
- `--https` → usa HTTPS en lugar de SSH para clonar el repo.

Si no querés plugins:

```bash
./bootstrap.sh
```

---

### Opción 2: instalación manual

Clonar el repositorio:

```bash
git clone git@github.com:jmouriz/zsh-config.git
cd zsh-config
```

(Con HTTPS si preferís)

```bash
git clone https://github.com/jmouriz/zsh-config.git
cd zsh-config
```

#### (Opcional) Instalar plugins

```bash
make plugins
```

#### Instalar la configuración

```bash
make install
```

Esto crea `~/.zsh-config` y agrega:

```bash
source ~/.zsh-config/zshrc
```

a tu `~/.zshrc` si no estaba.

Luego recargá Zsh:

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

### Actualizar configuración desde el repo

```bash
make update
```

### Desinstalar todo

```bash
make uninstall
```

---

## 🧩 Plugins

Los plugins se cargan desde `lib/plugins.zsh` si están presentes en el directorio `plugins/`.
No se versionan en el repositorio; se gestionan con `make plugins`.

### Instalar plugins

```bash
make plugins
make install
```

Esto crea el directorio `plugins/` con:

- `plugins/zsh-autosuggestions/`
- `plugins/zsh-syntax-highlighting/`

### Activar / desactivar plugins por servidor

En tu `~/.zshrc` (antes de `source ~/.zsh-config/zshrc`):

```bash
export ENABLE_ZSH_AUTOSUGGESTIONS=1
export ENABLE_ZSH_SYNTAX_HIGHLIGHTING=1
source ~/.zsh-config/zshrc
```

Para desactivar alguno o ambos:

```bash
export ENABLE_ZSH_AUTOSUGGESTIONS=0
export ENABLE_ZSH_SYNTAX_HIGHLIGHTING=0
source ~/.zsh-config/zshrc
```

Si no definís estas variables, se asume que ambos están activados (si los plugins existen).

---

## 📁 Estructura del proyecto

```text
zsh-config/
├── Makefile
├── README.md
├── bootstrap.sh
├── zshrc
├── lib/
│   ├── prompt.zsh
│   ├── shorten.zsh
│   ├── chsps.zsh
│   └── plugins.zsh
└── plugins/
    ├── zsh-autosuggestions/        # opcional (make plugins)
    └── zsh-syntax-highlighting/    # opcional (make plugins)
```

---

## 🛠 Ideas para expansión futura

- Detectar el ancho de la terminal y cambiar el estilo automáticamente.
- Integrar información de Git de forma compacta (branch y estado).
- Cambiar colores del prompt según host (GAIA, TERMINUS, otros VPS).
- Indicadores ligeros: exit status, tiempo de ejecución, carga del sistema.
- `make deploy-hosts` para instalar y actualizar en varios servidores vía SSH + rsync.

---

## 📜 Licencia

Libre uso personal.  
Si este repo te resulta útil, una ⭐ en GitHub siempre se agradece.

---

Hecho con ❤️, Zsh y obsesión por los prompts.
