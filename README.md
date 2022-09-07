# recipes
practice repo to place with django REST api

`docker-compose run --rm app sh -c "python manage.py collectstatic"`


run flake8 tool in our code
`docker-compose run --rm app sh -c "flake8"`f

testing 
`docker-compose run --rm app sh -c "python manage.py test"`

Two way mapping, creates app in container
docker-compose run --rm app sh -c "django-admin startproject app ."


docker-compose up ==> run development server

`github actions run at .github/workflows/checks.yml` 


Run tests:
docker-compose run --rm app sh -c "python manage.py test"