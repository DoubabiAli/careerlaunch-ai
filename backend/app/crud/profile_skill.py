from uuid import UUID

from sqlalchemy import select
from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.profile_skill import ProfileSkill
from app.schemas.profile_skill import (
    ProfileSkillCreate,
    ProfileSkillUpdate,
)


class CRUDProfileSkill(
    CRUDBase[
        ProfileSkill,
        ProfileSkillCreate,
        ProfileSkillUpdate,
    ]
):

    def create_for_profile(
        self,
        db: Session,
        obj_in: ProfileSkillCreate,
        profile_id: UUID,
    ) -> ProfileSkill:

        obj_data = obj_in.model_dump(mode="json")

        db_obj = self.model(
            **obj_data,
            profile_id=profile_id,
        )

        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)

        return db_obj

    def get_by_profile_and_skill(
        self,
        db: Session,
        profile_id: UUID,
        skill_id: UUID,
    ) -> ProfileSkill | None:

        result = db.execute(
            select(ProfileSkill).where(
                ProfileSkill.profile_id == profile_id,
                ProfileSkill.skill_id == skill_id,
            )
        )

        return result.scalar_one_or_none()

    def get_all_for_profile(
        self,
        db: Session,
        profile_id: UUID,
    ) -> list[ProfileSkill]:

        result = db.execute(
            select(ProfileSkill)
            .where(ProfileSkill.profile_id == profile_id)
            .order_by(ProfileSkill.created_at)
        )

        return list(result.scalars().all())


profile_skill = CRUDProfileSkill(ProfileSkill)
