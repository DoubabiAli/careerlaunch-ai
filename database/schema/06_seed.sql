-- ============================================================
-- CareerLaunch AI
-- Initial Seed Data — Master Reference Data
-- ============================================================

BEGIN;

-- ============================================================
-- 1. LANGUAGES
-- ============================================================

INSERT INTO language (name) VALUES
('Français'),
('Anglais'),
('Espagnol'),
('Allemand'),
('Italien'),
('Portugais'),
('Néerlandais'),
('Chinois (Mandarin)'),
('Japonais'),
('Coréen'),
('Russe'),
('Arabe'),
('Turc'),
('Hindi'),
('Polonais'),
('Roumain'),
('Grec'),
('Suédois'),
('Norvégien'),
('Danois'),
('Finnois'),
('Ukrainien'),
('Tchèque'),
('Hongrois'),
('Bulgare'),
('Croate'),
('Serbe'),
('Slovaque'),
('Hébreu'),
('Persan (Farsi)'),
('Vietnamien'),
('Thaï'),
('Indonésien'),
('Malais'),
('Tamoul'),
('Bengali'),
('Ourdou'),
('Swahili'),
('Afrikaans'),
('Islandais'),
('Lituanien'),
('Letton'),
('Estonien'),
('Slovène'),
('Macédonien'),
('Albanais'),
('Géorgien'),
('Arménien'),
('Tagalog'),
('Cantonais');


-- ============================================================
-- 2. DOCUMENT TYPES
-- ============================================================

INSERT INTO document_type (name, description) VALUES
('Curriculum Vitae', 'Document principal de présentation du parcours professionnel'),
('Lettre de motivation', 'Document argumentaire pour une candidature spécifique'),
('Diplôme', 'Attestation de formation ou de grade universitaire'),
('Relevé de notes', 'Document détaillant les résultats académiques'),
('Certificat', 'Attestation de compétence, de formation ou de réussite'),
('Passeport', 'Document d''identité international'),
('Carte nationale d''identité', 'Document d''identité officiel'),
('Titre de séjour', 'Document autorisant la résidence sur un territoire'),
('Permis de travail', 'Autorisation administrative d''exercer une activité professionnelle'),
('Permis de conduire', 'Document autorisant la conduite de véhicules'),
('Portfolio', 'Recueil de réalisations professionnelles ou artistiques'),
('Recommandation', 'Lettre de recommandation d''un employeur ou professeur'),
('Attestation de travail', 'Document certifiant l''emploi dans une entreprise'),
('Bulletin de salaire', 'Justificatif de rémunération mensuelle'),
('Contrat de travail', 'Document juridique liant employeur et salarié');


-- ============================================================
-- 3. JOB SOURCES
-- ============================================================

INSERT INTO job_source (name, website, description) VALUES
('France Travail', 'https://francetravail.io', 'API publique officielle de Pôle emploi. Plus de 500 000 offres actives par jour. Gratuite, temps réel. Source principale recommandée.'),
('La Bonne Alternance', 'https://api.apprentissage.beta.gouv.fr', 'API publique et gratuite pour l''alternance, l''apprentissage et la professionnalisation. Inclut les entreprises à fort potentiel (marché caché).'),
('Adzuna', 'https://developer.adzuna.com', 'API REST avec clé gratuite (quota limité). Couverture européenne (FR, DE, CH, UK, ES). Agrégateur multi-sources.'),
('LinkedIn Jobs', 'https://www.linkedin.com/jobs', 'Premier réseau professionnel mondial. Pas d''API publique de recherche pour les développeurs tiers. Référencement manuel ou partenariat.'),
('Indeed', 'https://www.indeed.fr', 'Leader mondial de l''agrégation d''offres. API fermée depuis 2021 pour les développeurs tiers. Scraping interdit par les CGU.'),
('Welcome to the Jungle', 'https://www.welcometothejungle.com', 'Plateforme française spécialisée dans les startups et scale-ups tech. Pas d''API publique de recherche.'),
('APEC', 'https://www.apec.fr', 'Association Pour l''Emploi des Cadres. Focus CDI et CDD pour profils Bac+5 et plus. Pas d''API publique candidate.'),
('HelloWork', 'https://www.hellowork.com', 'Ancienement RegionsJob. Réseau de sites d''emploi régionaux et sectoriels. Pas d''API publique de recherche.'),
('ChooseMyCompany', 'https://www.choosemycompany.com', 'Plateforme d''avis et de notation des entreprises avec offres d''emploi. Pas d''API publique.'),
('Monster', 'https://www.monster.fr', 'Ancien leader mondial, racheté par Randstad. Présence en France mais activité réduite. Pas d''API publique.'),
('JobTeaser', 'https://www.jobteaser.com', 'Plateforme dédiée aux étudiants et jeunes diplômés. Partenariats avec les universités. Pas d''API publique généraliste.'),
('Talent.io', 'https://www.talent.io', 'Plateforme de matching dédiée aux développeurs et profils tech. Modèle inverse : les recruteurs contactent les candidats.'),
('Les Jeudis', 'https://www.lesjeudis.com', 'Site d''emploi informatique historique en France. Focus tech et digital.'),
('Silicon Florist', 'https://www.siliconflorist.com', 'Communauté et offres d''emploi tech en France. Focus développeurs, data et product.'),
('WeLoveDevs', 'https://welovedevs.com', 'Plateforme française dédiée aux développeurs. Offres avec transparence salariale et culture d''entreprise.'),
('Remotive', 'https://remotive.io', 'Plateforme internationale spécialisée dans les offres 100 % remote. Focus tech et digital.'),
('Wellfound (AngelList)', 'https://wellfound.com', 'Plateforme de recrutement pour startups tech. Anciennement AngelList Talent. API disponible pour partenaires.'),
('Glassdoor', 'https://www.glassdoor.com', 'Avis sur les entreprises et offres d''emploi. Pas d''API publique de recherche d''offres.'),
('Stack Overflow Jobs', 'https://stackoverflow.com/jobs', 'Section emploi du leader des Q&A tech. API limitée, principalement pour partenaires.'),
('GitHub Jobs (archivé)', 'https://github.com', 'Ancien board d''emploi GitHub. Fermé en 2021 mais référencé pour l''historique des sources tech.');


