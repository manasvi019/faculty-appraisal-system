from fastapi import APIRouter
from sqlalchemy.orm import Session
from app.database.connection import SessionLocal
from app.models.publication import Publication
from app.schemas.publication import PublicationCreate

router = APIRouter(prefix="/publication", tags=["Publication"])

@router.post("/create")
def create_publication(publication: PublicationCreate):

    db: Session = SessionLocal()

    new_publication = Publication(

        form_id = publication.form_id,
        title = publication.title,
        journal_name = publication.journal_name,
        year = publication.year

    )

    db.add(new_publication)

    db.commit()

    db.refresh(new_publication)

    return {
        "message": "Publication added successfully"
    }