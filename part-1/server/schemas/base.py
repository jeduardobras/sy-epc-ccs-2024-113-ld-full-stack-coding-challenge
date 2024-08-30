from sqlalchemy.orm import as_declarative
from sqlalchemy.schema import MetaData

metadata = MetaData()

@as_declarative(metadata=metadata)
class Base(object):
    metadata: MetaData