-- ============================================================
-- 4. SKILLS
-- ============================================================

-- 4.1 Programming Languages
INSERT INTO skill (name, category) VALUES
('Python', 'Programming Language'),
('Java', 'Programming Language'),
('C', 'Programming Language'),
('C++', 'Programming Language'),
('C#', 'Programming Language'),
('JavaScript', 'Programming Language'),
('TypeScript', 'Programming Language'),
('PHP', 'Programming Language'),
('Go', 'Programming Language'),
('Rust', 'Programming Language'),
('Kotlin', 'Programming Language'),
('Swift', 'Programming Language'),
('Ruby', 'Programming Language'),
('Scala', 'Programming Language'),
('Perl', 'Programming Language'),
('R', 'Programming Language'),
('MATLAB', 'Programming Language'),
('Objective-C', 'Programming Language'),
('Dart', 'Programming Language'),
('Lua', 'Programming Language'),
('Shell / Bash', 'Programming Language'),
('PowerShell', 'Programming Language'),
('Groovy', 'Programming Language'),
('Elixir', 'Programming Language'),
('Haskell', 'Programming Language'),
('Cobol', 'Programming Language'),
('Fortran', 'Programming Language'),
('Assembly', 'Programming Language'),
('VBA', 'Programming Language'),
('ABAP', 'Programming Language');

-- 4.2 Frontend
INSERT INTO skill (name, category) VALUES
('HTML5', 'Frontend'),
('CSS3', 'Frontend'),
('React.js', 'Frontend'),
('Vue.js', 'Frontend'),
('Angular', 'Frontend'),
('Next.js', 'Frontend'),
('Nuxt.js', 'Frontend'),
('Svelte', 'Frontend'),
('Tailwind CSS', 'Frontend'),
('Bootstrap', 'Frontend'),
('Material UI', 'Frontend'),
('SASS / SCSS', 'Frontend'),
('Less', 'Frontend'),
('jQuery', 'Frontend'),
('Redux', 'Frontend'),
('Zustand', 'Frontend'),
('React Query / TanStack Query', 'Frontend'),
('Webpack', 'Frontend'),
('Vite', 'Frontend'),
('Gatsby', 'Frontend'),
('Astro', 'Frontend'),
('Storybook', 'Frontend'),
('Figma (dév intégration)', 'Frontend'),
('Three.js', 'Frontend'),
('D3.js', 'Frontend'),
('WebSockets', 'Frontend'),
('PWA', 'Frontend'),
('WebAssembly', 'Frontend');

-- 4.3 Backend
INSERT INTO skill (name, category) VALUES
('Node.js', 'Backend'),
('Express.js', 'Backend'),
('FastAPI', 'Backend'),
('Django', 'Backend'),
('Flask', 'Backend'),
('Spring Boot', 'Backend'),
('Laravel', 'Backend'),
('Symfony', 'Backend'),
('Ruby on Rails', 'Backend'),
('ASP.NET Core', 'Backend'),
('NestJS', 'Backend'),
('GraphQL', 'Backend'),
('REST API Design', 'Backend'),
('gRPC', 'Backend'),
('WebSocket API', 'Backend'),
('OAuth 2.0 / OpenID Connect', 'Backend'),
('JWT', 'Backend'),
('SOAP', 'Backend'),
('Microservices', 'Backend'),
('Event-Driven Architecture', 'Backend'),
('CQRS', 'Backend'),
('Serverless / AWS Lambda', 'Backend'),
('API Gateway', 'Backend'),
('RabbitMQ', 'Backend'),
('Apache Kafka', 'Backend'),
('NATS', 'Backend'),
('Webhooks', 'Backend');

-- 4.4 Databases
INSERT INTO skill (name, category) VALUES
('PostgreSQL', 'Database'),
('MySQL', 'Database'),
('MariaDB', 'Database'),
('MongoDB', 'Database'),
('Redis', 'Database'),
('SQLite', 'Database'),
('Oracle Database', 'Database'),
('Microsoft SQL Server', 'Database'),
('Elasticsearch', 'Database'),
('Cassandra', 'Database'),
('DynamoDB', 'Database'),
('Firebase Firestore', 'Database'),
('Neo4j', 'Database'),
('InfluxDB', 'Database'),
('CockroachDB', 'Database'),
('Supabase', 'Database'),
('Prisma ORM', 'Database'),
('SQLAlchemy', 'Database'),
('Hibernate', 'Database'),
('TypeORM', 'Database'),
('Sequelize', 'Database'),
('Mongoose', 'Database'),
('Database Design', 'Database'),
('Database Optimization', 'Database'),
('Data Modeling', 'Database'),
('ETL', 'Database'),
('Data Warehousing', 'Database');

-- 4.5 Cloud & Infrastructure
INSERT INTO skill (name, category) VALUES
('Amazon Web Services (AWS)', 'Cloud'),
('Microsoft Azure', 'Cloud'),
('Google Cloud Platform (GCP)', 'Cloud'),
('Oracle Cloud', 'Cloud'),
('IBM Cloud', 'Cloud'),
('DigitalOcean', 'Cloud'),
('Heroku', 'Cloud'),
('Vercel', 'Cloud'),
('Netlify', 'Cloud'),
('Cloudflare', 'Cloud'),
('OVHcloud', 'Cloud'),
('Scaleway', 'Cloud'),
('Hetzner', 'Cloud'),
('OpenStack', 'Cloud'),
('VMware', 'Cloud'),
('Proxmox', 'Cloud');

