from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict, HttpUrl


class CompanyBase(BaseModel):
    name: str
    description: str | None = None
    website: HttpUrl | None = None
    logo_url: HttpUrl | None = None
    industry: str | None = None
    location: str | None = None
    company_size: int | None = None


class CompanyCreate(CompanyBase):
    pass


class CompanyUpdate(BaseModel):
    name: str | None = None
    description: str | None = None
    website: HttpUrl | None = None
    logo_url: HttpUrl | None = None
    industry: str | None = None
    location: str | None = None
    company_size: int | None = None


class CompanyRead(CompanyBase):
    id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
