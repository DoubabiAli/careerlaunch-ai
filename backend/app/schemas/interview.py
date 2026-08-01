from datetime import datetime
from uuid import UUID

from pydantic import BaseModel, ConfigDict

from app.models.enums import InterviewStatus


# ==========================================================
# Interview Session
# ==========================================================

class InterviewSessionBase(BaseModel):
    job_offer_id: UUID
    status: InterviewStatus = InterviewStatus.NOT_STARTED
    overall_score: float | None = None
    feedback: str | None = None


class InterviewSessionCreate(InterviewSessionBase):
    pass


class InterviewSessionUpdate(BaseModel):
    status: InterviewStatus | None = None
    overall_score: float | None = None
    feedback: str | None = None


class InterviewSessionRead(InterviewSessionBase):
    id: UUID
    profile_id: UUID
    created_at: datetime
    updated_at: datetime

    model_config = ConfigDict(from_attributes=True)


# ==========================================================
# Interview Question
# ==========================================================

class InterviewQuestionBase(BaseModel):
    question: str
    order_index: int


class InterviewQuestionCreate(InterviewQuestionBase):
    pass


class InterviewQuestionUpdate(BaseModel):
    question: str | None = None
    order_index: int | None = None


class InterviewQuestionRead(InterviewQuestionBase):
    id: UUID
    session_id: UUID

    model_config = ConfigDict(from_attributes=True)


# ==========================================================
# Interview Answer
# ==========================================================

class InterviewAnswerBase(BaseModel):
    question_id: UUID
    answer: str
    score: float | None = None
    feedback: str | None = None


class InterviewAnswerCreate(InterviewAnswerBase):
    pass


class InterviewAnswerUpdate(BaseModel):
    answer: str | None = None
    score: float | None = None
    feedback: str | None = None


class InterviewAnswerRead(InterviewAnswerBase):
    id: UUID

    model_config = ConfigDict(from_attributes=True)


# ==========================================================
# Interview Report
# ==========================================================

class InterviewReportBase(BaseModel):
    strengths: str | None = None
    weaknesses: str | None = None
    recommendations: str | None = None
    final_score: float | None = None


class InterviewReportCreate(InterviewReportBase):
    pass


class InterviewReportUpdate(BaseModel):
    strengths: str | None = None
    weaknesses: str | None = None
    recommendations: str | None = None
    final_score: float | None = None


class InterviewReportRead(InterviewReportBase):
    id: UUID
    session_id: UUID
    created_at: datetime

    model_config = ConfigDict(from_attributes=True)
