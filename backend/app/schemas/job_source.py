from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict, HttpUrl


class JobSourceBase(BaseModel):
    name: str
    website: HttpUrl | None = None
    description: str | None = None


class JobSourceCreate(JobSourceBase):
    pass


class JobSourceUpdate(BaseModel):
    name: str | None = None
    website: HttpUrl | None = None
    description: str | None = None


class JobSourceRead(JobSourceBase):
    id: UUID
    created_at: datetime

    model_config = ConfigDict(from_attributes=True)
