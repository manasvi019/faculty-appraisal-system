from pydantic import BaseModel

class ProjectCreate(BaseModel):

    form_id: int
    project_title: str
    funding_agency: str
    duration: str