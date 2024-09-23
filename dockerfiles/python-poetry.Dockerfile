FROM python:3.12

RUN apt update
RUN apt install -y pipx
RUN pipx ensurepath

ENV PATH="/root/.local/bin:${PATH}"

RUN pipx install poetry

WORKDIR /app

COPY ./apps/back .

CMD ["poetry", "init", "-n", "--python=^3.12"]
