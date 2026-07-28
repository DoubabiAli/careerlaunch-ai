-- ============================================================
-- CareerLaunch AI
-- Database Foreign Keys
-- ============================================================

/* ============================================================
   USERS
============================================================ */

ALTER TABLE profiles
ADD CONSTRAINT fk_profiles_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

ALTER TABLE user_settings
ADD CONSTRAINT fk_user_settings_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

ALTER TABLE job_preferences
ADD CONSTRAINT fk_job_preferences_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

ALTER TABLE job_alerts
ADD CONSTRAINT fk_job_alerts_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

ALTER TABLE notifications
ADD CONSTRAINT fk_notifications_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

ALTER TABLE activity_logs
ADD CONSTRAINT fk_activity_logs_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;

/* ============================================================
   PROFILE
============================================================ */

ALTER TABLE cv
ADD CONSTRAINT fk_cv_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE education
ADD CONSTRAINT fk_education_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE experience
ADD CONSTRAINT fk_experience_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE projects
ADD CONSTRAINT fk_projects_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE certifications
ADD CONSTRAINT fk_certifications_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE profile_skills
ADD CONSTRAINT fk_profile_skills_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE profile_languages
ADD CONSTRAINT fk_profile_languages_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE documents
ADD CONSTRAINT fk_documents_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

/* ============================================================
   SKILL & LANGUAGE
============================================================ */

ALTER TABLE profile_skills
ADD CONSTRAINT fk_profile_skills_skill
FOREIGN KEY (skill_id)
REFERENCES skill(id)
ON DELETE CASCADE;

ALTER TABLE profile_languages
ADD CONSTRAINT fk_profile_languages_language
FOREIGN KEY (language_id)
REFERENCES language(id)
ON DELETE CASCADE;

/* ============================================================
   DOCUMENTS
============================================================ */

ALTER TABLE documents
ADD CONSTRAINT fk_documents_document_type
FOREIGN KEY (document_type_id)
REFERENCES document_type(id)
ON DELETE RESTRICT;

/* ============================================================
   JOBS
============================================================ */

ALTER TABLE job_offers
ADD CONSTRAINT fk_job_offers_source
FOREIGN KEY (job_source_id)
REFERENCES job_source(id)
ON DELETE RESTRICT;

ALTER TABLE job_offers
ADD CONSTRAINT fk_job_offers_company
FOREIGN KEY (company_id)
REFERENCES company(id)
ON DELETE RESTRICT;

/* ============================================================
   APPLICATIONS
============================================================ */

ALTER TABLE applications
ADD CONSTRAINT fk_applications_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE applications
ADD CONSTRAINT fk_applications_job_offer
FOREIGN KEY (job_offer_id)
REFERENCES job_offers(id)
ON DELETE CASCADE;

ALTER TABLE applications
ADD CONSTRAINT fk_applications_cv
FOREIGN KEY (cv_id)
REFERENCES cv(id)
ON DELETE SET NULL;

/* ============================================================
   FAVORITES
============================================================ */

ALTER TABLE favorites
ADD CONSTRAINT fk_favorites_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE favorites
ADD CONSTRAINT fk_favorites_job_offer
FOREIGN KEY (job_offer_id)
REFERENCES job_offers(id)
ON DELETE CASCADE;

/* ============================================================
   JOB MATCHES
============================================================ */

ALTER TABLE job_matches
ADD CONSTRAINT fk_job_matches_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE job_matches
ADD CONSTRAINT fk_job_matches_job_offer
FOREIGN KEY (job_offer_id)
REFERENCES job_offers(id)
ON DELETE CASCADE;

/* ============================================================
   INTERVIEWS
============================================================ */

ALTER TABLE interview_sessions
ADD CONSTRAINT fk_interview_sessions_profile
FOREIGN KEY (profile_id)
REFERENCES profiles(id)
ON DELETE CASCADE;

ALTER TABLE interview_sessions
ADD CONSTRAINT fk_interview_sessions_job_offer
FOREIGN KEY (job_offer_id)
REFERENCES job_offers(id)
ON DELETE SET NULL;

ALTER TABLE interview_questions
ADD CONSTRAINT fk_interview_questions_session
FOREIGN KEY (interview_session_id)
REFERENCES interview_sessions(id)
ON DELETE CASCADE;

ALTER TABLE interview_answers
ADD CONSTRAINT fk_interview_answers_question
FOREIGN KEY (interview_question_id)
REFERENCES interview_questions(id)
ON DELETE CASCADE;

ALTER TABLE interview_reports
ADD CONSTRAINT fk_interview_reports_session
FOREIGN KEY (interview_session_id)
REFERENCES interview_sessions(id)
ON DELETE CASCADE;
