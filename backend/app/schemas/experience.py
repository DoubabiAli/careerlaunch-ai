from datetime import date, datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from app.models.enums import ContractType


class ExperienceBase(BaseModel):
    company_name: str
    job_title: str
    contract_type: ContractType | None = None
    start_date: date
    end_date: date | None = None
    is_current: bool = False
    description: str | None = None


class ExperienceCreate(ExperienceBase):
    pass


class ExperienceUpdate(BaseModel):
    company_name: str | None = None
    job_title: str | None = None
    contract_type: ContractType | None = None
    start_date: date | None = None
    end_date: date | None = None
    is_current: bool | None = None
    description: str | None = None


class ExperienceRead(ExperienceBase):
    id: UUID
    profile_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
