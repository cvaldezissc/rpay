const { body } = require('express-validator/check');


exports.hasName = 
    body('name')
    .isLength({min: 5})
    .withMessage("Name is required and the min length is 5 characters");


exports.hasDescription = 
    body('description')
    .isLength({min: 30})
    .withMessage("Description is required and the min length of a post Description id of 30 characters");