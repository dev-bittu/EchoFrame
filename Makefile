.PHONY: *

mm:
	@uv run manage.py makemigrations
	@uv run manage.py migrate

superuser:
	@uv run manage.py createsuperuser

ruff:
	@uv run ruff check

setup:
	@uv sync
	@make mm
	@make superuser
	@make ruff

run:
	@uv run manage.py runserver

ngrun:
	@uv run manage.py runserver 0.0.0.0:8000

test:
	@make ruff
	@uv run manage.py test

collectstatic:
	@uv run manage.py collectstatic --noinput

aph:
	@uv run sudo systemctl restart apache2

chown:
	@uv run sudo chown -R www-data:www-data .

mcheck:
	@uv run manage.py check

ready:
	@make ireq
	@make mm
	@make collectstatic
	@make ruff
	@make mcheck
	@make chown
	@make aph

clean:
	rm -rf ./*/migrations/00*.py
	rm -rf ./*/__pycache__/*
	rm -rf ./*/migrations/__pycache__/*.pyc

cleandb:
	rm -rf db.sqlite3
	@make clean
	@make mm
	@make superuser
