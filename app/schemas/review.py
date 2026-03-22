from pydantic import BaseModel


class ReviewUpdate(BaseModel):
    status: str  # Approved / Rejected