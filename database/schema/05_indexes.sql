-- ============================================================
-- CareerLaunch AI
-- Database Indexes
-- ============================================================

/* ============================================================
   USERS & PROFILE
============================================================ */

CREATE INDEX idx_users_email
ON users(email);

CREATE INDEX idx_profiles_user
ON profiles(user_id);

CREATE INDEX idx_cv_profile
ON cv(profile_id);

/* ============================================================
   PROFILE CONTENT
============================================================ */

CREATE INDEX idx_education_profile
ON education(profile_id);

CREATE INDEX idx_experience_profile
ON experience(profile_id);

CREATE INDEX idx_projects_profile
ON projects(profile_id);

CREATE INDEX idx_certifications_profile
ON certifications(profile_id);

CREATE INDEX idx_profile_skills_profile
ON profile_skills(profile_id);

CREATE INDEX idx_profile_skills_skill
ON profile_skills(skill_id);

CREATE INDEX idx_profile_languages_profile
ON profile_languages(profile_id);

CREATE INDEX idx_profile_languages_language
ON profile_languages(language_id);

/* ============================================================
   JOBS
============================================================ */

CREATE INDEX idx_job_offers_company
ON job_offers(company_id);

CREATE INDEX idx_job_offers_source
ON job_offers(job_source_id);

CREATE INDEX idx_job_offers_location
ON job_offers(location);

CREATE INDEX idx_job_offers_contract
ON job_offers(contract_type);

CREATE INDEX idx_job_offers_status
ON job_offers(status);

CREATE INDEX idx_job_offers_remote
ON job_offers(remote_type);

CREATE INDEX idx_job_offers_published
ON job_offers(published_at);

-- Full-text search (requires pg_trgm)
CREATE INDEX idx_job_offers_title_trgm
ON job_offers USING gin (title gin_trgm_ops);

CREATE INDEX idx_job_offers_description_trgm
ON job_offers USING gin (description gin_trgm_ops);

CREATE INDEX idx_company_name_trgm
ON company USING gin (name gin_trgm_ops);

CREATE INDEX idx_skill_name_trgm
ON skill USING gin (name gin_trgm_ops);

/* ============================================================
   APPLICATIONS
============================================================ */

CREATE INDEX idx_applications_profile
ON applications(profile_id);

CREATE INDEX idx_applications_job_offer
ON applications(job_offer_id);

CREATE INDEX idx_applications_status
ON applications(status);

/* ============================================================
   FAVORITES
============================================================ */

CREATE INDEX idx_favorites_profile
ON favorites(profile_id);

CREATE INDEX idx_favorites_job_offer
ON favorites(job_offer_id);

/* ============================================================
   JOB MATCHES
============================================================ */

CREATE INDEX idx_job_matches_profile
ON job_matches(profile_id);

CREATE INDEX idx_job_matches_job_offer
ON job_matches(job_offer_id);

CREATE INDEX idx_job_matches_score
ON job_matches(compatibility_score DESC);

/* ============================================================
   DOCUMENTS
============================================================ */

CREATE INDEX idx_documents_profile
ON documents(profile_id);

CREATE INDEX idx_documents_type
ON documents(document_type_id);

/* ============================================================
   INTERVIEW
============================================================ */

CREATE INDEX idx_interview_sessions_profile
ON interview_sessions(profile_id);

CREATE INDEX idx_interview_sessions_job_offer
ON interview_sessions(job_offer_id);

CREATE INDEX idx_interview_questions_session
ON interview_questions(interview_session_id);

CREATE INDEX idx_interview_answers_question
ON interview_answers(interview_question_id);

CREATE INDEX idx_interview_reports_session
ON interview_reports(interview_session_id);

/* ============================================================
   NOTIFICATIONS
============================================================ */

CREATE INDEX idx_notifications_user
ON notifications(user_id);

CREATE INDEX idx_notifications_read
ON notifications(is_read);

/* ============================================================
   ACTIVITY LOGS
============================================================ */

CREATE INDEX idx_activity_logs_user
ON activity_logs(user_id);

CREATE INDEX idx_activity_logs_created
ON activity_logs(created_at);

/* ============================================================
   JOB ALERTS
============================================================ */

CREATE INDEX idx_job_alerts_user
ON job_alerts(user_id);

CREATE INDEX idx_job_alerts_active
ON job_alerts(is_active);
