from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict, HttpUrl


class ProfileBase(BaseModel):
    first_name: str
    last_name: str
    phone: str | None = None
    city: str | None = None
    country: str | None = None
    linkedin_url: HttpUrl | None = None
    github_url: HttpUrl | None = None
    headline: str | None = None
    summary: str | None = None
    profile_picture_url: HttpUrl | None = None


class ProfileCreate(ProfileBase):
    pass


class ProfileUpdate(BaseModel):
    first_name: str | None = None
    last_name: str | None = None
    phone: str | None = None
    city: str | None = None
    country: str | None = None
    linkedin_url: HttpUrl | None = None
    github_url: HttpUrl | None = None
    headline: str | None = None
    summary: str | None = None
    profile_picture_url: HttpUrl | None = None


class ProfileRead(ProfileBase):
    id: UUID
    user_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
