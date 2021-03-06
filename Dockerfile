FROM python:3.9.0
USER root

WORKDIR /usr/src/app

RUN apt update
RUN apt install gnupg2 -y

COPY poetry.lock pyproject.toml ./

# RUN apt -y install locales && \
    # localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

# ENV LANG ja_JP.UTF-8
# ENV LANGUAGE ja_JP:ja
# ENV LC_ALL ja_JP.UTF-8
# ENV TZ JST-9
# ENV TERM xterm

# RUN pip install --upgrade pip
RUN pip install poetry
RUN poetry config virtualenvs.create false \
    && poetry install
