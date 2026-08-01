from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from app.models.enums import SkillLevel


class ProfileSkillBase(BaseModel):
    skill_id: UUID
    level: SkillLevel
    years_of_experience: float | None = None


class ProfileSkillCreate(ProfileSkillBase):
    pass


class ProfileSkillUpdate(BaseModel):
    level: SkillLevel | None = None
    years_of_experience: float | None = None


class ProfileSkillRead(ProfileSkillBase):
    id: UUID
    profile_id: UUID
    created_at: datetime

    model_config = ConfigDict(from_attributes=True)
