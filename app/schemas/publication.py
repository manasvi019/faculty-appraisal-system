from pydantic import BaseModel

class PublicationCreate(BaseModel):

    form_id: int
    title: str
    journal_name: str
    year: int