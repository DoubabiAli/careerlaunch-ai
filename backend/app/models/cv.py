from datetime import datetime
from decimal import Decimal
from typing import TYPE_CHECKING
from uuid import UUID

from sqlalchemy import DateTime, Enum as SQLEnum, ForeignKey, Numeric, String, Text, func
from sqlalchemy.dialects.postgresql import JSONB
from sqlalchemy.dialects.postgresql import UUID as PG_UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.base import Base
from app.models.enums import CVGenerationStatus

if TYPE_CHECKING:
    from app.models.application import Application
    from app.models.profile import Profile


class CV(Base):
    __tablename__ = "cv"

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    profile_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey("profiles.id", ondelete="CASCADE"),
        nullable=False,
    )

    title: Mapped[str] = mapped_column(
        String(150),
        nullable=False,
    )

    file_url: Mapped[str | None] = mapped_column(Text)

    generation_status: Mapped[CVGenerationStatus] = mapped_column(
        SQLEnum(CVGenerationStatus, name="cv_generation_status"),
        nullable=False,
        server_default="PENDING",
    )

    score: Mapped[Decimal | None] = mapped_column(
        Numeric(5, 2),
    )

    ats_score: Mapped[Decimal | None] = mapped_column(
        Numeric(5, 2),
    )

    analysis_json: Mapped[dict | None] = mapped_column(
        JSONB,
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    updated_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    profile: Mapped["Profile"] = relationship(
        back_populates="cvs",
    )

    applications: Mapped[list["Application"]] = relationship(
        back_populates="cv",
    )

    def __repr__(self):
        return f"<CV(title='{self.title}')>"
