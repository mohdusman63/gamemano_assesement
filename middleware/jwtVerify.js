require('dotenv').config()
var jwt = require('jsonwebtoken');

module.exports = (async (req, res, next) => {
    try {
        let token = req.headers['authorization']
        if (!token) {
            return res.status(400).json({message: 'UnAuthorized'})
        } else {
            var Token = token.split(" ")[1];
            //console.log(Token)
          
        }
    } catch (error) {
        return res.status(500).json({message: 'Internal Server Error',error:error})

    }
})