-- 4.6 DevOps & SRE
INSERT INTO skill (name, category) VALUES
('Docker', 'DevOps'),
('Kubernetes', 'DevOps'),
('Terraform', 'DevOps'),
('Ansible', 'DevOps'),
('Pulumi', 'DevOps'),
('Git', 'DevOps'),
('GitHub', 'DevOps'),
('GitLab', 'DevOps'),
('GitLab CI/CD', 'DevOps'),
('GitHub Actions', 'DevOps'),
('Jenkins', 'DevOps'),
('CircleCI', 'DevOps'),
('Travis CI', 'DevOps'),
('ArgoCD', 'DevOps'),
('Helm', 'DevOps'),
('Prometheus', 'DevOps'),
('Grafana', 'DevOps'),
('Datadog', 'DevOps'),
('New Relic', 'DevOps'),
('ELK Stack', 'DevOps'),
('Fluentd', 'DevOps'),
('Istio', 'DevOps'),
('Linkerd', 'DevOps'),
('Nginx', 'DevOps'),
('Apache HTTP Server', 'DevOps'),
('HAProxy', 'DevOps'),
('Traefik', 'DevOps'),
('Linux Administration', 'DevOps'),
('Windows Server', 'DevOps'),
('Bash Scripting', 'DevOps'),
('Python Scripting', 'DevOps'),
('Infrastructure as Code', 'DevOps'),
('Site Reliability Engineering (SRE)', 'DevOps'),
('Chaos Engineering', 'DevOps'),
('Load Balancing', 'DevOps'),
('CDN Management', 'DevOps'),
('VPN / WireGuard', 'DevOps');

-- 4.7 Data, AI & Machine Learning
INSERT INTO skill (name, category) VALUES
('Machine Learning', 'Data & AI'),
('Deep Learning', 'Data & AI'),
('Natural Language Processing (NLP)', 'Data & AI'),
('Computer Vision', 'Data & AI'),
('Reinforcement Learning', 'Data & AI'),
('TensorFlow', 'Data & AI'),
('PyTorch', 'Data & AI'),
('Keras', 'Data & AI'),
('Scikit-learn', 'Data & AI'),
('XGBoost', 'Data & AI'),
('LightGBM', 'Data & AI'),
('Hugging Face Transformers', 'Data & AI'),
('OpenAI API', 'Data & AI'),
('LangChain', 'Data & AI'),
('LlamaIndex', 'Data & AI'),
('Pandas', 'Data & AI'),
('NumPy', 'Data & AI'),
('Polars', 'Data & AI'),
('Dask', 'Data & AI'),
('Apache Spark', 'Data & AI'),
('PySpark', 'Data & AI'),
('Data Analysis', 'Data & AI'),
('Data Visualization', 'Data & AI'),
('Statistical Analysis', 'Data & AI'),
('A/B Testing', 'Data & AI'),
('Feature Engineering', 'Data & AI'),
('MLOps', 'Data & AI'),
('MLflow', 'Data & AI'),
('Kubeflow', 'Data & AI'),
('Weights & Biases', 'Data & AI'),
('Power BI', 'Data & AI'),
('Tableau', 'Data & AI'),
('Looker', 'Data & AI'),
('Apache Airflow', 'Data & AI'),
('dbt (Data Build Tool)', 'Data & AI'),
('Snowflake', 'Data & AI'),
('BigQuery', 'Data & AI'),
('Data Lake', 'Data & AI'),
('Data Governance', 'Data & AI');

-- 4.8 Mobile Development
INSERT INTO skill (name, category) VALUES
('React Native', 'Mobile'),
('Flutter', 'Mobile'),
('SwiftUI', 'Mobile'),
('UIKit', 'Mobile'),
('Android SDK', 'Mobile'),
('Jetpack Compose', 'Mobile'),
('Kotlin Multiplatform', 'Mobile'),
('Ionic', 'Mobile'),
('Capacitor', 'Mobile'),
('Cordova', 'Mobile'),
('Expo', 'Mobile'),
('Firebase Mobile', 'Mobile'),
('Push Notifications', 'Mobile'),
('Mobile App Security', 'Mobile'),
('App Store Optimization (ASO)', 'Mobile');

-- 4.9 Cybersecurity
INSERT INTO skill (name, category) VALUES
('Ethical Hacking', 'Cybersecurity'),
('Penetration Testing', 'Cybersecurity'),
('OWASP Top 10', 'Cybersecurity'),
('Secure Code Review', 'Cybersecurity'),
('Cryptography', 'Cybersecurity'),
('PKI / SSL-TLS', 'Cybersecurity'),
('SIEM (Splunk, QRadar)', 'Cybersecurity'),
('SOC Analysis', 'Cybersecurity'),
('Threat Intelligence', 'Cybersecurity'),
('Vulnerability Management', 'Cybersecurity'),
('Identity & Access Management (IAM)', 'Cybersecurity'),
('Zero Trust Architecture', 'Cybersecurity'),
('ISO 27001', 'Cybersecurity'),
('RGPD / GDPR Compliance', 'Cybersecurity'),
('NIST Cybersecurity Framework', 'Cybersecurity'),
('Firewall Configuration', 'Cybersecurity'),
('IDS / IPS', 'Cybersecurity'),
('Malware Analysis', 'Cybersecurity'),
('Digital Forensics', 'Cybersecurity'),
('Cloud Security (CCSP)', 'Cybersecurity');

-- 4.10 Design & UX/UI
INSERT INTO skill (name, category) VALUES
('Figma', 'Design'),
('Adobe XD', 'Design'),
('Sketch', 'Design'),
('Adobe Photoshop', 'Design'),
('Adobe Illustrator', 'Design'),
('Adobe After Effects', 'Design'),
('Blender', 'Design'),
('UI Design', 'Design'),
('UX Research', 'Design'),
('UX Writing', 'Design'),
('Design Systems', 'Design'),
('Atomic Design', 'Design'),
('Wireframing', 'Design'),
('Prototyping', 'Design'),
('User Testing', 'Design'),
('Accessibility (WCAG)', 'Design'),
('Motion Design', 'Design'),
('3D Modeling', 'Design'),
('Canva', 'Design');

-- 4.11 Testing & QA
INSERT INTO skill (name, category) VALUES
('Unit Testing', 'Testing'),
('Integration Testing', 'Testing'),
('End-to-End Testing (E2E)', 'Testing'),
('Jest', 'Testing'),
('Mocha', 'Testing'),
('Pytest', 'Testing'),
('JUnit', 'Testing'),
('Selenium', 'Testing'),
('Cypress', 'Testing'),
('Playwright', 'Testing'),
('Postman / API Testing', 'Testing'),
('JMeter', 'Testing'),
('k6', 'Testing'),
('Gatling', 'Testing'),
('Test-Driven Development (TDD)', 'Testing'),
('Behavior-Driven Development (BDD)', 'Testing'),
('Cucumber', 'Testing'),
('SonarQube', 'Testing'),
('Mutation Testing', 'Testing'),
('Load Testing', 'Testing'),
('Security Testing', 'Testing'),
('Manual Testing', 'Testing'),
('Test Automation Strategy', 'Testing');

