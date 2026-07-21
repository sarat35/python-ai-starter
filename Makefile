.PHONY: help install sync run lint format fix test check precommit clean
PACKAGE = app

help:
	@echo "Available commands:"
	@echo "  make install     Install dependencies"
	@echo "  make sync        Sync dependencies"
	@echo "  make run         Run the application"
	@echo "  make lint        Run Ruff"
	@echo "  make format      Format code with Black"
	@echo "  make fix         Auto-fix Ruff issues and format"
	@echo "  make test        Run tests"
	@echo "  make check       Run lint, format check and tests"
	@echo "  make precommit   Run all pre-commit hooks"
	@echo "  make clean       Remove caches"

install:
	uv sync

sync:
	uv sync

run:
	uv run python -m $(PACKAGE).main

test:
	uv run pytest

run:
	uv run python -m $(PACKAGE).main

lint:
	uv run ruff check .

format:
	uv run black .

fix:
	uv run ruff check . --fix
	uv run black .

test:
	uv run pytest

build:
	uv build

docker:
	docker build -t python-ai-starter .

check:
	uv run ruff check .
	uv run black --check .
	uv run pytest
	uv build

precommit:
	uv run pre-commit run --all-files

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".ruff_cache" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
