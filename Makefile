PREFIX = $(HOME)/.zsh-config

install:
	@echo "Instalando zsh-config en $(PREFIX)…"
	@mkdir -p $(PREFIX)
	@cp -r lib $(PREFIX)/
	@cp zshrc $(PREFIX)/
	@if ! grep -q "source $(PREFIX)/zshrc" $(HOME)/.zshrc 2>/dev/null; then \
		echo "source $(PREFIX)/zshrc" >> $(HOME)/.zshrc; \
		echo "Línea agregada a ~/.zshrc"; \
	else \
		echo "Entrada ya existe en ~/.zshrc"; \
	fi
	@echo "Instalación completa. Ejecutá: source ~/.zshrc"

update:
	@echo "Actualizando configuración…"
	@git pull --rebase || true
	@$(MAKE) install
	@echo "Actualización completa."

uninstall:
	@echo "Desinstalando…"
	@rm -rf $(PREFIX)
	@sed -i '/source .*\.zsh-config\/zshrc/d' $(HOME)/.zshrc || true
	@echo "Desinstalado. Podés reiniciar la shell."

check:
	@echo "Chequeando instalación:"
	@echo "Directorio: $(PREFIX)"
	@test -d $(PREFIX) && echo "OK: Config dir existe" || echo "Falta"
	@grep -q "source $(PREFIX)/zshrc" $(HOME)/.zshrc && echo "OK: ~/.zshrc configurado" || echo "Falta en ~/.zshrc"

.PHONY: install update uninstall check
