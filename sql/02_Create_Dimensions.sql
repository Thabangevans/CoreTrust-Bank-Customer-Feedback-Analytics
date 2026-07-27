-- ==========================================================
-- Load Customer Dimension
-- ==========================================================

INSERT INTO warehouse.dim_customer
(
    first_name,
    last_name,
    email,
    phone
)

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


-- ==========================================================
-- Load Branch Dimension
-- ==========================================================

INSERT INTO warehouse.dim_branch
(
    branch_name
)

SELECT DISTINCT

    branch

FROM staging.customer_feedback_raw s

WHERE NOT EXISTS
(
    SELECT 1
    FROM warehouse.dim_branch d
    WHERE d.branch_name = s.branch
);


-- ==========================================================
-- Load Service Dimension
-- ==========================================================

INSERT INTO warehouse.dim_service
(
    service_name
)

SELECT DISTINCT

    service

FROM staging.customer_feedback_raw s

WHERE NOT EXISTS
(
    SELECT 1
    FROM warehouse.dim_service d
    WHERE d.service_name = s.service
);


INSERT INTO warehouse.dim_issue
(
    issue_category
)

SELECT DISTINCT

    issue_category

FROM staging.customer_feedback_raw s

WHERE NOT EXISTS
(
    SELECT 1
    FROM warehouse.dim_issue d
    WHERE d.issue_category = s.issue_category
);


-- ==========================================================
-- Load Date Dimension
-- ==========================================================

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

    TO_CHAR(submitted_at,'Month'),

    EXTRACT(DAY FROM submitted_at),

    TO_CHAR(submitted_at,'Day')

FROM staging.customer_feedback_raw s

WHERE NOT EXISTS
(
    SELECT 1
    FROM warehouse.dim_date d
    WHERE d.date_key = DATE(s.submitted_at)
);
