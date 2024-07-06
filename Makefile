.DEFAULT_GOAL := default
#################### PACKAGE ACTIONS ###################

setup: create_pyenv install

create_pyenv:
	@if pyenv virtualenvs | grep -q "allstate_claims_severity"; then \
		echo "Virtual environment "allstate_claims_severity" already exists."; \
	else \
		pyenv virtualenv allstate_claims_severity; \
	fi
	@pyenv local allstate_claims_severity

install:
	@pip install --upgrade pip
	@pip install -e .

reinstall_package:
	@pip uninstall -y allstate_claims_severity || :
	@pip install -e .
