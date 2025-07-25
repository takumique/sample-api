from typing import Optional, Dict, List
from contextlib import asynccontextmanager

from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse


@asynccontextmanager
async def lifespan(app: FastAPI):
    # startup (per worker)
    yield
    # shutdown (per worker)

app = FastAPI(lifespan = lifespan)

# API

@app.get("/hello")
async def get_hello(request: Request):
    return JSONResponse({
        "response": "world!",
    })
