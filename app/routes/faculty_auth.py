from app.schemas.faculty import FacultyResponse
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.database.connection import get_db
from app.models.faculty import Faculty
from app.schemas.faculty_auth import FacultyLogin

router = APIRouter(prefix="/faculty", tags=["Faculty"])

@router.post("/login")
def faculty_login(data: FacultyLogin, db: Session = Depends(get_db)):
    faculty = db.query(Faculty).filter(Faculty.email == data.email).first()

    if not faculty:
        raise HTTPException(status_code=404, detail="Faculty not found")

    if faculty.password != data.password:
        raise HTTPException(status_code=401, detail="Invalid password")

    return {
        "message": "Login successful",
        "faculty_id": faculty.faculty_id,
        "name": faculty.name
    }
@router.get("/profile/{faculty_id}", response_model=FacultyResponse)
def get_faculty_profile(faculty_id: int, db: Session = Depends(get_db)):
    faculty = db.query(Faculty).filter(Faculty.faculty_id == faculty_id).first()

    if not faculty:
        raise HTTPException(status_code=404, detail="Faculty not found")

    return faculty