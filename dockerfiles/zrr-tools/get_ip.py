from fastapi import FastAPI, Request
from fastapi.middleware.trustedhost import TrustedHostMiddleware

app = FastAPI()
app.add_middleware(TrustedHostMiddleware, allowed_hosts=["*"])

@app.get("/")
async def read_root(request: Request):
    client_host = request.headers.get("X-Real-IP")
    x_forwarded_for = request.headers.get("X-Forwarded-For")

    if x_forwarded_for:
        client_host = x_forwarded_for.split(",")[0]
    else:
        client_host = request.client.host

    return request.client.host

@app.get("/v1/get_ip")
async def get_ip(request: Request):
    client_host = request.headers.get("X-Real-IP")
    x_forwarded_for = request.headers.get("X-Forwarded-For")

    if x_forwarded_for:
        client_host = x_forwarded_for.split(",")[0]
    else:
        client_host = request.client.host

    return {"client_host": client_host}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000, forwarded_allow_ips='*')
