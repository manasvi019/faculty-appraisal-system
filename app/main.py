from app.routes.admin_auth import router as admin_router
from app.routes.publication import router as publication_router
from app.routes.project import router as project_router
from app.routes.seminar import router as seminar_router
from app.routes.appraisal import router as appraisal_router
from app.routes.faculty_auth import router as faculty_router
from app.models.faculty import Faculty
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import text
from app.database.connection import engine

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
app.include_router(faculty_router)
app.include_router(appraisal_router)
app.include_router(admin_router)
app.include_router(publication_router)
app.include_router(project_router)
app.include_router(seminar_router)

@app.get("/")
def read_root():
    try:
        with engine.connect() as conn:
            conn.execute(text("SELECT 1"))
        return {"message": "Database connected successfully"}
    except Exception as e:
        return {"error": str(e)}