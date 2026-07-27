/**
 * ===========================================
 * Display Feedback
 * ===========================================
 */

    function displayFeedback(feedbackRecord)
    {
        Logger.log("========== CUSTOMER FEEDBACK ==========");
        Logger.log("Name: " + feedbackRecord.firstName + " " + feedbackRecord.lastName);
        Logger.log("Email: " + feedbackRecord.email);
        Logger.log("Phone: " + feedbackRecord.phone);
        Logger.log("Branch: " + feedbackRecord.branch);
        Logger.log("Service: " + feedbackRecord.service);
        Logger.log("Rating: " + feedbackRecord.rating);
        Logger.log("Issue: " + feedbackRecord.issueCategory);
        Logger.log("Comments: " + feedbackRecord.comments);
        Logger.log("Preferred Contact: " + feedbackRecord.preferredContact);
        Logger.log("Consent: " + feedbackRecord.consent);
        Logger.log("======================================");

        Logger.log("========== RISK ASSESSMENT ===========");
        Logger.log("Risk Score: " + feedbackRecord.riskScore);
        Logger.log("Risk Level: " + feedbackRecord.riskLevel);
        Logger.log("======================================");
    }
