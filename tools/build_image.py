import os
from time import sleep
import bonecommand as bc
from bonecommand.command import Status
import typer

app = typer.Typer()


@app.command()
def build_image(path:str, user:str="zrr1999"):
    cmd = bc.ShellCommand([
        f"cd {path}",
        "git rev-parse --short HEAD",
    ])
    commit_id = cmd.run().stdout
    if commit_id is None:
        return
    commit_id = commit_id.strip()
    cmds: list[Status] = []
    for folder in os.listdir(path):
        if not os.path.isfile(os.path.join(path, folder, "Dockerfile")):
            continue
        os.path.basename(folder)
        tag = f"{user}/{os.path.basename(folder)}:{commit_id}"
        cmd = bc.SequenceCommand([
            f"docker build -t {tag} {path}/{folder}",
            f"docker push {tag}",
        ])
        cmd.run()
        print(cmd.get_output())


if __name__=="__main__":
    app()
