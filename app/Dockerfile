FROM python:3.7.4

WORKDIR /app

COPY /app/requirements.txt /app

COPY /app/api.py /app/api.py 

RUN pip install -r /app/requirements.txt

CMD ["gunicorn","--bind", "0.0.0.0:8000","--log-level", "debug", "api:app"]