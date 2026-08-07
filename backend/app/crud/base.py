from typing import Generic, Type, TypeVar

from pydantic import BaseModel
from sqlalchemy import select
from sqlalchemy.orm import Session

from app.models.base import Base


ModelType = TypeVar("ModelType", bound=Base)
CreateSchemaType = TypeVar("CreateSchemaType", bound=BaseModel)
UpdateSchemaType = TypeVar("UpdateSchemaType", bound=BaseModel)


class CRUDBase(
    Generic[ModelType, CreateSchemaType, UpdateSchemaType]
):
    def __init__(self, model: Type[ModelType]):
        self.model = model

    def get(
        self,
        db: Session,
        id,
    ) -> ModelType | None:
        return db.get(self.model, id)

    def get_all(
        self,
        db: Session,
    ) -> list[ModelType]:
        result = db.execute(
            select(self.model)
        )

        return list(result.scalars().all())

    def create(
        self,
        db: Session,
        obj_in: CreateSchemaType,
    ) -> ModelType:
        db_obj = self.model(
            **obj_in.model_dump()
        )

        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)

        return db_obj

    def update(
        self,
        db: Session,
        db_obj: ModelType,
        obj_in: UpdateSchemaType,
    ) -> ModelType:
        update_data = obj_in.model_dump(
            exclude_unset=True
        )

        for field, value in update_data.items():
            setattr(db_obj, field, value)

        db.commit()
        db.refresh(db_obj)

        return db_obj

    def delete(
        self,
        db: Session,
        db_obj: ModelType,
    ) -> ModelType:
        db.delete(db_obj)
        db.commit()

        return db_obj
