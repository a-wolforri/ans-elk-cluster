# Makefile

VENV = .venv
ACTIVATE_VENV = . $(VENV)/bin/activate

install:
	@echo "Creating virtual environment..."
	python -m venv .venv
	@echo "Activating virtual environment..."
	. .venv/bin/activate && pip install -r requirements.txt
	@echo "Installing ansible collections..."
	ansible-galaxy collection install -r requirements.yml -p ./collections

destroy:
	@$(ACTIVATE_VENV) && molecule destroy

cleanup: destroy
	@$(ACTIVATE_VENV) && molecule cleanup

prepare: destroy cleanup
	@$(ACTIVATE_VENV) && molecule prepare

create: prepare
	@$(ACTIVATE_VENV) && molecule prepare

converge: create
	@$(ACTIVATE_VENV) && molecule converge

reset: destroy
	@$(ACTIVATE_VENV) && molecule reset

test: destroy prepare create converge
#	@$(ACTIVATE_VENV) && molecule verify

clean: destroy reset
	rm -rf $(VENV)