-- 4.12 Project Management & Methodologies
INSERT INTO skill (name, category) VALUES
('Agile / Scrum', 'Project Management'),
('Kanban', 'Project Management'),
('Lean Startup', 'Project Management'),
('Extreme Programming (XP)', 'Project Management'),
('SAFe (Scaled Agile)', 'Project Management'),
('Jira', 'Project Management'),
('Trello', 'Project Management'),
('Asana', 'Project Management'),
('Monday.com', 'Project Management'),
('Notion', 'Project Management'),
('Confluence', 'Project Management'),
('Slack', 'Project Management'),
('Microsoft Teams', 'Project Management'),
('Discord', 'Project Management'),
('Product Ownership', 'Project Management'),
('Scrum Master', 'Project Management'),
('Sprint Planning', 'Project Management'),
('Backlog Management', 'Project Management'),
('User Stories', 'Project Management'),
('OKR / KPI Management', 'Project Management'),
('Risk Management', 'Project Management'),
('Stakeholder Management', 'Project Management'),
('Change Management', 'Project Management'),
('Prince2', 'Project Management'),
('PMI / PMP', 'Project Management');

-- 4.13 Soft Skills
INSERT INTO skill (name, category) VALUES
('Communication orale', 'Soft Skills'),
('Communication écrite', 'Soft Skills'),
('Présentation / Pitch', 'Soft Skills'),
('Négociation', 'Soft Skills'),
('Leadership', 'Soft Skills'),
('Gestion d''équipe', 'Soft Skills'),
('Mentorat / Coaching', 'Soft Skills'),
('Travail en équipe', 'Soft Skills'),
('Collaboration transverse', 'Soft Skills'),
('Résolution de problèmes', 'Soft Skills'),
('Pensée critique', 'Soft Skills'),
('Créativité', 'Soft Skills'),
('Adaptabilité / Flexibilité', 'Soft Skills'),
('Gestion du stress', 'Soft Skills'),
('Gestion du temps', 'Soft Skills'),
('Priorisation', 'Soft Skills'),
('Autonomie', 'Soft Skills'),
('Prise d''initiative', 'Soft Skills'),
('Esprit d''analyse', 'Soft Skills'),
('Attention aux détails', 'Soft Skills'),
('Empathie', 'Soft Skills'),
('Intelligence émotionnelle', 'Soft Skills'),
('Gestion de conflits', 'Soft Skills'),
('Networking', 'Soft Skills'),
('Veille technologique', 'Soft Skills'),
('Apprentissage continu', 'Soft Skills'),
('Français professionnel', 'Soft Skills'),
('Anglais professionnel', 'Soft Skills');

-- 4.14 Office & Productivity Tools
INSERT INTO skill (name, category) VALUES
('Microsoft Office (Word, Excel, PowerPoint)', 'Office Tools'),
('Microsoft Excel Avancé', 'Office Tools'),
('Google Workspace', 'Office Tools'),
('LibreOffice', 'Office Tools'),
('LaTeX', 'Office Tools'),
('Markdown', 'Office Tools'),
('Notion Avancé', 'Office Tools'),
('Airtable', 'Office Tools'),
('Zapier / Make', 'Office Tools'),
('Microsoft Power Automate', 'Office Tools');

-- 4.15 ERP & CRM
INSERT INTO skill (name, category) VALUES
('SAP', 'ERP / CRM'),
('Salesforce', 'ERP / CRM'),
('Microsoft Dynamics 365', 'ERP / CRM'),
('HubSpot', 'ERP / CRM'),
('Zendesk', 'ERP / CRM'),
('ServiceNow', 'ERP / CRM'),
('Odoo', 'ERP / CRM'),
('Zoho CRM', 'ERP / CRM'),
('Pipedrive', 'ERP / CRM');

-- 4.16 Operating Systems
INSERT INTO skill (name, category) VALUES
('Ubuntu / Debian', 'Operating System'),
('CentOS / RHEL / Fedora', 'Operating System'),
('Arch Linux', 'Operating System'),
('Alpine Linux', 'Operating System'),
('macOS', 'Operating System'),
('Windows 10/11', 'Operating System');


-- ============================================================
-- 5. COMPANIES
-- ============================================================

INSERT INTO company
(name, website, logo_url, industry, location, company_size, description, created_at, updated_at)
VALUES
-- Grandes ESN / Consulting IT
('Capgemini', 'https://www.capgemini.com', 'https://logo.clearbit.com/capgemini.com', 'IT Consulting', 'Paris, France', 350000, 'Leader mondial du conseil, des services technologiques et de la transformation digitale. Présent dans plus de 50 pays.', NOW(), NOW()),
('Sopra Steria', 'https://www.soprasteria.com', 'https://logo.clearbit.com/soprasteria.com', 'IT Consulting', 'Paris, France', 47000, 'Acteur européen de la transformation digitale, spécialisé dans le conseil, l''intégration de systèmes et l''édition de logiciels.', NOW(), NOW()),
('Atos', 'https://atos.net', 'https://logo.clearbit.com/atos.net', 'Digital Services', 'Bezons, France', 110000, 'Leader mondial de la transformation digitale avec une expertise en cloud, cybersécurité et supercalculateurs.', NOW(), NOW()),
('Accenture', 'https://www.accenture.com', 'https://logo.clearbit.com/accenture.com', 'IT Consulting', 'Dublin, Irelande', 733000, 'Cabinet de conseil en stratégie, technologie et opérations. Leader mondial du conseil et des services IT.', NOW(), NOW()),
('Deloitte Digital', 'https://www.deloitte.com', 'https://logo.clearbit.com/deloitte.com', 'IT Consulting', 'Paris, France', 415000, 'Branche digitale de Deloitte, combinant conseil en stratégie, design et technologie.', NOW(), NOW()),
('Wavestone', 'https://www.wavestone.com', 'https://logo.clearbit.com/wavestone.com', 'IT Consulting', 'Paris, France', 3500, 'Cabinet de conseil en management et transformation, reconnu pour son approche collaborative et innovante.', NOW(), NOW()),

