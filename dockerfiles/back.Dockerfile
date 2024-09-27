FROM python:3.12-alpine

RUN pip install -U poetry

WORKDIR /app

COPY ./apps/back/pyproject.toml /app

RUN poetry install --no-root --no-interaction 

COPY ./apps/back /app

EXPOSE 8000

CMD ["poetry", "run", "uvicorn", "run:app", "--host", "0.0.0.0", "--port", "8000"]
