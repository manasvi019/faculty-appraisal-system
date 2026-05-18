from pydantic import BaseModel

class SeminarCreate(BaseModel):

    form_id: int
    title: str
    location: str
    date: str