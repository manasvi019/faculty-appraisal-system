from fastapi import APIRouter
from sqlalchemy.orm import Session

from app.database.connection import SessionLocal
from app.models.seminar import Seminar
from app.schemas.seminar import SeminarCreate

router = APIRouter(prefix="/seminar", tags=["Seminar"])

@router.post("/create")
def create_seminar(seminar: SeminarCreate):

    db: Session = SessionLocal()

    new_seminar = Seminar(

        form_id = seminar.form_id,
        title = seminar.title,
        location = seminar.location,
        date = seminar.date

    )

    db.add(new_seminar)

    db.commit()

    db.refresh(new_seminar)

    return {
        "message": "Seminar added successfully"
    }