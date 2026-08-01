from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from app.models.enums import CVGenerationStatus


class CVBase(BaseModel):
    title: str
    file_url: str | None = None
    generation_status: CVGenerationStatus = CVGenerationStatus.PENDING
    score: float | None = None
    ats_score: float | None = None
    analysis_json: dict | None = None


class CVCreate(CVBase):
    pass


class CVUpdate(BaseModel):
    title: str | None = None
    file_url: str | None = None
    generation_status: CVGenerationStatus | None = None
    score: float | None = None
    ats_score: float | None = None
    analysis_json: dict | None = None


class CVRead(CVBase):
    id: UUID
    profile_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
