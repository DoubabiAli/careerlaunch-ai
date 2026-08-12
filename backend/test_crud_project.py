import uuid
from datetime import date

from sqlalchemy import select

from app.core.database import SessionLocal
from app.crud import project
from app.models.project import Project
from app.models.profile import Profile
from app.models.user import User
from app.schemas.project import ProjectCreate, ProjectUpdate


def main():
    db = SessionLocal()

    test_email = f"test_project_{uuid.uuid4().hex[:8]}@example.com"

    try:
        # ============================================================
        # 1. CREATE USER
        # ============================================================

        db_user = User(
            email=test_email,
            password_hash="$2b$12$test_password_hash",
        )

        db.add(db_user)
        db.commit()
        db.refresh(db_user)

        print("✅ User created")
        print(f"   ID: {db_user.id}")

        # ============================================================
        # 2. CREATE PROFILE
        # ============================================================

        db_profile = Profile(
            user_id=db_user.id,
            first_name="Ali",
            last_name="Doubabi",
            city="Belfort",
            country="France",
        )

        db.add(db_profile)
        db.commit()
        db.refresh(db_profile)

        print("✅ Profile created")
        print(f"   ID: {db_profile.id}")

        # ============================================================
        # 3. CREATE PROJECT
        # ============================================================

        project_in = ProjectCreate(
            title="CareerLaunch-AI",
            description="AI-powered platform for finding job and apprenticeship opportunities.",
            technologies="Python, FastAPI, React, TypeScript, PostgreSQL, Docker",
            github_url="https://github.com/DoubabiAli/Careerlaunch-AI",
            demo_url="https://careerlaunch-ai.example.com",
            start_date=date(2026, 7, 1),
            end_date=None,
            is_current=True,
        )

        db_project = project.create(
            db=db,
            obj_in=project_in,
            profile_id=db_profile.id,
        )

        print("✅ Project created")
        print(f"   ID: {db_project.id}")
        print(f"   Title: {db_project.title}")

        # ============================================================
        # 4. GET PROJECT
        # ============================================================

        fetched_project = project.get(
            db=db,
            project_id=db_project.id,
        )

        assert fetched_project is not None
        assert fetched_project.id == db_project.id
        assert fetched_project.title == "CareerLaunch-AI"

        print("✅ get() works")

        # ============================================================
        # 5. GET PROJECTS BY PROFILE
        # ============================================================

        profile_projects = project.get_by_profile_id(
            db=db,
            profile_id=db_profile.id,
        )

        assert len(profile_projects) == 1
        assert profile_projects[0].id == db_project.id
        assert profile_projects[0].profile_id == db_profile.id

        print("✅ get_by_profile_id() works")

        # ============================================================
        # 6. UPDATE PROJECT
        # ============================================================

        project_update = ProjectUpdate(
            title="CareerLaunch-AI Platform",
            description="Updated project description.",
            technologies="FastAPI, React, TypeScript, PostgreSQL, Docker",
        )

        updated_project = project.update(
            db=db,
            db_project=db_project,
            obj_in=project_update,
        )

        assert updated_project.title == "CareerLaunch-AI Platform"
        assert updated_project.description == "Updated project description."
        assert updated_project.technologies == (
            "FastAPI, React, TypeScript, PostgreSQL, Docker"
        )

        print("✅ update() works")

        # ============================================================
        # 7. DELETE PROJECT
        # ============================================================

        project.delete(
            db=db,
            db_project=updated_project,
        )

        deleted_project = project.get(
            db=db,
            project_id=updated_project.id,
        )

        assert deleted_project is None

        print("✅ delete() works")

        # ============================================================
        # 8. DELETE PROFILE
        # ============================================================

        db.delete(db_profile)
        db.commit()

        print("✅ Profile deleted")

        # ============================================================
        # 9. DELETE USER
        # ============================================================

        db.delete(db_user)
        db.commit()

        print("✅ User deleted")

        print("\n🎉 All Project CRUD tests passed!")

    except Exception:
        db.rollback()
        raise

    finally:
        db.close()


if __name__ == "__main__":
    main()
