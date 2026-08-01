from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict


class FavoriteBase(BaseModel):
    job_offer_id: UUID


class FavoriteCreate(FavoriteBase):
    pass


class FavoriteRead(FavoriteBase):
    id: UUID
    profile_id: UUID
    created_at: datetime

    model_config = ConfigDict(from_attributes=True)
