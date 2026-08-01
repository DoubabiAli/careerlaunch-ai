from uuid import UUID

from pydantic import BaseModel, ConfigDict


class DocumentTypeBase(BaseModel):
    name: str
    description: str | None = None


class DocumentTypeCreate(DocumentTypeBase):
    pass


class DocumentTypeUpdate(BaseModel):
    name: str | None = None
    description: str | None = None


class DocumentTypeRead(DocumentTypeBase):
    id: UUID

    model_config = ConfigDict(from_attributes=True)
