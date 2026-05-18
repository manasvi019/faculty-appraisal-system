from pydantic import BaseModel

class FacultyResponse(BaseModel):
    faculty_id: int
    name: str
    email: str
    designation: str
    department: str

class FacultyCreate(BaseModel):

    name: str
    email: str
    password: str
    designation: str
    department: str

    class Config:
        from_attributes = True