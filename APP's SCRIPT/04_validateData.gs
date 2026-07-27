/**
 * ===========================================
 * Validate Feedback
 * ===========================================
 */

    function validateData(feedback){

    if(!feedback.firstName){
      throw new Error("First name is required");
    }

    if(!feedback.lastName){
      throw new Error("Last name is required");
    }

    if(!feedback.email){
      throw new Error("Email is required");
    }

    if(feedback.rating < 1 || feedback.rating > 5){
      throw new Error("Rating must be between 1 and 5");
    }

    return true;
    }
