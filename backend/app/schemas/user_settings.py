from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict


class UserSettingsBase(BaseModel):
    preferred_language: str = "en"
    dark_mode: bool = False
    email_notifications: bool = True
    push_notifications: bool = True


class UserSettingsCreate(UserSettingsBase):
    pass


class UserSettingsUpdate(BaseModel):
    preferred_language: str | None = None
    dark_mode: bool | None = None
    email_notifications: bool | None = None
    push_notifications: bool | None = None


class UserSettingsRead(UserSettingsBase):
    id: UUID
    user_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
