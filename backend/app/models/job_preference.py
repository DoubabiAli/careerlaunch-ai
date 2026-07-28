from datetime import datetime
from typing import TYPE_CHECKING
from uuid import UUID

from sqlalchemy import DateTime, Enum as SQLEnum, ForeignKey, Numeric, String, func
from sqlalchemy.dialects.postgresql import UUID as PG_UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.base import Base
from app.models.enums import ContractType, RemoteType

if TYPE_CHECKING:
    from app.models.user import User


class JobPreference(Base):
    __tablename__ = "job_preferences"

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    user_id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        ForeignKey("users.id", ondelete="CASCADE"),
        nullable=False,
        unique=True,
    )

    desired_contract_type: Mapped[ContractType | None] = mapped_column(
        SQLEnum(ContractType, name="contract_type"),
    )

    preferred_city: Mapped[str | None] = mapped_column(
        String(100),
    )

    expected_salary: Mapped[float | None] = mapped_column(
        Numeric(10, 2),
    )

    remote_type: Mapped[RemoteType | None] = mapped_column(
        SQLEnum(RemoteType, name="remote_type"),
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

    user: Mapped["User"] = relationship(
        back_populates="preferences",
    )

    def __repr__(self) -> str:
        return f"<JobPreference(user_id={self.user_id})>"
