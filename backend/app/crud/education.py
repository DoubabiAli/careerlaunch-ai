from uuid import UUID

from sqlalchemy import select
from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.education import Education
from app.schemas.education import EducationCreate, EducationUpdate


class CRUDEducation(
    CRUDBase[Education, EducationCreate, EducationUpdate]
):

    def get_by_profile_id(
        self,
        db: Session,
        profile_id: UUID,
    ) -> list[Education]:
        result = db.execute(
            select(Education).where(
                Education.profile_id == profile_id
            )
        )

        return list(result.scalars().all())

    def create(
        self,
        db: Session,
        obj_in: EducationCreate,
        profile_id: UUID,
    ) -> Education:
        data = obj_in.model_dump()

        db_obj = Education(
            profile_id=profile_id,
            **data,
        )

        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)

        return db_obj


education = CRUDEducation(Education)
