# Makefile
install:
	@echo "Создание виртуального окружения..."
	python -m venv .venv
	@echo "Активация виртуального окружения..."
	. .venv/bin/activate && pip install -r requirements.txt
	@echo "Установка ansible коллекций..."
	ansible-galaxy collection install -r requirements.yml -p ./collections