-- Défense & Aéronautique
('Thales', 'https://www.thalesgroup.com', 'https://logo.clearbit.com/thalesgroup.com', 'Defense & Aerospace', 'Paris, France', 81000, 'Leader mondial des hautes technologies pour l''aérospatial, la défense, la sécurité et les transports.', NOW(), NOW()),
('Dassault Aviation', 'https://www.dassault-aviation.com', 'https://logo.clearbit.com/dassault-aviation.com', 'Aerospace', 'Saint-Cloud, France', 12500, 'Constructeur aéronautique français, célèbre pour les avions Rafale et Falcon.', NOW(), NOW()),
('Safran', 'https://www.safran-group.com', 'https://logo.clearbit.com/safran-group.com', 'Aerospace & Defense', 'Paris, France', 84000, 'Groupe international de haute technologie opérant dans l''aéronautique, l''espace et la défense.', NOW(), NOW()),
('Airbus', 'https://www.airbus.com', 'https://logo.clearbit.com/airbus.com', 'Aerospace', 'Toulouse, France', 134000, 'Leader européen de l''aéronautique et du spatial. Constructeur d''avions civils et d''hélicoptères.', NOW(), NOW()),

-- Télécommunications
('Orange', 'https://www.orange.com', 'https://logo.clearbit.com/orange.com', 'Telecommunications', 'Paris, France', 136000, 'Opérateur télécom européen majeur, leader de la fibre optique en France et présent dans 26 pays.', NOW(), NOW()),
('Free / Iliad', 'https://www.iliad.fr', 'https://logo.clearbit.com/iliad.fr', 'Telecommunications', 'Paris, France', 7000, 'Groupe de télécommunications français, connu pour sa marque Free et son approche disruptive du marché.', NOW(), NOW()),
('Bouygues Telecom', 'https://www.bouyguestelecom.fr', 'https://logo.clearbit.com/bouyguestelecom.fr', 'Telecommunications', 'Paris, France', 5200, 'Opérateur de téléphonie mobile et fournisseur d''accès à Internet, filiale du groupe Bouygues.', NOW(), NOW()),
('Nokia', 'https://www.nokia.com', 'https://logo.clearbit.com/nokia.com', 'Telecommunications', 'Espoo, Finlande', 87000, 'Leader mondial des infrastructures réseau 5G et des technologies de communication.', NOW(), NOW()),

-- Énergie & Industrie
('TotalEnergies', 'https://totalenergies.com', 'https://logo.clearbit.com/totalenergies.com', 'Energy', 'Courbevoie, France', 100000, 'Groupe énergétique multinational, acteur majeur de la transition énergétique (pétrole, gaz, électricité renouvelable).', NOW(), NOW()),
('EDF', 'https://www.edf.fr', 'https://logo.clearbit.com/edf.fr', 'Energy', 'Paris, France', 165000, 'Leader mondial de l''électricité bas carbone. Producteur, fournisseur et gestionnaire de réseaux.', NOW(), NOW()),
('Engie', 'https://www.engie.com', 'https://logo.clearbit.com/engie.com', 'Energy', 'Courbevoie, France', 96000, 'Groupe mondial de l''énergie et des services, leader de la transition énergétique en Europe.', NOW(), NOW()),
('Schneider Electric', 'https://www.se.com', 'https://logo.clearbit.com/se.com', 'Energy Management', 'Rueil-Malmaison, France', 150000, 'Spécialiste mondial de la gestion de l''énergie et des automatismes. Leader de l''efficacité énergétique.', NOW(), NOW()),
('Siemens', 'https://www.siemens.com', 'https://logo.clearbit.com/siemens.com', 'Industry', 'Munich, Allemagne', 311000, 'Conglomérat industriel allemand, leader dans l''automatisation, la digitalisation et l''électrification.', NOW(), NOW()),
('Bosch', 'https://www.bosch.com', 'https://logo.clearbit.com/bosch.com', 'Industry', 'Gerlingen, Allemagne', 400000, 'Groupe industriel et technologique allemand, leader mondial des équipementiers automobiles.', NOW(), NOW()),

-- Banque & Assurance
('BNP Paribas', 'https://group.bnpparibas', 'https://logo.clearbit.com/bnpparibas.com', 'Banking', 'Paris, France', 190000, 'Première banque de la zone euro et leader mondial des services financiers.', NOW(), NOW()),
('Société Générale', 'https://www.societegenerale.com', 'https://logo.clearbit.com/societegenerale.com', 'Banking', 'Paris, France', 117000, 'Groupe de services financiers et bancaires, présent dans plus de 60 pays.', NOW(), NOW()),
('Crédit Agricole', 'https://www.credit-agricole.com', 'https://logo.clearbit.com/credit-agricole.com', 'Banking', 'Montrouge, France', 140000, 'Premier réseau bancaire coopératif en France, acteur majeur de la banque de détail et d''investissement.', NOW(), NOW()),
('AXA', 'https://www.axa.com', 'https://logo.clearbit.com/axa.com', 'Insurance', 'Paris, France', 93000, 'Leader mondial de l''assurance et de la gestion d''actifs. Présent dans 50 pays.', NOW(), NOW()),
('BPCE / Natixis', 'https://www.groupebpce.fr', 'https://logo.clearbit.com/groupebpce.fr', 'Banking', 'Paris, France', 100000, 'Deuxième réseau bancaire français regroupant les Banques Populaires et les Caisses d''Epargne.', NOW(), NOW()),
('LCL', 'https://www.lcl.fr', 'https://logo.clearbit.com/lcl.fr', 'Banking', 'Lyon, France', 18000, 'Banque commerciale française, filiale du groupe Crédit Agricole.', NOW(), NOW()),

