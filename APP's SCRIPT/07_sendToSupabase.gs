/**
 * ==========================================================
 * CoreTrust Bank ETL Pipeline
 * Send Customer Feedback to Supabase
 *
 * This function:
 * 1. Receives the processed feedback record
 * 2. Creates a JSON payload
 * 3. Sends the data to Supabase using the REST API
 * 4. Logs the HTTP response
 * ==========================================================
 */

function sendToSupabase(feedbackRecord) {

  Logger.log("===== ENTERED sendToSupabase() =====");

  try {

    //=========================================================
    // Supabase REST API Endpoint
    //=========================================================
    const url =
      "https://joblsymavabylrwlwgkf.supabase.co/rest/v1/customer_feedback_raw";

    Logger.log("REST URL Loaded");

    //=========================================================
    // Supabase Publishable (Anon) API Key
    //=========================================================
    const apiKey =
      "YOUR_SUPABASE_ANON_KEY";

    Logger.log("API Key Loaded");

    //=========================================================
    // Create JSON payload
    // Column names MUST match PostgreSQL exactly
    //=========================================================
    const payload = {

      submitted_at: feedbackRecord.submittedAt,

      first_name: feedbackRecord.firstName,
      last_name: feedbackRecord.lastName,

      email: feedbackRecord.email,
      phone: feedbackRecord.phone,

      branch: feedbackRecord.branch,
      service: feedbackRecord.service,

      rating: feedbackRecord.rating,
      issue_category: feedbackRecord.issueCategory,

      comments: feedbackRecord.comments,

      preferred_contact: feedbackRecord.preferredContact,

      consent: feedbackRecord.consent,

      risk_score: feedbackRecord.riskScore,
      risk_level: feedbackRecord.riskLevel,
      risk_rule_version: feedbackRecord.riskRuleVersion,

      processed: false

    };

    Logger.log("Payload Created");
    Logger.log(JSON.stringify(payload));

    //=========================================================
    // HTTP Request Options
    //=========================================================
    const options = {

      method: "post",

      contentType: "application/json",

      headers: {

        apikey: apiKey,

        Authorization: "Bearer " + apiKey,

        Accept: "application/json",

        Prefer: "return=representation",

        // Read from staging schema
        "Accept-Profile": "staging",

        // Write to staging schema
        "Content-Profile": "staging"

      },

      payload: JSON.stringify(payload),

      muteHttpExceptions: true

    };

    Logger.log("Sending request to Supabase...");

    //=========================================================
    // Send request
    //=========================================================
    const response = UrlFetchApp.fetch(url, options);

    Logger.log("Request Completed");

    Logger.log("HTTP Status: " + response.getResponseCode());

    Logger.log("Response Body:");

    Logger.log(response.getContentText());

  }

  catch (error) {

    Logger.log("========== ERROR ==========");

    Logger.log(error.toString());

    if (error.stack) {

      Logger.log(error.stack);

    }

    Logger.log("===========================");

  }

}
