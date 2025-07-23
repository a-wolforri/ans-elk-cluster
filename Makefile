# Makefile
install:
	@echo "Creating virtual environment..."
	python -m venv .venv
	@echo "Activating virtual environment..."
	. .venv/bin/activate && pip install -r requirements.txt
	@echo "Installing ansible collections..."
	ansible-galaxy collection install -r requirements.yml -p ./collections