from sqlalchemy import (
    Column,
    Integer,
    Text
)
from server.schemas.base import Base

class HelloWorld(Base):
    __tablename__ = 'hello_world'

    id = Column(Integer, primary_key=True)
    message = Column(Text)
