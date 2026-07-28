from typing import TYPE_CHECKING
from datetime import datetime
from uuid import UUID

from sqlalchemy import DateTime, Integer, String, Text, func
from sqlalchemy.dialects.postgresql import UUID as PG_UUID
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.models.base import Base

if TYPE_CHECKING:
    from app.models.job_offer import JobOffer

class Company(Base):
    __tablename__ = "company"

    id: Mapped[UUID] = mapped_column(
        PG_UUID(as_uuid=True),
        primary_key=True,
    )

    name: Mapped[str] = mapped_column(
        String(150),
        unique=True,
        nullable=False,
    )

    description: Mapped[str | None] = mapped_column(Text)

    website: Mapped[str | None] = mapped_column(Text)

    logo_url: Mapped[str | None] = mapped_column(Text)

    industry: Mapped[str | None] = mapped_column(
        String(100),
    )

    location: Mapped[str | None] = mapped_column(
        String(150),
    )

    company_size: Mapped[int | None] = mapped_column(
        Integer,
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    updated_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
    )

    job_offers: Mapped[list["JobOffer"]] = relationship(
        back_populates="company",
    )

    def __repr__(self) -> str:
        return f"<Company(name='{self.name}')>"
