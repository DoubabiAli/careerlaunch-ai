from datetime import date, datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict


class ProjectBase(BaseModel):
    title: str
    description: str | None = None
    technologies: str | None = None
    repository_url: str | None = None
    live_demo_url: str | None = None
    start_date: date | None = None
    end_date: date | None = None


class ProjectCreate(ProjectBase):
    pass


class ProjectUpdate(BaseModel):
    title: str | None = None
    description: str | None = None
    technologies: str | None = None
    repository_url: str | None = None
    live_demo_url: str | None = None
    start_date: date | None = None
    end_date: date | None = None


class ProjectRead(ProjectBase):
    id: UUID
    profile_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