-- Tech & Software
('Dassault Systèmes', 'https://www.3ds.com', 'https://logo.clearbit.com/3ds.com', 'Software', 'Vélizy-Villacoublay, France', 24000, 'Leader mondial des logiciels de conception 3D et d''expérience virtuelle (CATIA, SolidWorks, ENOVIA).', NOW(), NOW()),
('OVHcloud', 'https://www.ovhcloud.com', 'https://logo.clearbit.com/ovhcloud.com', 'Cloud Computing', 'Roubaix, France', 2800, 'Leader européen du cloud computing. Hébergeur de serveurs et fournisseur de services cloud publics.', NOW(), NOW()),
('Blablacar', 'https://www.blablacar.fr', 'https://logo.clearbit.com/blablacar.com', 'Mobility', 'Paris, France', 600, 'Leader européen du covoiturage. Plateforme de mise en relation pour les trajets longue distance.', NOW(), NOW()),
('Doctolib', 'https://www.doctolib.fr', 'https://logo.clearbit.com/doctolib.fr', 'HealthTech', 'Paris, France', 2800, 'Leader européen de la e-santé. Plateforme de prise de rendez-vous médicaux et de téléconsultation.', NOW(), NOW()),
('Qonto', 'https://qonto.com', 'https://logo.clearbit.com/qonto.com', 'FinTech', 'Paris, France', 500, 'Néobanque française dédiée aux professionnels, freelances et PME. Rachetée par Qonto Group.', NOW(), NOW()),
('Lydia', 'https://lydia-app.com', 'https://logo.clearbit.com/lydia-app.com', 'FinTech', 'Paris, France', 250, 'Application de paiement mobile française. Simplifie les transferts d''argent entre particuliers.', NOW(), NOW()),
('Mirakl', 'https://www.mirakl.com', 'https://logo.clearbit.com/mirakl.com', 'SaaS', 'Paris, France', 800, 'Leader mondial des solutions de marketplace B2B et B2C pour les grandes entreprises.', NOW(), NOW()),
('Contentsquare', 'https://contentsquare.com', 'https://logo.clearbit.com/contentsquare.com', 'SaaS', 'Paris, France', 1000, 'Plateforme d''analytics comportementale pour optimiser l''expérience digitale. Licorne française.', NOW(), NOW()),
('Dataiku', 'https://www.dataiku.com', 'https://logo.clearbit.com/dataiku.com', 'Data & AI', 'Paris, France', 1200, 'Plateforme d''IA et de data science collaborative. Licorne française leader du MLops.', NOW(), NOW()),
('Algolia', 'https://www.algolia.com', 'https://logo.clearbit.com/algolia.com', 'SaaS', 'Paris, France / San Francisco, USA', 600, 'Moteur de recherche et de découverte API-first pour les applications web et mobile.', NOW(), NOW()),
('Back Market', 'https://www.backmarket.com', 'https://logo.clearbit.com/backmarket.com', 'E-commerce', 'Paris, France', 800, 'Première place de marché dédiée aux produits reconditionnés (smartphones, ordinateurs, électroménager).', NOW(), NOW()),
('ManoMano', 'https://www.manomano.fr', 'https://logo.clearbit.com/manomano.fr', 'E-commerce', 'Paris, France', 900, 'Leader européen du e-commerce du bricolage, du jardinage et de l''aménagement de la maison.', NOW(), NOW()),
('Meero', 'https://www.meero.com', 'https://logo.clearbit.com/meero.com', 'AI / Photography', 'Paris, France', 300, 'Licorne française spécialisée dans l''IA appliquée à la photographie et à l''imagerie professionnelle.', NOW(), NOW()),
('Payfit', 'https://payfit.com', 'https://logo.clearbit.com/payfit.com', 'SaaS / HR', 'Paris, France', 700, 'Solution de paie et de gestion des ressources humaines 100 % cloud pour les PME.', NOW(), NOW()),
('Spendesk', 'https://www.spendesk.com', 'https://logo.clearbit.com/spendesk.com', 'FinTech', 'Paris, France', 700, 'Plateforme de gestion des dépenses et des paiements pour les entreprises. Licorne française.', NOW(), NOW()),
('Alan', 'https://alan.com', 'https://logo.clearbit.com/alan.com', 'InsurTech', 'Paris, France', 300, 'Assurance santé 100 % digitale pour les entreprises et les indépendants. Licorne française.', NOW(), NOW()),
('Shift Technology', 'https://www.shift-technology.com', 'https://logo.clearbit.com/shift-technology.com', 'InsurTech / AI', 'Paris, France', 500, 'Solutions d''IA pour la détection de fraude et l''automatisation des sinistres en assurance.', NOW(), NOW()),

-- Jeux Vidéo & Entertainment
('Ubisoft', 'https://www.ubisoft.com', 'https://logo.clearbit.com/ubisoft.com', 'Video Games', 'Montreuil, France', 20000, 'Troisième éditeur de jeux vidéo indépendant au monde. Créateur des franchises Assassin''s Creed et Far Cry.', NOW(), NOW()),
('Gameloft', 'https://www.gameloft.com', 'https://logo.clearbit.com/gameloft.com', 'Video Games', 'Paris, France', 3600, 'Éditeur et développeur de jeux mobiles de référence. Filiale du groupe Vivendi.', NOW(), NOW()),
('Deezer', 'https://www.deezer.com', 'https://logo.clearbit.com/deezer.com', 'Music Streaming', 'Paris, France', 600, 'Service de streaming musical français, concurrent de Spotify avec plus de 90 millions de titres.', NOW(), NOW()),
('Ankama', 'https://www.ankama.com', 'https://logo.clearbit.com/ankama.com', 'Video Games', 'Roubaix, France', 450, 'Studio de création française, célèbre pour le MMORPG Dofus et l''univers Wakfu.', NOW(), NOW()),

