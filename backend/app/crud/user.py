from sqlalchemy import select
from sqlalchemy.orm import Session

from app.core.security import hash_password
from app.crud.base import CRUDBase
from app.models.user import User
from app.schemas.user import UserCreate, UserUpdate


class CRUDUser(
    CRUDBase[User, UserCreate, UserUpdate]
):

    def get_by_email(
        self,
        db: Session,
        email: str,
    ) -> User | None:
        result = db.execute(
            select(User).where(User.email == email)
        )

        return result.scalar_one_or_none()

    def create(
        self,
        db: Session,
        obj_in: UserCreate,
    ) -> User:
        password_hash = hash_password(
            obj_in.password
        )

        db_obj = User(
            email=obj_in.email,
            password_hash=password_hash,
        )

        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)

        return db_obj


user = CRUDUser(User)
