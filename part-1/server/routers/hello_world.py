from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

import server.models as md
import server.crud.hello_world as crud
from server.database import get_db_session

router = APIRouter()

@router.get('', response_model=md.HelloWorld)
async def get_hello_world(db_session: AsyncSession = Depends(get_db_session)):
    return await crud.read_hello_world(db_session)
