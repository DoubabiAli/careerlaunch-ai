from uuid import UUID

from pydantic import BaseModel, ConfigDict


class SkillBase(BaseModel):
    name: str
    category: str


class SkillCreate(SkillBase):
    pass


class SkillUpdate(BaseModel):
    name: str | None = None
    category: str | None = None


class SkillRead(SkillBase):
    id: UUID

    model_config = ConfigDict(from_attributes=True)
