from datetime import date, datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict


class CertificationBase(BaseModel):
    name: str
    organization: str | None = None
    issue_date: date | None = None
    expiration_date: date | None = None
    credential_url: str | None = None
    description: str | None = None


class CertificationCreate(CertificationBase):
    pass


class CertificationUpdate(BaseModel):
    name: str | None = None
    organization: str | None = None
    issue_date: date | None = None
    expiration_date: date | None = None
    credential_url: str | None = None
    description: str | None = None


class CertificationRead(CertificationBase):
    id: UUID
    profile_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