-- Médias & Communication
('France Télévisions', 'https://www.francetelevisions.fr', 'https://logo.clearbit.com/francetelevisions.fr', 'Media', 'Paris, France', 10000, 'Premier groupe audiovisuel public français. Éditeur des chaînes France 2, France 3, France 4, France 5 et franceinfo.', NOW(), NOW()),
('Vivendi', 'https://www.vivendi.com', 'https://logo.clearbit.com/vivendi.com', 'Media', 'Paris, France', 44000, 'Groupe de médias et de divertissement, propriétaire de Canal+ Group, Havas et Editis.', NOW(), NOW()),
('Publicis Groupe', 'https://www.publicis.com', 'https://logo.clearbit.com/publicis.com', 'Advertising', 'Paris, France', 83000, 'Troisième groupe publicitaire mondial. Leader du marketing, de la communication et de la transformation digitale.', NOW(), NOW()),
('Havas', 'https://www.havas.com', 'https://logo.clearbit.com/havas.com', 'Advertising', 'Puteaux, France', 22000, 'Groupe mondial de communication, filiale de Vivendi. Expert en médias, création et consulting.', NOW(), NOW()),

-- Retail & E-commerce
('Carrefour', 'https://www.carrefour.com', 'https://logo.clearbit.com/carrefour.com', 'Retail', 'Massy, France', 319000, 'Deuxième groupe de distribution mondial. Leader de la grande distribution en France et en Europe.', NOW(), NOW()),
('LVMH', 'https://www.lvmh.com', 'https://logo.clearbit.com/lvmh.com', 'Luxury Goods', 'Paris, France', 196000, 'Leader mondial du luxe. Propriétaire de Louis Vuitton, Dior, Moët Hennessy, Sephora et 75 autres maisons.', NOW(), NOW()),
('Kering', 'https://www.kering.com', 'https://logo.clearbit.com/kering.com', 'Luxury Goods', 'Paris, France', 47000, 'Deuxième groupe mondial du luxe. Propriétaire de Gucci, Saint Laurent, Bottega Veneta, Balenciaga.', NOW(), NOW()),
('Hermès', 'https://www.hermes.com', 'https://logo.clearbit.com/hermes.com', 'Luxury Goods', 'Paris, France', 22000, 'Maison de luxe française emblématique, réputée pour son artisanat, ses sacs et ses carrés de soie.', NOW(), NOW()),
('Fnac Darty', 'https://www.fnacdarty.com', 'https://logo.clearbit.com/fnacdarty.com', 'Retail', 'Ivry-sur-Seine, France', 25000, 'Leader français de la distribution de produits culturels, techniques et électroménagers.', NOW(), NOW()),
('Cdiscount', 'https://www.cdiscount.com', 'https://logo.clearbit.com/cdiscount.com', 'E-commerce', 'Bordeaux, France', 2500, 'Pionnier du e-commerce français. Place de marché généraliste avec plus de 40 millions de produits.', NOW(), NOW()),

-- Transports & Logistique
('SNCF', 'https://www.sncf.com', 'https://logo.clearbit.com/sncf.com', 'Transportation', 'Saint-Denis, France', 270000, 'Entreprise publique ferroviaire française. Gestionnaire du réseau ferré national et opérateur de transport.', NOW(), NOW()),
('RATP', 'https://www.ratp.fr', 'https://logo.clearbit.com/ratp.fr', 'Transportation', 'Paris, France', 65000, 'Opérateur des transports publics parisiens. Métro, RER, bus et tramway en Île-de-France.', NOW(), NOW()),
('Air France-KLM', 'https://www.airfranceklm.com', 'https://logo.clearbit.com/airfranceklm.com', 'Aviation', 'Paris, France', 76000, 'Groupe aérien européen majeur, résultat de la fusion entre Air France et KLM.', NOW(), NOW()),
('Geodis', 'https://www.geodis.com', 'https://logo.clearbit.com/geodis.com', 'Logistics', 'Levallois-Perret, France', 41000, 'Cinquième acteur mondial de la logistique et du transport. Filiale du groupe SNCF.', NOW(), NOW()),
('La Poste', 'https://www.laposte.fr', 'https://logo.clearbit.com/laposte.fr', 'Logistics', 'Paris, France', 253000, 'Opérateur postal public français. Services de courrier, colis et banque (La Banque Postale).', NOW(), NOW()),

-- Santé & Pharma
('Sanofi', 'https://www.sanofi.com', 'https://logo.clearbit.com/sanofi.com', 'Pharmaceuticals', 'Paris, France', 90000, 'Leader mondial de la santé. Recherche, développement et production de médicaments et vaccins.', NOW(), NOW()),
('Ipsen', 'https://www.ipsen.com', 'https://logo.clearbit.com/ipsen.com', 'Pharmaceuticals', 'Boulogne-Billancourt, France', 5700, 'Groupe pharmaceutique français de biotechnologie, spécialisé dans les maladies rares et l''oncologie.', NOW(), NOW()),
('BioMérieux', 'https://www.biomerieux.com', 'https://logo.clearbit.com/biomerieux.com', 'HealthTech', 'Marcy-l''Étoile, France', 13000, 'Leader mondial du diagnostic in vitro. Solutions de microbiologie et de biologie moléculaire.', NOW(), NOW()),

-- Éducation & Recherche
('OpenClassrooms', 'https://openclassrooms.com', 'https://logo.clearbit.com/openclassrooms.com', 'EdTech', 'Paris, France', 600, 'Plateforme de formation en ligne française. Propose des parcours diplômants et des bootcamps tech.', NOW(), NOW()),
('Simplon.co', 'https://simplon.co', 'https://logo.clearbit.com/simplon.co', 'EdTech', 'Montreuil, France', 400, 'Réseau de fabriques numériques inclusives. Formations gratuites aux métiers tech pour publics éloignés de l''emploi.', NOW(), NOW()),
('42 (École)', 'https://42.fr', 'https://logo.clearbit.com/42.fr', 'EdTech', 'Paris, France', 200, 'École d''informatique innovante et gratuite, fondée par Xavier Niel. Pédagogie par projets sans cours magistraux.', NOW(), NOW()),

