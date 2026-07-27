-- ==========================================================
-- Automatically run ETL after every insert
-- ==========================================================

DROP TRIGGER IF EXISTS trg_run_etl
ON staging.customer_feedback_raw;

CREATE TRIGGER trg_run_etl

AFTER INSERT

ON staging.customer_feedback_raw

FOR EACH STATEMENT

EXECUTE FUNCTION warehouse.run_etl_trigger();
