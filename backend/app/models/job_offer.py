from __future__ import annotations

from datetime import datetime
from decimal import Decimal
from typing import TYPE_CHECKING
from uuid import UUID

from sqlalchemy import (
    DateTime,
    Enum as SQLEnum,
    ForeignKey,
    Numeric,
    String,
    Text,
    func,
)
from sqlalchemy.dialects.postgresql import UUID as PG_UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.base import Base
from app.models.enums import (
    ContractType,
    EducationLevel,
    ExperienceLevel,
    JobOfferStatus,
    RemoteType,
)

if TYPE_CHECKING:
    from app.models.application import Application
    from app.models.company import Company
    from app.models.favorite import Favorite
    from app.models.interview import InterviewSession
    from app.models.job_match import JobMatch
    from app.models.job_source import JobSource


class JobOffer(Base):
    __tablename__ = "job_offers"

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    company_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey("company.id", ondelete="RESTRICT"),
        nullable=False,
    )

    job_source_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey("job_source.id", ondelete="RESTRICT"),
        nullable=False,
    )

    external_id: Mapped[str | None] = mapped_column(
        String(255),
    )

    title: Mapped[str] = mapped_column(
        String(255),
        nullable=False,
    )

    description: Mapped[str] = mapped_column(
        Text,
        nullable=False,
    )

    location: Mapped[str] = mapped_column(
        String(150),
        nullable=False,
    )

    contract_type: Mapped[ContractType] = mapped_column(
        SQLEnum(ContractType, name="contract_type"),
        nullable=False,
    )

    experience_level: Mapped[ExperienceLevel | None] = mapped_column(
        SQLEnum(ExperienceLevel, name="experience_level"),
    )

    education_level: Mapped[EducationLevel | None] = mapped_column(
        SQLEnum(EducationLevel, name="education_level"),
    )

    salary_min: Mapped[Decimal | None] = mapped_column(
        Numeric(10, 2),
    )

    salary_max: Mapped[Decimal | None] = mapped_column(
        Numeric(10, 2),
    )

    remote_type: Mapped[RemoteType | None] = mapped_column(
        SQLEnum(RemoteType, name="remote_type"),
    )

    status: Mapped[JobOfferStatus] = mapped_column(
        SQLEnum(JobOfferStatus, name="job_offer_status"),
        nullable=False,
        server_default="OPEN",
    )

    application_url: Mapped[str | None] = mapped_column(
        Text,
    )

    published_at: Mapped[datetime | None] = mapped_column(
        DateTime(timezone=True),
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        nullable=False,
        server_default=func.now(),
    )

    updated_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        nullable=False,
        server_default=func.now(),
    )

    # ===========================
    # Relationships
    # ===========================

    company: Mapped["Company"] = relationship(
        back_populates="job_offers",
    )

    job_source: Mapped["JobSource"] = relationship(
        back_populates="job_offers",
    )

    applications: Mapped[list["Application"]] = relationship(
        back_populates="job_offer",
        cascade="all, delete-orphan",
    )

    favorites: Mapped[list["Favorite"]] = relationship(
        back_populates="job_offer",
        cascade="all, delete-orphan",
    )

    job_matches: Mapped[list["JobMatch"]] = relationship(
        back_populates="job_offer",
        cascade="all, delete-orphan",
    )

    interview_sessions: Mapped[list["InterviewSession"]] = relationship(
        back_populates="job_offer",
        cascade="all, delete-orphan",
    )

    def __repr__(self) -> str:
        return (
            f"<JobOffer(id={self.id}, title='{self.title}')>"
        )
