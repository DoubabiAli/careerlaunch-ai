from fastapi import APIRouter

router = APIRouter()


@router.get("/")
def root():
    return {
        "message": "Welcome to CareerLaunch AI 🚀",
        "version": "1.0.0",
    }


@router.get("/health")
def health():
    return {
        "status": "healthy",
        "database": "connected",
    }
