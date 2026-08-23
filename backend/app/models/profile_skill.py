from datetime import datetime
from typing import TYPE_CHECKING
from uuid import UUID

from sqlalchemy import (
    DateTime,
    Enum as SQLEnum,
    ForeignKey,
    Numeric,
    UniqueConstraint,
    func,
    text,
)
from sqlalchemy.dialects.postgresql import UUID as PG_UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.base import Base
from app.models.enums import SkillLevel

if TYPE_CHECKING:
    from app.models.profile import Profile
    from app.models.skill import Skill


class ProfileSkill(Base):
    __tablename__ = "profile_skills"

    __table_args__ = (
        UniqueConstraint(
            "profile_id",
            "skill_id",
            name="uq_profile_skill",
        ),
    )

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
        server_default=text("gen_random_uuid()"),
    )

    profile_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey(
            "profiles.id",
            ondelete="CASCADE",
        ),
        nullable=False,
    )

    skill_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey(
            "skill.id",
            ondelete="CASCADE",
        ),
        nullable=False,
    )

    level: Mapped[SkillLevel] = mapped_column(
        SQLEnum(
            SkillLevel,
            name="skill_level",
        ),
        nullable=False,
    )

    years_of_experience: Mapped[float | None] = mapped_column(
        Numeric(4, 1),
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    profile: Mapped["Profile"] = relationship(
        back_populates="skills",
    )

    skill: Mapped["Skill"] = relationship(
        back_populates="profiles",
    )

    def __repr__(self) -> str:
        return (
            f"<ProfileSkill("
            f"id={self.id}, "
            f"profile_id={self.profile_id}, "
            f"skill_id={self.skill_id}, "
            f"level='{self.level}'"
            f")>"
        )
