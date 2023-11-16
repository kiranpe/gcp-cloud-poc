# Webapp Image

## Flask App

1. Install Python in your system if not installed.
2. Run below command to install Flask.\
    py -m pip install flask

3. Now verify installation.\
    py -c "import flask"

4. create templates folder and create simple index file.
5. create app.py file and run the flask application.\
   py -m flask run

## Checkov Scan

1. Install checkov using python pip.\
   pip install checkov

2. Scan app dockerfile with Checkov.\
   checkov -f docker-files/Dockerfile

3. It gives the error result if any of policy is failed.

4. All passed for flask app.