from datetime import date, datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from app.models.enums import EducationLevel


class EducationBase(BaseModel):
    institution: str
    degree: str
    field: str | None = None
    education_level: EducationLevel
    start_date: date
    end_date: date | None = None
    is_current: bool = False
    description: str | None = None


class EducationCreate(EducationBase):
    pass


class EducationUpdate(BaseModel):
    institution: str | None = None
    degree: str | None = None
    field: str | None = None
    education_level: EducationLevel | None = None
    start_date: date | None = None
    end_date: date | None = None
    is_current: bool | None = None
    description: str | None = None


class EducationRead(EducationBase):
    id: UUID
    profile_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
