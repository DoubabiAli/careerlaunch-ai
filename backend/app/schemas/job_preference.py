from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from app.models.enums import ContractType, RemoteType


class JobPreferenceBase(BaseModel):
    desired_contract_type: ContractType | None = None
    preferred_city: str | None = None
    expected_salary: float | None = None
    remote_type: RemoteType | None = None


class JobPreferenceCreate(JobPreferenceBase):
    pass


class JobPreferenceUpdate(BaseModel):
    desired_contract_type: ContractType | None = None
    preferred_city: str | None = None
    expected_salary: float | None = None
    remote_type: RemoteType | None = None


class JobPreferenceRead(JobPreferenceBase):
    id: UUID
    user_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)
