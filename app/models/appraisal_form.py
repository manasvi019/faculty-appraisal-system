from sqlalchemy import Column, Integer, String, Date, ForeignKey
from app.database.base import Base


class AppraisalForm(Base):
    __tablename__ = "appraisal_form"

    form_id = Column(Integer, primary_key=True, index=True)
    faculty_id = Column(Integer, ForeignKey("faculty.faculty_id"))
    academic_year = Column(String(20))
    submission_date = Column(Date)
    status = Column(String(20))