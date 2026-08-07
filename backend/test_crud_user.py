from uuid import uuid4

from app.core.security import verify_password
from app.crud.user import user
from app.core.database import SessionLocal
from app.schemas.user import UserCreate


def main() -> None:
    db = SessionLocal()

    try:
        email = f"test_{uuid4().hex[:8]}@example.com"
        password = "TestPassword123!"

        user_in = UserCreate(
            email=email,
            password=password,
        )

        # ======================================================
        # CREATE
        # ======================================================

        db_user = user.create(
            db=db,
            obj_in=user_in,
        )

        print("✅ User created")
        print(f"   ID: {db_user.id}")
        print(f"   Email: {db_user.email}")

        # ======================================================
        # PASSWORD HASH
        # ======================================================

        assert db_user.password_hash != password

        print("✅ Password is hashed")

        # ======================================================
        # PASSWORD VERIFICATION
        # ======================================================

        assert verify_password(
            password,
            db_user.password_hash,
        )

        print("✅ Password verification works")

        # ======================================================
        # GET BY ID
        # ======================================================

        found_user = user.get(
            db=db,
            id=db_user.id,
        )

        assert found_user is not None
        assert found_user.id == db_user.id

        print("✅ get() works")

        # ======================================================
        # GET BY EMAIL
        # ======================================================

        found_by_email = user.get_by_email(
            db=db,
            email=email,
        )

        assert found_by_email is not None
        assert found_by_email.email == email

        print("✅ get_by_email() works")

        # ======================================================
        # DELETE
        # ======================================================

        user.delete(
            db=db,
            db_obj=db_user,
        )

        deleted_user = user.get(
            db=db,
            id=db_user.id,
        )

        assert deleted_user is None

        print("✅ delete() works")

        print("\n🎉 All User CRUD tests passed!")

    finally:
        db.close()


if __name__ == "__main__":
    main()
