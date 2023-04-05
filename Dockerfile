FROM python:3.9

RUN apt-get update

RUN pip install --upgrade pip

WORKDIR /code

COPY requirements.txt .

RUN pip install -r /code/requirements.txt

COPY . /code

# CMD exec gunicorn --bind :80 main:app --workers 1 --threads 1 --timeout 0
# CMD uvicorn main:app --host 0.0.0.0 --port 80
CMD exec gunicorn main:app --workers 4 --bind 0.0.0.0:80 --timeout 0