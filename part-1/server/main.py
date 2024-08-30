from contextlib import asynccontextmanager
from fastapi import FastAPI

from server.database import init_db
from server.routers import hello_world_router

@asynccontextmanager
async def lifespan(app: FastAPI):
    await init_db()
    yield


app = FastAPI(
    root_path='/api/',
    version="0.0.1",
    lifespan=lifespan
)


app.include_router(hello_world_router, prefix="/hello_world", tags=["Hello World"])
