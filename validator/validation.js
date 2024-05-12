const { body, validationResult } = require('express-validator');



const registerValidationRules = () => {
    return [
        body('name').exists().notEmpty().trim().withMessage('account type is required.'),
        body('email').exists().notEmpty().trim().withMessage('authentication type is required.'),
        body('password').exists().notEmpty().trim().withMessage('authentication type is required.'),


    ];
};

const loginValidationRules = () => {
    return [
        body('email').exists().notEmpty().trim().withMessage('authentication type is required.'),
        body('password').exists().notEmpty().trim().withMessage('authentication type is required.'),


    ];
}

const validate = (req, res, next) => {
    const errors = validationResult(req);
    if (errors.isEmpty()) {
        return next();
    }


    return res.status(422).json({
        message: 'enter required field',
        errors: errors.array(),
    });



};

module.exports = {
    loginValidationRules,
    registerValidationRules,
    validate,

};
