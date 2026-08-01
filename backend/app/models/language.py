from typing import TYPE_CHECKING
from uuid import UUID

from sqlalchemy import String
from sqlalchemy.dialects.postgresql import UUID as PG_UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.base import Base

if TYPE_CHECKING:
    from app.models.profile_language import ProfileLanguage

class Language(Base):
    __tablename__ = "language"

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    name: Mapped[str] = mapped_column(
        String(100),
        unique=True,
        nullable=False,
    )

    profiles: Mapped[list["ProfileLanguage"]] = relationship(
        back_populates="language",
        cascade="all, delete-orphan",
    )

    def __repr__(self) -> str:
        return f"<Language(name='{self.name}')>"
