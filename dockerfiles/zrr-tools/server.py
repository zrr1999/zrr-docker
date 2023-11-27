from fastapi import FastAPI, Request
from fastapi.middleware.trustedhost import TrustedHostMiddleware

app = FastAPI()
app.add_middleware(TrustedHostMiddleware, allowed_hosts=["*"])

@app.get("/get_ip/v2")
async def get_ip_v2(request: Request):
    client_host = request.headers.get("X-Real-IP")
    x_forwarded_for = request.headers.get("X-Forwarded-For")
    if x_forwarded_for:
        client_host = x_forwarded_for.split(",")[0]
    elif request.client is not None:
        client_host = request.client.host

    return {"client_host": client_host}


@app.get("/get_ip")
@app.get("/get_ip/v1")
async def get_ip_v1(request: Request):
    client_host = request.headers.get("X-Real-IP")
    x_forwarded_for = request.headers.get("X-Forwarded-For")
    if x_forwarded_for:
        client_host = x_forwarded_for.split(",")[0]
    elif request.client is not None:
        client_host = request.client.host

    return client_host

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000, forwarded_allow_ips='*')