-- International Tech (pour diversité du matching)
('Google', 'https://www.google.com', 'https://logo.clearbit.com/google.com', 'Technology', 'Mountain View, USA', 190000, 'Leader mondial des moteurs de recherche, de la publicité en ligne et des services cloud (GCP).', NOW(), NOW()),
('Microsoft', 'https://www.microsoft.com', 'https://logo.clearbit.com/microsoft.com', 'Technology', 'Redmond, USA', 221000, 'Géant mondial du logiciel, du cloud (Azure) et des services professionnels.', NOW(), NOW()),
('Amazon', 'https://www.amazon.com', 'https://logo.clearbit.com/amazon.com', 'Technology / E-commerce', 'Seattle, USA', 1540000, 'Leader mondial du e-commerce et du cloud computing (AWS).', NOW(), NOW()),
('Meta', 'https://about.meta.com', 'https://logo.clearbit.com/meta.com', 'Technology', 'Menlo Park, USA', 77000, 'Groupe technologique propriétaire de Facebook, Instagram, WhatsApp et de la réalité virtuelle (Meta Quest).', NOW(), NOW()),
('Apple', 'https://www.apple.com', 'https://logo.clearbit.com/apple.com', 'Technology', 'Cupertino, USA', 161000, 'Leader mondial de l''électronique grand public, du logiciel et des services (iPhone, Mac, App Store).', NOW(), NOW()),
('Netflix', 'https://www.netflix.com', 'https://logo.clearbit.com/netflix.com', 'Entertainment', 'Los Gatos, USA', 12800, 'Leader mondial du streaming vidéo par abonnement. Producteur de contenu original.', NOW(), NOW()),
('Spotify', 'https://www.spotify.com', 'https://logo.clearbit.com/spotify.com', 'Music Streaming', 'Stockholm, Suède', 9000, 'Leader mondial du streaming musical. Plateforme audio avec podcasts et livres audio.', NOW(), NOW()),
('SAP', 'https://www.sap.com', 'https://logo.clearbit.com/sap.com', 'Enterprise Software', 'Walldorf, Allemagne', 112000, 'Leader mondial des logiciels de gestion d''entreprise (ERP, CRM, supply chain).', NOW(), NOW()),
('Booking.com', 'https://www.booking.com', 'https://logo.clearbit.com/booking.com', 'Travel Tech', 'Amsterdam, Pays-Bas', 22000, 'Leader mondial de la réservation d''hébergement en ligne. Filiale de Booking Holdings.', NOW(), NOW()),
('Adyen', 'https://www.adyen.com', 'https://logo.clearbit.com/adyen.com', 'FinTech', 'Amsterdam, Pays-Bas', 4000, 'Plateforme de paiement globale pour les entreprises. Fintech néerlandaise cotée en bourse.', NOW(), NOW()),
('Zalando', 'https://www.zalando.com', 'https://logo.clearbit.com/zalando.com', 'E-commerce', 'Berlin, Allemagne', 17000, 'Leader européen de la mode en ligne. Marketplace et logistique intégrée.', NOW(), NOW()),
('Stripe', 'https://stripe.com', 'https://logo.clearbit.com/stripe.com', 'FinTech', 'Dublin, Irlande / San Francisco, USA', 8000, 'Infrastructure de paiement pour Internet. API de paiement préférée des développeurs et startups.', NOW(), NOW()),
('Shopify', 'https://www.shopify.com', 'https://logo.clearbit.com/shopify.com', 'E-commerce', 'Ottawa, Canada', 11000, 'Plateforme de commerce en ligne permettant de créer des boutiques en ligne facilement.', NOW(), NOW()),
('Unity Technologies', 'https://unity.com', 'https://logo.clearbit.com/unity.com', 'Gaming / Software', 'Copenhagen, Danemark', 7700, 'Leader mondial des moteurs de jeu temps réel (Unity 3D). Utilisé pour les jeux, la VR et l''AR.', NOW(), NOW()),
('Wise (TransferWise)', 'https://wise.com', 'https://logo.clearbit.com/wise.com', 'FinTech', 'Londres, Royaume-Uni', 5000, 'Service de transfert d''argent international à coût réduit. Fintech britannique cotée.', NOW(), NOW()),
('Revolut', 'https://www.revolut.com', 'https://logo.clearbit.com/revolut.com', 'FinTech', 'Londres, Royaume-Uni', 8000, 'Super-app bancaire néo-banque britannique. Comptes multi-devises, trading, crypto.', NOW(), NOW()),
('Klarna', 'https://www.klarna.com', 'https://logo.clearbit.com/klarna.com', 'FinTech', 'Stockholm, Suède', 5000, 'Leader européen du "Buy Now Pay Later". Solutions de paiement flexibles pour le e-commerce.', NOW(), NOW()),
('Bolt', 'https://bolt.eu', 'https://logo.clearbit.com/bolt.eu', 'Mobility', 'Tallinn, Estonie', 3000, 'Plateforme européenne de VTC et de livraison de repas. Concurrent d''Uber en Europe.', NOW(), NOW()),
('Delivery Hero', 'https://www.deliveryhero.com', 'https://logo.clearbit.com/deliveryhero.com', 'Food Tech', 'Berlin, Allemagne', 45000, 'Leader mondial de la livraison de repas à domicile. Propriétaire de Foodora et Glovo.', NOW(), NOW()),
('Personio', 'https://www.personio.de', 'https://logo.clearbit.com/personio.de', 'HR Tech', 'Munich, Allemagne', 2500, 'Logiciel RH tout-en-un pour les PME européennes. Recrutement, paie et gestion des talents.', NOW(), NOW()),
('Miro', 'https://miro.com', 'https://logo.clearbit.com/miro.com', 'Collaboration', 'Amsterdam, Pays-Bas / San Francisco, USA', 1800, 'Plateforme de tableau blanc collaboratif en ligne. Leader du visual collaboration.', NOW(), NOW()),
('Figma', 'https://www.figma.com', 'https://logo.clearbit.com/figma.com', 'Design / SaaS', 'San Francisco, USA', 1300, 'Outil de design interface collaboratif basé sur le web. Racheté par Adobe (en cours d''approbation).', NOW(), NOW()),
('Notion Labs', 'https://www.notion.so', 'https://logo.clearbit.com/notion.so', 'Productivity', 'San Francisco, USA', 600, 'Application de productivité tout-en-un : notes, bases de données, wikis et gestion de projet.', NOW(), NOW()),
('Canva', 'https://www.canva.com', 'https://logo.clearbit.com/canva.com', 'Design / SaaS', 'Sydney, Australie', 3500, 'Plateforme de design graphique en ligne. Outil de création visuelle grand public et professionnel.', NOW(), NOW());


COMMIT;
