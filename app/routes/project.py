from fastapi import APIRouter
from sqlalchemy.orm import Session

from app.database.connection import SessionLocal
from app.models.project import Project
from app.schemas.project import ProjectCreate

router = APIRouter(prefix="/project", tags=["Project"])

@router.post("/create")
def create_project(project: ProjectCreate):

    db: Session = SessionLocal()

    new_project = Project(

        form_id = project.form_id,
        project_title = project.project_title,
        funding_agency = project.funding_agency,
        duration = project.duration

    )

    db.add(new_project)

    db.commit()

    db.refresh(new_project)

    return {
        "message": "Project added successfully"
    }