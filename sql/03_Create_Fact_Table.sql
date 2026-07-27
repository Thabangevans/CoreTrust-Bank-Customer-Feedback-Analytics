-- ==========================================================
-- FACT TABLE
-- ==========================================================

CREATE TABLE IF NOT EXISTS warehouse.fact_feedback (

    feedback_key SERIAL PRIMARY KEY,

    submission_id INTEGER UNIQUE,

    customer_key INTEGER REFERENCES warehouse.dim_customer(customer_key),

    branch_key INTEGER REFERENCES warehouse.dim_branch(branch_key),

    service_key INTEGER REFERENCES warehouse.dim_service(service_key),

    issue_key INTEGER REFERENCES warehouse.dim_issue(issue_key),

    date_key DATE REFERENCES warehouse.dim_date(date_key),

    rating INTEGER,

    risk_score INTEGER,

    risk_level VARCHAR(20),

    comments TEXT,

    processed BOOLEAN,

    loaded_at TIMESTAMP DEFAULT NOW()

);
