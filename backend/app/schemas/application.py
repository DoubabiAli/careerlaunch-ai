from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from app.models.enums import ApplicationStatus


class ApplicationBase(BaseModel):
    job_offer_id: UUID
    cv_id: UUID | None = None
    cover_letter: str | None = None
    status: ApplicationStatus = ApplicationStatus.PENDING
    applied_at: datetime | None = None
    notes: str | None = None


class ApplicationCreate(ApplicationBase):
    pass


class ApplicationUpdate(BaseModel):
    job_offer_id: UUID | None = None
    cv_id: UUID | None = None
    cover_letter: str | None = None
    status: ApplicationStatus | None = None
    applied_at: datetime | None = None
    notes: str | None = None


class ApplicationRead(ApplicationBase):
    id: UUID
    profile_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
