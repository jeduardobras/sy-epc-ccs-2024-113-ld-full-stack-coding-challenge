from sqlalchemy import (
    select
)
from sqlalchemy.ext.asyncio import AsyncSession
import server.schemas as sc
import server.models as md

async def read_hello_world(db_session: AsyncSession) -> md.HelloWorld:
    query = select(sc.HelloWorld).where(sc.HelloWorld.message == 'Hello World!')
    result = await db_session.execute(query)
    
    hello_world_from_db = result.scalar_one()
    return md.HelloWorld.model_validate(hello_world_from_db, from_attributes=True)
