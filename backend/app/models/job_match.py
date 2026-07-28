from __future__ import annotations

from datetime import datetime
from decimal import Decimal
from typing import TYPE_CHECKING
from uuid import UUID

from sqlalchemy import (
    DateTime,
    ForeignKey,
    Numeric,
    Text,
    UniqueConstraint,
    func,
)
from sqlalchemy.dialects.postgresql import UUID as PG_UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.base import Base

if TYPE_CHECKING:
    from app.models.job_offer import JobOffer
    from app.models.profile import Profile


class JobMatch(Base):
    __tablename__ = "job_matches"

    __table_args__ = (
        UniqueConstraint(
            "profile_id",
            "job_offer_id",
            name="uq_job_match",
        ),
    )

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    profile_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey("profiles.id", ondelete="CASCADE"),
        nullable=False,
    )

    job_offer_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey("job_offers.id", ondelete="CASCADE"),
        nullable=False,
    )

    compatibility_score: Mapped[Decimal] = mapped_column(
        Numeric(5, 2),
        nullable=False,
    )

    skills_score: Mapped[Decimal | None] = mapped_column(
        Numeric(5, 2),
    )

    education_score: Mapped[Decimal | None] = mapped_column(
        Numeric(5, 2),
    )

    experience_score: Mapped[Decimal | None] = mapped_column(
        Numeric(5, 2),
    )

    domain_score: Mapped[Decimal | None] = mapped_column(
        Numeric(5, 2),
    )

    match_reason: Mapped[str | None] = mapped_column(
        Text,
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        nullable=False,
        server_default=func.now(),
    )

    profile: Mapped["Profile"] = relationship(
        back_populates="job_matches",
    )

    job_offer: Mapped["JobOffer"] = relationship(
        back_populates="job_matches",
    )

    def __repr__(self) -> str:
        return (
            f"<JobMatch(profile_id={self.profile_id}, "
            f"job_offer_id={self.job_offer_id}, "
            f"score={self.compatibility_score})>"
        )
