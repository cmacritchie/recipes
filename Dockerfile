FROM python:3.9-alpine3.13

LABEL maintainer="craig mac"

# RECOMMENDED WHEN RUNNING PYTHON IN A docker container, see output directly in the screen
ENV PYTHONBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000


# && \ puts everythin on one line so multiple images aren't being made
# python -m venv /py   >> Creates a new virtual environment for storing dependencies
# /py/bin/pip install --upgrade pip    >> Upgrade pip for virtual environment
# /py/bin/pip install -r /tmp/requirements.txt     >> install list of requirements
# rm -rf /tmp    >> remove /tmp directory. don't want extra dependencies on our image once its been created
# adduser \   creates a user so you're not using root user, using root user can be bad if attacked

ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [$DEV = "true"]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \ 
        --no-create-home \
        django-user

#updates path environment variable, where executables can be run
ENV PATH="/py/bin:$PATH"

#user that we're switching to
USER django-user