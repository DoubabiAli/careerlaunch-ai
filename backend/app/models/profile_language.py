from datetime import datetime
from typing import TYPE_CHECKING
from uuid import UUID

from sqlalchemy import DateTime, Enum as SQLEnum, ForeignKey, UniqueConstraint, func
from sqlalchemy.dialects.postgresql import UUID as PG_UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.base import Base
from app.models.enums import LanguageLevel

if TYPE_CHECKING:
    from app.models.profile import Profile
    from app.models.language import Language


class ProfileLanguage(Base):
    __tablename__ = "profile_languages"

    __table_args__ = (
        UniqueConstraint(
            "profile_id",
            "language_id",
            name="uq_profile_language",
        ),
    )

    id: Mapped[UUID] = mapped_column(PG_UUID(as_uuid=True), primary_key=True)

    profile_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey("profiles.id", ondelete="CASCADE"),
        nullable=False,
    )

    language_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey("language.id", ondelete="CASCADE"),
        nullable=False,
    )

    level: Mapped[LanguageLevel] = mapped_column(
        SQLEnum(LanguageLevel, name="language_level"),
        nullable=False,
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    profile: Mapped["Profile"] = relationship(back_populates="languages")
    language: Mapped["Language"] = relationship(back_populates="profiles")
