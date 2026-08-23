from uuid import UUID

from sqlalchemy import select
from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.certification import Certification
from app.schemas.certification import (
    CertificationCreate,
    CertificationUpdate,
)


class CRUDCertification(
    CRUDBase[
        Certification,
        CertificationCreate,
        CertificationUpdate,
    ]
):

    def create_for_profile(
        self,
        db: Session,
        *,
        obj_in: CertificationCreate,
        profile_id: UUID,
    ) -> Certification:

        db_obj = Certification(
            profile_id=profile_id,
            **obj_in.model_dump(),
        )

        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)

        return db_obj

    def get_by_profile_id(
        self,
        db: Session,
        *,
        profile_id: UUID,
    ) -> list[Certification]:

        statement = (
            select(Certification)
            .where(
                Certification.profile_id == profile_id
            )
            .order_by(
                Certification.issue_date.desc()
            )
        )

        return list(db.scalars(statement).all())


certification = CRUDCertification(Certification)
