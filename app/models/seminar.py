from sqlalchemy import Column, Integer, String
from app.database.connection import Base

class Seminar(Base):

    __tablename__ = "seminar"

    seminar_id = Column(Integer, primary_key=True, index=True)

    form_id = Column(Integer)

    title = Column(String(255))

    location = Column(String(255))

    date = Column(String(100))