-- ==========================================================
-- CoreTrust Bank
-- Warehouse ETL Procedure
-- ==========================================================

CREATE OR REPLACE PROCEDURE warehouse.load_feedback_warehouse()
LANGUAGE plpgsql
AS $$
BEGIN

----------------------------------------------------------
-- Load Customer Dimension
----------------------------------------------------------
INSERT INTO warehouse.dim_customer
(first_name, last_name, email, phone)

SELECT DISTINCT
    first_name,
    last_name,
    email,
    phone
FROM staging.customer_feedback_raw s
WHERE NOT EXISTS
(
    SELECT 1
    FROM warehouse.dim_customer d
    WHERE d.email = s.email
);

----------------------------------------------------------
-- Load Branch Dimension
----------------------------------------------------------
INSERT INTO warehouse.dim_branch
(branch_name)

SELECT DISTINCT
    branch
FROM staging.customer_feedback_raw s
WHERE NOT EXISTS
(
    SELECT 1
    FROM warehouse.dim_branch d
    WHERE d.branch_name = s.branch
);

----------------------------------------------------------
-- Load Service Dimension
----------------------------------------------------------
INSERT INTO warehouse.dim_service
(service_name)

SELECT DISTINCT
    service
FROM staging.customer_feedback_raw s
WHERE NOT EXISTS
(
    SELECT 1
    FROM warehouse.dim_service d
    WHERE d.service_name = s.service
);

----------------------------------------------------------
-- Load Issue Dimension
----------------------------------------------------------
INSERT INTO warehouse.dim_issue
(issue_category)

SELECT DISTINCT
    issue_category
FROM staging.customer_feedback_raw s
WHERE NOT EXISTS
(
    SELECT 1
    FROM warehouse.dim_issue d
    WHERE d.issue_category = s.issue_category
);

----------------------------------------------------------
-- Load Date Dimension
----------------------------------------------------------
INSERT INTO warehouse.dim_date
(
date_key,
year,
quarter,
month,
month_name,
day,
weekday
)

SELECT DISTINCT

DATE(submitted_at),

EXTRACT(YEAR FROM submitted_at),

EXTRACT(QUARTER FROM submitted_at),

EXTRACT(MONTH FROM submitted_at),

TRIM(TO_CHAR(submitted_at,'Month')),

EXTRACT(DAY FROM submitted_at),

TRIM(TO_CHAR(submitted_at,'Day'))

FROM staging.customer_feedback_raw s

WHERE NOT EXISTS
(
SELECT 1
FROM warehouse.dim_date d
WHERE d.date_key = DATE(s.submitted_at)
);

----------------------------------------------------------
-- Load Fact Table
----------------------------------------------------------
INSERT INTO warehouse.fact_feedback
(
submission_id,
customer_key,
branch_key,
service_key,
issue_key,
date_key,
rating,
risk_score,
risk_level,
comments,
processed
)

SELECT

s.submission_id,

c.customer_key,

b.branch_key,

sv.service_key,

i.issue_key,

DATE(s.submitted_at),

s.rating,

s.risk_score,

s.risk_level,

s.comments,

TRUE

FROM staging.customer_feedback_raw s

JOIN warehouse.dim_customer c
ON s.email = c.email

JOIN warehouse.dim_branch b
ON s.branch = b.branch_name

JOIN warehouse.dim_service sv
ON s.service = sv.service_name

JOIN warehouse.dim_issue i
ON s.issue_category = i.issue_category

WHERE s.processed = FALSE

AND NOT EXISTS
(
SELECT 1
FROM warehouse.fact_feedback f
WHERE f.submission_id = s.submission_id
);

----------------------------------------------------------
-- Mark Staging Records Processed
----------------------------------------------------------
UPDATE staging.customer_feedback_raw

SET

processed = TRUE,

processed_at = NOW()

WHERE processed = FALSE;

END;
$$;
