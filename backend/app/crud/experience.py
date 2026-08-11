from uuid import UUID, uuid4

from sqlalchemy import select
from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.experience import Experience
from app.schemas.experience import ExperienceCreate, ExperienceUpdate


class CRUDExperience(
    CRUDBase[Experience, ExperienceCreate, ExperienceUpdate]
):

    def get_by_profile_id(
        self,
        db: Session,
        profile_id: UUID,
    ) -> list[Experience]:
        result = db.execute(
            select(Experience).where(
                Experience.profile_id == profile_id
            )
        )

        return list(result.scalars().all())

    def create(
        self,
        db: Session,
        obj_in: ExperienceCreate,
        profile_id: UUID,
    ) -> Experience:
        data = obj_in.model_dump()

        db_obj = Experience(
            id=uuid4(),
            profile_id=profile_id,
            company_name=data["company_name"],
            job_title=data["job_title"],
            contract_type=data["contract_type"],
            start_date=data["start_date"],
            end_date=data["end_date"],
            is_current=data["is_current"],
            description=data["description"],
        )

        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)

        return db_obj


experience = CRUDExperience(Experience)
