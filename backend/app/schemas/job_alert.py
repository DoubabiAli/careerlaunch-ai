from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from app.models.enums import ContractType


class JobAlertBase(BaseModel):
    title: str
    keyword: str | None = None
    city: str | None = None
    contract_type: ContractType | None = None
    is_active: bool = True


class JobAlertCreate(JobAlertBase):
    pass


class JobAlertUpdate(BaseModel):
    title: str | None = None
    keyword: str | None = None
    city: str | None = None
    contract_type: ContractType | None = None
    is_active: bool | None = None


class JobAlertRead(JobAlertBase):
    id: UUID
    user_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
