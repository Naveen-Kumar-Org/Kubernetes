from fastapi import FastAPI 

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "hello from fastapi on eks", "version": "v1.0.0"}


@app.get("/healthz")
def health_check():
    return {"status": "ok"}

@app.get("/readyz")
def readiness_check():
    return {"status": "ready"}