from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict


class DocumentBase(BaseModel):
    document_type_id: UUID
    title: str
    file_url: str
    file_size: int | None = None
    mime_type: str | None = None


class DocumentCreate(DocumentBase):
    pass


class DocumentUpdate(BaseModel):
    document_type_id: UUID | None = None
    title: str | None = None
    file_url: str | None = None
    file_size: int | None = None
    mime_type: str | None = None


class DocumentRead(DocumentBase):
    id: UUID
    profile_id: UUID
    uploaded_at: datetime

    model_config = ConfigDict(from_attributes=True)
