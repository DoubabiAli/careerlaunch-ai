from datetime import datetime
from decimal import Decimal
from typing import TYPE_CHECKING
from uuid import UUID

from sqlalchemy import (
    DateTime,
    Enum as SQLEnum,
    ForeignKey,
    Integer,
    Numeric,
    String,
    Text,
    UniqueConstraint,
    func,
)
from sqlalchemy.dialects.postgresql import UUID as PG_UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.base import Base
from app.models.enums import InterviewStatus

if TYPE_CHECKING:
    from app.models.job_offer import JobOffer
    from app.models.profile import Profile


# ============================================================
# Interview Session
# ============================================================

class InterviewSession(Base):
    __tablename__ = "interview_sessions"

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    profile_id: Mapped[UUID] = mapped_column(
        ForeignKey("profiles.id", ondelete="CASCADE"),
        nullable=False,
    )

    job_offer_id: Mapped[UUID | None] = mapped_column(
        ForeignKey("job_offers.id", ondelete="SET NULL"),
    )

    title: Mapped[str] = mapped_column(
        String(255),
        nullable=False,
    )

    duration_seconds: Mapped[int | None]

    status: Mapped[InterviewStatus] = mapped_column(
        SQLEnum(
            InterviewStatus,
            name="interview_status",
        ),
        nullable=False,
        server_default="NOT_STARTED",
    )

    started_at: Mapped[datetime | None]

    completed_at: Mapped[datetime | None]

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    profile: Mapped["Profile"] = relationship(
        back_populates="interview_sessions",
    )

    job_offer: Mapped["JobOffer"] = relationship(
        back_populates="interview_sessions",
    )

    questions: Mapped[list["InterviewQuestion"]] = relationship(
        back_populates="session",
        cascade="all, delete-orphan",
    )

    report: Mapped["InterviewReport"] = relationship(
        back_populates="session",
        uselist=False,
        cascade="all, delete-orphan",
    )


# ============================================================
# Interview Question
# ============================================================

class InterviewQuestion(Base):
    __tablename__ = "interview_questions"

    __table_args__ = (
        UniqueConstraint(
            "interview_session_id",
            "question_order",
            name="uq_session_question_order",
        ),
    )

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    interview_session_id: Mapped[UUID] = mapped_column(
        ForeignKey(
            "interview_sessions.id",
            ondelete="CASCADE",
        ),
        nullable=False,
    )

    question_order: Mapped[int]

    question: Mapped[str] = mapped_column(
        Text,
        nullable=False,
    )

    category: Mapped[str | None] = mapped_column(
        String(100),
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    session: Mapped["InterviewSession"] = relationship(
        back_populates="questions",
    )

    answer: Mapped["InterviewAnswer"] = relationship(
        back_populates="question",
        uselist=False,
        cascade="all, delete-orphan",
    )


# ============================================================
# Interview Answer
# ============================================================

class InterviewAnswer(Base):
    __tablename__ = "interview_answers"

    __table_args__ = (
        UniqueConstraint(
            "interview_question_id",
            name="uq_interview_answer",
        ),
    )

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    interview_question_id: Mapped[UUID] = mapped_column(
        ForeignKey(
            "interview_questions.id",
            ondelete="CASCADE",
        ),
        nullable=False,
    )

    answer: Mapped[str] = mapped_column(
        Text,
        nullable=False,
    )

    ai_score: Mapped[Decimal | None] = mapped_column(
        Numeric(5, 2),
    )

    ai_feedback: Mapped[str | None] = mapped_column(
        Text,
    )

    response_time_seconds: Mapped[int | None]

    answered_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    question: Mapped["InterviewQuestion"] = relationship(
        back_populates="answer",
    )


# ============================================================
# Interview Report
# ============================================================

class InterviewReport(Base):
    __tablename__ = "interview_reports"

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    interview_session_id: Mapped[UUID] = mapped_column(
        ForeignKey(
            "interview_sessions.id",
            ondelete="CASCADE",
        ),
        unique=True,
        nullable=False,
    )

    overall_score: Mapped[Decimal] = mapped_column(
        Numeric(5, 2),
        nullable=False,
    )

    strengths: Mapped[str | None] = mapped_column(Text)

    weaknesses: Mapped[str | None] = mapped_column(Text)

    recommendations: Mapped[str | None] = mapped_column(Text)

    summary: Mapped[str | None] = mapped_column(Text)

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    session: Mapped["InterviewSession"] = relationship(
        back_populates="report",
    )
