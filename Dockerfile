# Dockerfile for FastAPI application
# Section 1- Base Image
FROM python:3.10-slim

ENV DB_DIR project/db

ENV PROJECT_DIR project

ENV DATABASE_PATH $DB_DIR

# Section 2- Python Interpreter Flags
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
# Section 3- Compiler and OS libraries
RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential libpq-dev libmagic-dev \
  && rm -rf /var/lib/apt/lists/*
# Section 4- Project libraries and User Creation
COPY ./requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt \
    && rm -rf /tmp/requirements.txt \
    && useradd -U $PROJECT_DIR
#

RUN mkdir -p $DB_DIR
RUN install -d -m 755 -o $PROJECT_DIR -g $PROJECT_DIR $DB_DIR
# Section 5- Code and User Setup

WORKDIR $PROJECT_DIR

USER $PROJECT_DIR:$PROJECT_DIR
# change to project directory
COPY --chown=$PROJECT_DIR:$PROJECT_DIR  ./SET_THIS_TO_PROJECT_FOLDER .

# Section 6- Docker Run Checks and Configurations
# select your entrypoint
ENTRYPOINT [ "YOUR_PROJECT_ENTRYPOINT" ]