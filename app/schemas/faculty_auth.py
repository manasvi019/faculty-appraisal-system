from pydantic import BaseModel

class FacultyLogin(BaseModel):
    email: str
    password: str