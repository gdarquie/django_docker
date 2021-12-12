# syntax=docker/dockerfile:1
# replace by the name of the project
ARG PROJECT=django

# INSTALL PYTHON
FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# SET WORK DIR PATH
WORKDIR /srv

# INSTALL DJANGO AND PACKAGES
COPY requirements.txt /srv/
COPY .env.docker.dist /srv/.env
RUN pip install -r requirements.txt

COPY . /srv/
