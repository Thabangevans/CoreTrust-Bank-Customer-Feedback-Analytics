/**
 * ===========================================
 * CoreTrust Bank ETL Pipeline
 * Main Entry Point
 * ===========================================
 */

function testPipeline() {

  // Get Spreadsheet
  const spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  const sheet = spreadsheet.getSheets()[0];

  // Get latest form submission
  const data = sheet.getDataRange().getValues();
  const lastRow = data[data.length - 1];

  // Process feedback
  const feedbackRecord = processFeedback(lastRow);

  // Display results
  displayFeedback(feedbackRecord);

  // Send to Supabase
  sendToSupabase(feedbackRecord);

}
