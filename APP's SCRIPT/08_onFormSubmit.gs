/**
 * ==========================================================
 * Trigger Function
 * Runs automatically whenever the Google Form is submitted
 * ==========================================================
 */
function onFormSubmit(e) {

  // Get the active spreadsheet
  const spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  const sheet = spreadsheet.getSheets()[0];

  // Get the latest submitted row
  const lastRow = sheet.getLastRow();

  // Read the latest row
  const rowData = sheet.getRange(lastRow, 1, 1, sheet.getLastColumn()).getValues()[0];

  // Process the feedback
  const feedbackRecord = processFeedback(rowData);

  // Display the results in the log
  displayFeedback(feedbackRecord);

  // Send the data to Supabase
  sendToSupabase(feedbackRecord);

}
