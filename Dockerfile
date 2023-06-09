# pull the official docker image
FROM python:3.10.12-bullseye

# set work directory
WORKDIR /university_management

# set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .