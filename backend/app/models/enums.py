from enum import Enum


class ApplicationStatus(str, Enum):
    PENDING = "PENDING"
    REVIEWING = "REVIEWING"
    INTERVIEW = "INTERVIEW"
    ACCEPTED = "ACCEPTED"
    REJECTED = "REJECTED"
    WITHDRAWN = "WITHDRAWN"


class ContractType(str, Enum):
    CDI = "CDI"
    CDD = "CDD"
    INTERNSHIP = "INTERNSHIP"
    APPRENTICESHIP = "APPRENTICESHIP"
    FREELANCE = "FREELANCE"
    TEMPORARY = "TEMPORARY"


class ExperienceLevel(str, Enum):
    INTERN = "INTERN"
    JUNIOR = "JUNIOR"
    MID = "MID"
    SENIOR = "SENIOR"
    LEAD = "LEAD"


class EducationLevel(str, Enum):
    HIGH_SCHOOL = "HIGH_SCHOOL"
    BACHELOR = "BACHELOR"
    ENGINEER = "ENGINEER"
    MASTER = "MASTER"
    PHD = "PHD"


class InterviewStatus(str, Enum):
    NOT_STARTED = "NOT_STARTED"
    IN_PROGRESS = "IN_PROGRESS"
    COMPLETED = "COMPLETED"
    CANCELLED = "CANCELLED"


class NotificationType(str, Enum):
    NEW_JOB = "NEW_JOB"
    APPLICATION_UPDATE = "APPLICATION_UPDATE"
    INTERVIEW_INVITATION = "INTERVIEW_INVITATION"
    CV_GENERATED = "CV_GENERATED"
    SYSTEM = "SYSTEM"


class CVGenerationStatus(str, Enum):
    PENDING = "PENDING"
    GENERATING = "GENERATING"
    GENERATED = "GENERATED"
    FAILED = "FAILED"


class SkillLevel(str, Enum):
    BEGINNER = "BEGINNER"
    INTERMEDIATE = "INTERMEDIATE"
    ADVANCED = "ADVANCED"
    EXPERT = "EXPERT"


class LanguageLevel(str, Enum):
    A1 = "A1"
    A2 = "A2"
    B1 = "B1"
    B2 = "B2"
    C1 = "C1"
    C2 = "C2"
    NATIVE = "NATIVE"


class RemoteType(str, Enum):
    ONSITE = "ONSITE"
    HYBRID = "HYBRID"
    REMOTE = "REMOTE"


class JobOfferStatus(str, Enum):
    OPEN = "OPEN"
    CLOSED = "CLOSED"
    EXPIRED = "EXPIRED"
