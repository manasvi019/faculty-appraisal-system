from app.schemas.review import ReviewUpdate
from typing import List
from app.schemas.appraisal_response import AppraisalResponse
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from datetime import date

from app.database.connection import get_db
from app.models.appraisal_form import AppraisalForm
from app.schemas.appraisal import AppraisalCreate

router = APIRouter(prefix="/appraisal", tags=["Appraisal"])


@router.post("/create")
def create_appraisal(data: AppraisalCreate, db: Session = Depends(get_db)):
    new_form = AppraisalForm(
        faculty_id=data.faculty_id,
        academic_year=data.academic_year,
        submission_date=data.submission_date or date.today(),
        status="Pending"
    )

    db.add(new_form)
    db.commit()
    db.refresh(new_form)

    return {
        "message": "Appraisal form created",
        "form_id": new_form.form_id
    }
@router.get("/faculty/{faculty_id}", response_model=List[AppraisalResponse])
def get_faculty_appraisals(faculty_id: int, db: Session = Depends(get_db)):
    forms = (
        db.query(AppraisalForm)
        .filter(AppraisalForm.faculty_id == faculty_id)
        .order_by(AppraisalForm.form_id.desc())
        .all()
    )

    return forms
@router.put("/review/{form_id}")
def review_appraisal(form_id: int, data: ReviewUpdate, db: Session = Depends(get_db)):
    form = db.query(AppraisalForm).filter(AppraisalForm.form_id == form_id).first()

    if not form:
        raise HTTPException(status_code=404, detail="Appraisal form not found")

    form.status = data.status
    db.commit()
    db.refresh(form)

    return {
        "message": "Status updated",
        "form_id": form.form_id,
        "new_status": form.status
    }
@router.get("/all", response_model=list[AppraisalResponse])
def get_all_appraisals(db: Session = Depends(get_db)):
    forms = (
        db.query(AppraisalForm)
        .order_by(AppraisalForm.form_id.desc())
        .all()
    )
    return forms