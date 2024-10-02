# Variables:
PYTHON := poetry run python
MANAGE := $(PYTHON) manage.py
DOCKER := docker compose -f docker-compose.local.yaml 

# Default target
.DEFAULT_GOAL := help

# Help target
help:
	@echo "Usage: make [target]"
	@echo
	@echo "Available Commands:"
	@echo "  help            Show this help message"
	@echo "  runserver       Run Django server"
	@echo "  migrate [app(optional)]         Run Django migrations"
	@echo "  makemigrations [app(optional)]  Create Django migrations"
	@echo "  shell           Start Django shell"
	@echo "  test [app(optional)]            Run Django tests"
	@echo "  superuser       Create Django superuser"
	@echo "  requirements    Create requirements.txt"
	@echo "  collectstatic   Collect static files"
	@echo "  secret          Generate secret key"
	@echo "  docker-build    Build Docker containers"
	@echo "  docker-up       Start Docker containers"
	@echo "  docker-down     Stop Docker containers"
	@echo "  docker-down-v   Stop Docker containers and remove volumes"
	@echo "  docker-show-logs Show Docker logs"


runserver:
	@echo "Running Django server..."
	$(MANAGE) runserver

migrate:
	@echo "Migration started..."
	$(MANAGE) migrate $(app)

makemigrations:
	@echo "Making migrations..."
	$(MANAGE) makemigrations $(app)

shell:
	@echo "Starting Django shell..."
	$(MANAGE) shell

test:
	@echo "Running tests..."
	$(MANAGE) test $(app)

superuser:
	@echo "Creating superuser..."
	$(MANAGE) createsuperuser

requirements:
	@echo "Creating requirements.txt"
	$(PYTHON) -m pip freeze > requirements.txt

collectstatic:
	@echo "Collecting static files..."
	$(MANAGE) collectstatic

secret:
	@echo "Generating secret key..."
	$(PYTHON) -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'

# Docker targets


docker-build:
	$(DOCKER) up --build -d --remove-orphans

docker-up:
	$(DOCKER) up -d

docker-down:
	$(DOCKER) down

docker-down-v:
	$(DOCKER) down -v

docker-show-logs:
	$(DOCKER) logs -f

.PHONY: help runserver migrate makemigrations shell test superuser requirements collectstatic secret docker-build docker-up docker-down docker-down-v docker-show-logs
