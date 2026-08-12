from datetime import date, datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict


class ProjectBase(BaseModel):
    title: str
    description: str | None = None
    technologies: str | None = None
    github_url: str | None = None
    demo_url: str | None = None
    start_date: date | None = None
    end_date: date | None = None
    is_current: bool = False


class ProjectCreate(ProjectBase):
    pass


class ProjectUpdate(BaseModel):
    title: str | None = None
    description: str | None = None
    technologies: str | None = None
    github_url: str | None = None
    demo_url: str | None = None
    start_date: date | None = None
    end_date: date | None = None
    is_current: bool | None = None


class ProjectRead(ProjectBase):
    id: UUID
    profile_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
