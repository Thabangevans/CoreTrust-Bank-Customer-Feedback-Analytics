/**
 * ===========================================
 * Process Feedback
 * Extract -> Validate -> Risk Assessment
 * ===========================================
 */

    function processFeedback(lastRow){

    // Extract customer feedback from the Google Sheet
    const feedback = extractFormData(lastRow);

    // Validate required fields
    validateData(feedback);

    Logger.log("Validation Passed");

    // Calculate the customer's risk
    const risk = calculateRisk(feedback);

    // Create the final feedback record that will be sent
    // to the Edge Function and stored in PostgreSQL
    const feedbackRecord = {

        ...feedback,

        // Risk Engine Results
        riskScore: risk.score,
        riskLevel: risk.level,

        // Version of the Risk Rules used
        riskRuleVersion: "1.0"

    };

    Logger.log("Submitted At: " + feedbackRecord.submittedAt);
    
    return feedbackRecord;

}
