/**
 * ===========================================
 * CoreTrust Bank ETL Pipeline
 * Risk Engine
 * ===========================================
 */

function calculateRisk(feedback) {
  
  let score = 0;

  //rating score
  switch(feedback.rating){

    case 1:
      score = score + 30;
      break;

    case 2:
    score = score + 20;
    break;

    case 3:
    score = score + 10;
    break;

    case 4:
    score = score + 5;
    break;

    case 5:
    score = score + 0;
    break;

    default:
    score = score + 0;
    break;

  }

  //Issue category score
  switch(feedback.issueCategory){

    case "Fraud Concern":
    score = score + 50;
    break;

    case "Waiting Time":
    score = score + 15;
    break;

    case "Billing Error":
    score = score + 20;
    break;

    case "Staff Behaviour":
    score = score + 15;
    break;

    case "ATM Issue":
    score = score + 20;
    break;

    case "Online Banking Problem":
    score = score + 25;
    break;

    case "Mobile Banking Problem":
    score = score + 25;
    break;

    case "Loan Processing Delay":
    score = score + 20;
    break;

    case "Insurance Query":
    score = score + 10;
    break;

    case "General Feedback":
    score = score + 0;
    break;

    default:
    score = score + 0;
    break;

  }

// ==========================
// Determine Risk Level
// ==========================

    let level;

    switch(true){

      case(score >= 60):
      level = "High";
      break;

      case (score >= 30):
      level = "Medium";
      break;

      default:
      level = "Low";
      break;
    }

  // ==========================
  // Return Risk Object
  // ==========================

  return{
    score: score,
    level: level
  };    

}
