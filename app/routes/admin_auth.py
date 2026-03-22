from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.database.connection import get_db
from app.models.admin import Admin
from app.schemas.admin_auth import AdminLogin

router = APIRouter(prefix="/admin", tags=["Admin"])


@router.post("/login")
def admin_login(data: AdminLogin, db: Session = Depends(get_db)):
    admin = db.query(Admin).filter(Admin.email == data.email).first()

    if not admin:
        raise HTTPException(status_code=404, detail="Admin not found")

    if admin.password != data.password:
        raise HTTPException(status_code=401, detail="Invalid password")

    return {
        "message": "Admin login successful",
        "admin_id": admin.admin_id
    }