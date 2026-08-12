from uuid import UUID

from sqlalchemy import select
from sqlalchemy.orm import Session

from app.models.project import Project
from app.schemas.project import ProjectCreate, ProjectUpdate


def create(
    db: Session,
    obj_in: ProjectCreate,
    profile_id: UUID,
) -> Project:
    db_project = Project(
        profile_id=profile_id,
        **obj_in.model_dump(),
    )

    db.add(db_project)
    db.commit()
    db.refresh(db_project)

    return db_project


def get(
    db: Session,
    project_id: UUID,
) -> Project | None:
    return db.scalar(
        select(Project).where(Project.id == project_id)
    )


def get_by_profile_id(
    db: Session,
    profile_id: UUID,
) -> list[Project]:
    return list(
        db.scalars(
            select(Project)
            .where(Project.profile_id == profile_id)
            .order_by(Project.start_date.desc())
        ).all()
    )


def update(
    db: Session,
    db_project: Project,
    obj_in: ProjectUpdate,
) -> Project:
    update_data = obj_in.model_dump(exclude_unset=True)

    for field, value in update_data.items():
        setattr(db_project, field, value)

    db.commit()
    db.refresh(db_project)

    return db_project


def delete(
    db: Session,
    db_project: Project,
) -> None:
    db.delete(db_project)
    db.commit()
