from pydantic import BaseModel
from datetime import date


class AppraisalResponse(BaseModel):
    form_id: int
    faculty_id: int
    academic_year: str
    submission_date: date
    status: str

    class Config:
        from_attributes = True