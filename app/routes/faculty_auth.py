from app.schemas.faculty import FacultyResponse, FacultyCreate
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.database.connection import SessionLocal

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

@router.post("/create")
def create_faculty(faculty: FacultyCreate):

    db: Session = SessionLocal()

    new_faculty = Faculty(

        name = faculty.name,
        email = faculty.email,
        password = faculty.password,
        designation = faculty.designation,
        department = faculty.department

    )

    db.add(new_faculty)

    db.commit()

    db.refresh(new_faculty)

    return {
        "message": "Faculty created successfully"
    }

@router.get("/profile/{faculty_id}", response_model=FacultyResponse)
def get_faculty_profile(faculty_id: int, db: Session = Depends(get_db)):
    faculty = db.query(Faculty).filter(Faculty.faculty_id == faculty_id).first()

    if not faculty:
        raise HTTPException(status_code=404, detail="Faculty not found")

    return faculty

@router.get("/all")
def get_all_faculties(db: Session = Depends(get_db)):

    faculties = db.query(Faculty).all()

    return faculties