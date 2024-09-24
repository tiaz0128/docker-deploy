import logging
import os
import subprocess

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def welcome_root():
    return {"message": "Hello FastAPI"}


@app.post("/api/v1/containers/{container_id}/update")
def update_container(container_id: str):
    # 웹훅 수신 시 update_container.sh 스크립트 실행
    logging.info(f"Update container: {container_id}")
    script_path = os.path.join(
        os.path.dirname(__file__), "scripts", "update_container.sh"
    )
    subprocess.call([script_path])
    return "OK", 200
