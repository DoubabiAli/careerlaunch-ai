from uuid import UUID

from sqlalchemy import select
from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.profile import Profile
from app.schemas.profile import ProfileCreate, ProfileUpdate


class CRUDProfile(
    CRUDBase[Profile, ProfileCreate, ProfileUpdate]
):

    def create(
        self,
        db: Session,
        obj_in: ProfileCreate,
        user_id: UUID,
    ) -> Profile:

        obj_data = obj_in.model_dump(
            mode="json"
        )

        db_obj = self.model(
            **obj_data,
            user_id=user_id,
        )

        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)

        return db_obj

    def get_by_user_id(
        self,
        db: Session,
        user_id: UUID,
    ) -> Profile | None:

        result = db.execute(
            select(Profile).where(
                Profile.user_id == user_id
            )
        )

        return result.scalar_one_or_none()


profile = CRUDProfile(Profile)
