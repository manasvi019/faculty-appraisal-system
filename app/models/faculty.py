from sqlalchemy import Column, Integer, String
from app.database.base import Base

class Faculty(Base):
    __tablename__ = "faculty"

    faculty_id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    name = Column(String(100), nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    password = Column(String(255), nullable=False)
    designation = Column(String(100), nullable=False)
    department = Column(String(100), nullable=False)