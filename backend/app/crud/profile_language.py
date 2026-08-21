from uuid import UUID

from sqlalchemy import select
from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.profile_language import ProfileLanguage
from app.schemas.profile_language import (
    ProfileLanguageCreate,
    ProfileLanguageUpdate,
)


class CRUDProfileLanguage(
    CRUDBase[
        ProfileLanguage,
        ProfileLanguageCreate,
        ProfileLanguageUpdate,
    ]
):

    def get_by_profile_and_language(
        self,
        db: Session,
        profile_id: UUID,
        language_id: UUID,
    ) -> ProfileLanguage | None:

        result = db.execute(
            select(ProfileLanguage).where(
                ProfileLanguage.profile_id == profile_id,
                ProfileLanguage.language_id == language_id,
            )
        )

        return result.scalar_one_or_none()

    def get_by_profile_id(
        self,
        db: Session,
        profile_id: UUID,
    ) -> list[ProfileLanguage]:

        result = db.execute(
            select(ProfileLanguage).where(
                ProfileLanguage.profile_id == profile_id
            )
        )

        return list(result.scalars().all())

    def get_by_language_id(
        self,
        db: Session,
        language_id: UUID,
    ) -> list[ProfileLanguage]:

        result = db.execute(
            select(ProfileLanguage).where(
                ProfileLanguage.language_id == language_id
            )
        )

        return list(result.scalars().all())

    def create_for_profile(
        self,
        db: Session,
        obj_in: ProfileLanguageCreate,
        profile_id: UUID,
    ) -> ProfileLanguage:

        db_obj = self.model(
            **obj_in.model_dump(),
            profile_id=profile_id,
        )

        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)

        return db_obj


profile_language = CRUDProfileLanguage(ProfileLanguage)
