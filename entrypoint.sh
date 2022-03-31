#!/bin/bash

exec gunicorn --config /code/gunicornconf.py wsgi:app
