FROM python:3.12-slim

EXPOSE 8000

RUN groupadd -r app && useradd --no-log-init -r -g app app

RUN mkdir -p /home/app && chown app:app /home/app

USER app
WORKDIR /home/app

COPY --chown=app:app requirements.txt ./

RUN pip install -U pip

RUN pip install --user --no-cache-dir -r requirements.txt \
    && pip install --user --no-cache-dir debugpy


COPY --chown=app:app . server

ENTRYPOINT ["python3", "-m"]

CMD ["uvicorn", "server.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
