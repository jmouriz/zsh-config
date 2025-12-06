PREFIX = $(HOME)/.zsh-config

install:
	@echo "Instalando zsh-config en $(PREFIX)…"
	@mkdir -p $(PREFIX)
	@cp -r lib $(PREFIX)/
	@[ -d plugins ] && cp -r plugins $(PREFIX)/ || true
	@cp zshrc $(PREFIX)/
	@if ! grep -q "source $(PREFIX)/zshrc" $(HOME)/.zshrc 2>/dev/null; then \
		echo "source $(PREFIX)/zshrc" >> $(HOME)/.zshrc; \
		echo "Línea agregada a ~/.zshrc"; \
	else \
		echo "Entrada ya existe en ~/.zshrc"; \
	fi
	@echo "Instalación completa. Ejecutá: source ~/.zshrc"

update:
	@echo "Actualizando configuración (git pull + install)…"
	@git pull --rebase || true
	@$(MAKE) install
	@echo "Actualización completa."

uninstall:
	@echo "Desinstalando zsh-config…"
	@rm -rf $(PREFIX)
	@sed -i '/source .*\.zsh-config\/zshrc/d' $(HOME)/.zshrc 2>/dev/null || true
	@echo "Desinstalado. Podés reiniciar la shell o abrir una nueva sesión."

check:
	@echo "Chequeando instalación:"
	@echo "  - Directorio: $(PREFIX)"
	@([ -d $(PREFIX) ] && echo '    ✓ Config dir existe' || echo '    ✗ Falta directorio de config')
	@([ -f $(PREFIX)/zshrc ] && echo '    ✓ zshrc encontrado' || echo '    ✗ Falta zshrc en config')
	@grep -q "source $(PREFIX)/zshrc" $(HOME)/.zshrc 2>/dev/null && \
		echo '    ✓ ~/.zshrc está apuntando a zsh-config' || \
		echo '    ✗ ~/.zshrc no incluye zsh-config'

plugins:
	@echo "Preparando plugins en ./plugins…"
	@mkdir -p plugins
	@if [ ! -d plugins/zsh-autosuggestions ]; then \
		echo '  - Clonando zsh-autosuggestions…'; \
		git clone https://github.com/zsh-users/zsh-autosuggestions.git plugins/zsh-autosuggestions; \
	else \
		echo '  - zsh-autosuggestions ya existe'; \
	fi
	@if [ ! -d plugins/zsh-syntax-highlighting ]; then \
		echo '  - Clonando zsh-syntax-highlighting…'; \
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git plugins/zsh-syntax-highlighting; \
	else \
		echo '  - zsh-syntax-highlighting ya existe'; \
	fi
	@echo "Plugins listos. Volvé a ejecutar: make install"

.PHONY: install update uninstall check plugins
