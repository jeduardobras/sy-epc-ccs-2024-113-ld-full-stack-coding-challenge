from pydantic import BaseModel

class HelloWorld(BaseModel):
    id: int
    message: str

    class ConfigDict:
        from_attributes = True
