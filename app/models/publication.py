from app.models.appraisal_form import AppraisalForm
from sqlalchemy import Column, Integer, String, ForeignKey
from app.database.connection import Base

class Publication(Base):

    __tablename__ = "publication"

    publication_id = Column(Integer, primary_key=True, index=True)

    form_id = Column(Integer)

    title = Column(String(255))

    journal_name = Column(String(255))

    year = Column(Integer)