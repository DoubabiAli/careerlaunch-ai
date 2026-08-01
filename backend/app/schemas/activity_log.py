from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict


class ActivityLogBase(BaseModel):
    action: str
    description: str | None = None
    ip_address: str | None = None
    user_agent: str | None = None


class ActivityLogCreate(ActivityLogBase):
    pass


class ActivityLogRead(ActivityLogBase):
    id: UUID
    user_id: UUID
    created_at: datetime

    model_config = ConfigDict(from_attributes=True)
