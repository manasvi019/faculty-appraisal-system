from pydantic import BaseModel
from datetime import date

class AppraisalCreate(BaseModel):
    faculty_id: int
    academic_year: str
    submission_date: date | None = None