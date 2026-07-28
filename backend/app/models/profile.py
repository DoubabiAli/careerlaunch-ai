from __future__ import annotations

from datetime import datetime
from typing import TYPE_CHECKING
from uuid import UUID

from sqlalchemy import DateTime, ForeignKey, String, Text, func
from sqlalchemy.dialects.postgresql import UUID as PG_UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.base import Base

if TYPE_CHECKING:
    from app.models.application import Application
    from app.models.certification import Certification
    from app.models.cv import CV
    from app.models.document import Document
    from app.models.education import Education
    from app.models.experience import Experience
    from app.models.favorite import Favorite
    from app.models.interview import InterviewSession
    from app.models.job_match import JobMatch
    from app.models.profile_language import ProfileLanguage
    from app.models.profile_skill import ProfileSkill
    from app.models.project import Project
    from app.models.user import User


class Profile(Base):
    __tablename__ = "profiles"

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    user_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey("users.id", ondelete="CASCADE"),
        unique=True,
        nullable=False,
    )

    first_name: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
    )

    last_name: Mapped[str] = mapped_column(
        String(100),
        nullable=False,
    )

    phone: Mapped[str | None] = mapped_column(
        String(30),
    )

    city: Mapped[str | None] = mapped_column(
        String(100),
    )

    country: Mapped[str | None] = mapped_column(
        String(100),
    )

    linkedin_url: Mapped[str | None] = mapped_column(
        Text,
    )

    github_url: Mapped[str | None] = mapped_column(
        Text,
    )

    headline: Mapped[str | None] = mapped_column(
        String(255),
    )

    summary: Mapped[str | None] = mapped_column(
        Text,
    )

    profile_picture_url: Mapped[str | None] = mapped_column(
        Text,
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

    user: Mapped["User"] = relationship(
        back_populates="profile",
    )

    educations: Mapped[list["Education"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    experiences: Mapped[list["Experience"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    projects: Mapped[list["Project"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    certifications: Mapped[list["Certification"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    cvs: Mapped[list["CV"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    documents: Mapped[list["Document"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    skills: Mapped[list["ProfileSkill"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    languages: Mapped[list["ProfileLanguage"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    applications: Mapped[list["Application"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    favorites: Mapped[list["Favorite"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    job_matches: Mapped[list["JobMatch"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    interview_sessions: Mapped[list["InterviewSession"]] = relationship(
        back_populates="profile",
        cascade="all, delete-orphan",
    )

    def __repr__(self) -> str:
        return (
            f"<Profile(id={self.id}, "
            f"name='{self.first_name} {self.last_name}')>"
        )
