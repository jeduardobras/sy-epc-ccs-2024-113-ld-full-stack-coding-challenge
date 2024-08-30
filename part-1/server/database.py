from typing import AsyncGenerator
from sqlalchemy.ext.asyncio import async_sessionmaker, AsyncSession, create_async_engine

from server.config import db_config
from server.schemas.base import Base

DATABASE_URL = f"postgresql+asyncpg://{db_config.db_username}:{db_config.db_password}@{db_config.db_host}:{db_config.db_port}/{db_config.db_database}"

engine = create_async_engine(DATABASE_URL)
sessionmaker = async_sessionmaker(
    autocommit=False,
    expire_on_commit=False,
    bind=engine,
    autoflush=False,
)

async def get_db_session() -> AsyncGenerator[AsyncSession, None]:
    """Get an asynchronous db session
    Yields:
        Iterator[AsyncIterator[AsyncSession]]: asynchronous db session
    """
    session = sessionmaker()
    try:
        yield session
    except Exception:
        await session.rollback()
        raise
    finally:
        await session.close()


async def init_db():
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)