from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from app.models.enums import (
    ContractType,
    EducationLevel,
    ExperienceLevel,
    JobOfferStatus,
    RemoteType,
)


class JobOfferBase(BaseModel):
    company_id: UUID
    job_source_id: UUID
    external_id: str | None = None
    title: str
    description: str
    location: str
    contract_type: ContractType
    experience_level: ExperienceLevel | None = None
    education_level: EducationLevel | None = None
    salary_min: float | None = None
    salary_max: float | None = None
    remote_type: RemoteType | None = None
    status: JobOfferStatus = JobOfferStatus.OPEN
    application_url: str | None = None
    published_at: datetime | None = None


class JobOfferCreate(JobOfferBase):
    pass


class JobOfferUpdate(BaseModel):
    company_id: UUID | None = None
    job_source_id: UUID | None = None
    external_id: str | None = None
    title: str | None = None
    description: str | None = None
    location: str | None = None
    contract_type: ContractType | None = None
    experience_level: ExperienceLevel | None = None
    education_level: EducationLevel | None = None
    salary_min: float | None = None
    salary_max: float | None = None
    remote_type: RemoteType | None = None
    status: JobOfferStatus | None = None
    application_url: str | None = None
    published_at: datetime | None = None


class JobOfferRead(JobOfferBase):
    id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
