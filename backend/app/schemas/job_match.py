from datetime import datetime
from decimal import Decimal
from uuid import UUID

from pydantic import BaseModel, ConfigDict


class JobMatchBase(BaseModel):
    job_offer_id: UUID
    compatibility_score: Decimal
    skills_score: Decimal | None = None
    education_score: Decimal | None = None
    experience_score: Decimal | None = None
    domain_score: Decimal | None = None
    match_reason: str | None = None


class JobMatchCreate(JobMatchBase):
    pass


class JobMatchUpdate(BaseModel):
    compatibility_score: Decimal | None = None
    skills_score: Decimal | None = None
    education_score: Decimal | None = None
    experience_score: Decimal | None = None
    domain_score: Decimal | None = None
    match_reason: str | None = None


class JobMatchRead(JobMatchBase):
    id: UUID
    profile_id: UUID
    created_at: datetime

    model_config = ConfigDict(from_attributes=True)
