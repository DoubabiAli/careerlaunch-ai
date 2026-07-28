-- ============================================================
-- CareerLaunch AI
-- Database Tables
-- ============================================================

-- ------------------------------------------------------------
-- Reference Tables
-- ------------------------------------------------------------

CREATE TABLE language (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE skill (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(100) NOT NULL
);

CREATE TABLE document_type (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE company (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(150) NOT NULL UNIQUE,
    description TEXT,
    website TEXT,
    logo_url TEXT,
    industry VARCHAR(100),
    location VARCHAR(150),
    company_size INTEGER,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE job_source (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE,
    website TEXT,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ------------------------------------------------------------
-- User & Profile
-- ------------------------------------------------------------

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    email_verified BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(30),
    city VARCHAR(100),
    country VARCHAR(100),
    linkedin_url TEXT,
    github_url TEXT,
    headline VARCHAR(255),
    summary TEXT,
    profile_picture_url TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE user_settings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL UNIQUE,
    preferred_language VARCHAR(20) NOT NULL DEFAULT 'en',
    dark_mode BOOLEAN NOT NULL DEFAULT FALSE,
    email_notifications BOOLEAN NOT NULL DEFAULT TRUE,
    push_notifications BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE job_preferences (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL UNIQUE,
    desired_contract_type contract_type,
    preferred_city VARCHAR(100),
    expected_salary NUMERIC(10,2),
    remote_type remote_type,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE job_alerts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    title VARCHAR(100) NOT NULL,
    keyword VARCHAR(100),
    city VARCHAR(100),
    contract_type contract_type,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    type notification_type NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE activity_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    action VARCHAR(100) NOT NULL,
    description TEXT,
    ip_address INET,
    user_agent TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ------------------------------------------------------------
-- Profile Content
-- ------------------------------------------------------------

CREATE TABLE cv (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    title VARCHAR(150) NOT NULL,
    file_url TEXT,
    generation_status cv_generation_status NOT NULL DEFAULT 'PENDING',
    score NUMERIC(5,2),
    ats_score NUMERIC(5,2),
    analysis_json JSONB,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT chk_cv_score
        CHECK (score IS NULL OR (score >= 0 AND score <= 100)),

    CONSTRAINT chk_cv_ats_score
        CHECK (ats_score IS NULL OR (ats_score >= 0 AND ats_score <= 100))
);

CREATE TABLE education (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    institution VARCHAR(255) NOT NULL,
    degree VARCHAR(150) NOT NULL,
    field VARCHAR(150),
    education_level education_level NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    is_current BOOLEAN NOT NULL DEFAULT FALSE,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE experience (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    job_title VARCHAR(150) NOT NULL,
    contract_type contract_type,
    start_date DATE NOT NULL,
    end_date DATE,
    is_current BOOLEAN NOT NULL DEFAULT FALSE,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    technologies VARCHAR(255),
    github_url TEXT,
    demo_url TEXT,
    start_date DATE,
    end_date DATE,
    is_current BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE certifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    organization VARCHAR(255),
    issue_date DATE,
    expiration_date DATE,
    credential_url TEXT,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE profile_skills (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    skill_id UUID NOT NULL,
    level skill_level NOT NULL,
    years_of_experience NUMERIC(4,1),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_profile_skill
        UNIQUE (profile_id, skill_id)
);

CREATE TABLE profile_languages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    language_id UUID NOT NULL,
    level language_level NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_profile_language
        UNIQUE (profile_id, language_id)
);

CREATE TABLE documents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    document_type_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    file_url TEXT NOT NULL,
    file_size BIGINT,
    mime_type VARCHAR(100),
    uploaded_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ------------------------------------------------------------
-- Jobs
-- ------------------------------------------------------------

CREATE TABLE job_offers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company_id UUID NOT NULL,
    job_source_id UUID NOT NULL,
    external_id VARCHAR(255),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(150) NOT NULL,
    contract_type contract_type NOT NULL,
    experience_level experience_level,
    education_level education_level,
    salary_min NUMERIC(10,2),
    salary_max NUMERIC(10,2),
    remote_type remote_type,
    status job_offer_status NOT NULL DEFAULT 'OPEN',
    application_url TEXT,
    published_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ------------------------------------------------------------
-- Applications & Matching
-- ------------------------------------------------------------

CREATE TABLE applications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    job_offer_id UUID NOT NULL,
    cv_id UUID,
    status application_status NOT NULL DEFAULT 'PENDING',
    applied_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_profile_job_offer
        UNIQUE (profile_id, job_offer_id)
);

CREATE TABLE favorites (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    job_offer_id UUID NOT NULL,
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_favorite
        UNIQUE (profile_id, job_offer_id)
);

CREATE TABLE job_matches (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    job_offer_id UUID NOT NULL,
    compatibility_score NUMERIC(5,2) NOT NULL,
    skills_score NUMERIC(5,2),
    education_score NUMERIC(5,2),
    experience_score NUMERIC(5,2),
    domain_score NUMERIC(5,2),
    match_reason TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_job_match
        UNIQUE (profile_id, job_offer_id),

    CONSTRAINT chk_compatibility_score
        CHECK (compatibility_score >= 0 AND compatibility_score <= 100),

    CONSTRAINT chk_match_skills_score
        CHECK (skills_score IS NULL OR (skills_score >= 0 AND skills_score <= 100)),

    CONSTRAINT chk_match_education_score
        CHECK (education_score IS NULL OR (education_score >= 0 AND education_score <= 100)),

    CONSTRAINT chk_match_experience_score
        CHECK (experience_score IS NULL OR (experience_score >= 0 AND experience_score <= 100)),

    CONSTRAINT chk_match_domain_score
        CHECK (domain_score IS NULL OR (domain_score >= 0 AND domain_score <= 100))
);

-- ------------------------------------------------------------
-- Interview
-- ------------------------------------------------------------

CREATE TABLE interview_sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id UUID NOT NULL,
    job_offer_id UUID,
    title VARCHAR(255) NOT NULL,
    duration_seconds INTEGER,
    status interview_status NOT NULL DEFAULT 'NOT_STARTED',
    started_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE interview_questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    interview_session_id UUID NOT NULL,
    question_order INTEGER NOT NULL,
    question TEXT NOT NULL,
    category VARCHAR(100),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_session_question_order
        UNIQUE (interview_session_id, question_order)
);

CREATE TABLE interview_answers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    interview_question_id UUID NOT NULL,
    answer TEXT NOT NULL,
    ai_score NUMERIC(5,2),
    ai_feedback TEXT,
    response_time_seconds INTEGER,
    answered_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT chk_ai_score
        CHECK (
            ai_score IS NULL
            OR (ai_score >= 0 AND ai_score <= 100)
        ),

    CONSTRAINT uq_interview_answer
        UNIQUE (interview_question_id)
);

CREATE TABLE interview_reports (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    interview_session_id UUID NOT NULL UNIQUE,
    overall_score NUMERIC(5,2) NOT NULL,
    strengths TEXT,
    weaknesses TEXT,
    recommendations TEXT,
    summary TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT chk_overall_score
        CHECK (
            overall_score >= 0
            AND overall_score <= 100
        )
);
