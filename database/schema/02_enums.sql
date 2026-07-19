-- ============================================================
-- CareerLaunch AI
-- ENUM Types
-- ============================================================

CREATE TYPE application_status AS ENUM (
    'PENDING',
    'REVIEWING',
    'INTERVIEW',
    'ACCEPTED',
    'REJECTED',
    'WITHDRAWN'
);

CREATE TYPE contract_type AS ENUM (
    'CDI',
    'CDD',
    'INTERNSHIP',
    'APPRENTICESHIP',
    'FREELANCE',
    'TEMPORARY'
);

CREATE TYPE experience_level AS ENUM (
    'INTERN',
    'JUNIOR',
    'MID',
    'SENIOR',
    'LEAD'
);

CREATE TYPE education_level AS ENUM (
    'HIGH_SCHOOL',
    'BACHELOR',
    'ENGINEER',
    'MASTER',
    'PHD'
);

CREATE TYPE interview_status AS ENUM (
    'NOT_STARTED',
    'IN_PROGRESS',
    'COMPLETED',
    'CANCELLED'
);

CREATE TYPE notification_type AS ENUM (
    'NEW_JOB',
    'APPLICATION_UPDATE',
    'INTERVIEW_INVITATION',
    'CV_GENERATED',
    'SYSTEM'
);

CREATE TYPE cv_generation_status AS ENUM (
    'PENDING',
    'GENERATING',
    'GENERATED',
    'FAILED'
);

CREATE TYPE skill_level AS ENUM (
    'BEGINNER',
    'INTERMEDIATE',
    'ADVANCED',
    'EXPERT'
);

CREATE TYPE language_level AS ENUM (
    'A1',
    'A2',
    'B1',
    'B2',
    'C1',
    'C2',
    'NATIVE'
);

CREATE TYPE remote_type AS ENUM (
    'ONSITE',
    'HYBRID',
    'REMOTE'
);

CREATE TYPE job_offer_status AS ENUM (
    'OPEN',
    'CLOSED',
    'EXPIRED'
);
