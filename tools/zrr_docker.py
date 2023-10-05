import os
from time import sleep

import docker
import typer
from invoke import run

client = docker.from_env()
app = typer.Typer()


@app.command()
def build(path:str, user:str="zrr1999"):
    result = run(f"cd {path} && git rev-parse --short HEAD")
    if result is not None and result.ok:
        commit_id = result.stdout.strip()
        for folder in os.listdir(path):
            if not os.path.isfile(os.path.join(path, folder, "Dockerfile")):
                continue
            tag = f"{user}/{os.path.basename(folder)}:{commit_id}"
            print(f"Building image for {folder}")
            client.images.build(path=os.path.join(path, folder), tag=tag)
            client.images.push(tag)

@app.command()
def compose(path:str, user:str="zrr1999"):
    pass

if __name__=="__main__":
    app()
