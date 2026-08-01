from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from app.models.enums import LanguageLevel


class ProfileLanguageBase(BaseModel):
    language_id: UUID
    level: LanguageLevel


class ProfileLanguageCreate(ProfileLanguageBase):
    pass


class ProfileLanguageUpdate(BaseModel):
    level: LanguageLevel | None = None


class ProfileLanguageRead(ProfileLanguageBase):
    id: UUID
    profile_id: UUID
    created_at: datetime

    model_config = ConfigDict(from_attributes=True)
