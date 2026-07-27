/**
 * ===========================================
 * Extract Form Data
 * ===========================================
 */

    function extractFormData(lastRow) {

  return {

    submittedAt: lastRow[0],

    firstName: lastRow[1],

    lastName: lastRow[2],

    email: lastRow[3],

    phone: lastRow[4],

    branch: lastRow[5],

    service: lastRow[6],

    rating: Number(lastRow[7]),

    issueCategory: lastRow[8],

    comments: lastRow[9],

    preferredContact: lastRow[10],

    consent: lastRow[11]

  };

}
