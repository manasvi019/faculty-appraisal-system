from sqlalchemy import Column, Integer, String
from app.database.connection import Base

class Project(Base):

    __tablename__ = "project"

    project_id = Column(Integer, primary_key=True, index=True)

    form_id = Column(Integer)

    project_title = Column(String(255))

    funding_agency = Column(String(255))

    duration = Column(String(100))