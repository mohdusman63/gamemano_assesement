const prisma = require('../utill/prisma')
const utill=require('../utill/helper')

exports.register = async (req, res) => {
    try {
        const {email,name,password}=req.body
        const user = await prisma.user.create({
            data: {
                email:email,
                name: name,
                password:utill.hashPassword(password)
            }
        });
        let responseData={}
        let token=utill.generateToken(user)
        responseData.userDetails=user
        responseData.token=token
         res.status(200).json({
            statusCode: 200,
            message: 'Register Sucessfully',
            data: responseData,
          });

    }
    catch (e) {
        res.status(500).json({
            statusCode: 500,
            message: 'internal Server Error',
            error: e.message,
          });
    
    }


}

exports.login= async(req,res)=>{
    try {
        const { email, password } = req.body;

        // Find the user with the provided email address
        const user = await prisma.user.findUnique({
            where: { email: email }
        });

        // If user not found, return error
        if (!user) {
            return res.status(404).json({ message: 'User not found' });
        }

        // Verify the password
        const passwordValid = utill.compareHashPassword(password, user.password);

        // If password is not valid, return error
        if (!passwordValid) {
            return res.status(401).json({statusCode:400, message: 'Invalid password' });
        }

        // Generate JWT token
        const token = utill.generateToken(user);

        // Send response with token
        res.status(200).json({
            statusCode: 200,
            message: 'Login SucessFully',
            data: token,
          });
    } catch (e) {
        res.status(500).json({
            statusCode: 500,
            message: 'internal Server Error',
            error: e.message,
          });
    }
}