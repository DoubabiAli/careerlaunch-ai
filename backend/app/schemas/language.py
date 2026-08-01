from uuid import UUID

from pydantic import BaseModel, ConfigDict


class LanguageBase(BaseModel):
    name: str


class LanguageCreate(LanguageBase):
    pass


class LanguageUpdate(BaseModel):
    name: str | None = None


class LanguageRead(LanguageBase):
    id: UUID

    model_config = ConfigDict(from_attributes=True)
