from fastapi import FastAPI, Request

app = FastAPI()

@app.get("/")
async def read_root(request: Request):
    client_host = request.client.host
    return client_host

if __name__ == "__main__":
    app()
