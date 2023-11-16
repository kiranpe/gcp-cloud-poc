# WebApp

## Choose any one python development modules to create python app.. I prefer falsk.. easy and straight forward!!

## Django App

1. Install Python in your system if not installed.
2. Run below command to install Django.\
    py -m pip install django

3. Now verify installation.\
    py -c "import django"

4. Now intialize Django application using below command.\
    django-admin startproject <your project name>

5. Create a seperate folder for templates and create views.py and urls.py and templates in it.
6. Then update the actual urls.py and run below command.\
    py manage.py migrate

7. Now test run the application and hit the url in browser.\
    py manage.py runserver

**_NOTE: Useful links._** \
    - https://docs.djangoproject.com/en/4.2/intro/install/ \
    - https://docs.djangoproject.com/en/4.2/intro/tutorial02/ \
    - https://www.w3schools.com/django/django_views.php

## Flask App

1. Install Python in your system if not installed.
2. Run below command to install Flask.\
    py -m pip install flask

3. Now verify installation.\
    py -c "import flask"

4. create templates folder and create simple index file.
5. create app.py file and run the flask application.\
   py -m flask run