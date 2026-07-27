CREATE TABLE staging.customer_feedback_raw(
submission_id SERIAL PRIMARY KEY,
submitted_at TIMESTAMP NOT NULL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(255) NOT NULL,
phone VARCHAR(20),
branch VARCHAR(150) NOT NULL,
service VARCHAR(150) NOT NULL,
rating INTEGER CHECK (rating BETWEEN 1 AND 5),
issue_category VARCHAR(100) NOT NULL,
comments TEXT,
preferred_contact VARCHAR(50),
consent VARCHAR(10),
risk_score INTEGER,
risk_level VARCHAR(20),
risk_rule_version INTEGER DEFAULT 1,
etl_loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
