-- ============================================================
-- CareerLaunch AI
-- ENUM Types
-- ============================================================

CREATE TYPE application_status AS ENUM (
    'PENDING',
    'INTERVIEW',
    'ACCEPTED',
    'REJECTED'
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
