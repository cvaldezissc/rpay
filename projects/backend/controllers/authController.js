const jwt = require('jwt-simple');
const config = require('../config');
const User = require('../models/user');
const validationHandler = require('../validations/validationHandler');
const redisClient = require('../config/redis').getClient();

exports.login = async(req, res, next) => {
    try{
        const reqEmail = req.body.email;
        const reqPassword = req.body.password;

        //check if user exists in our database
        let user = await User.findOne({ email: reqEmail }).select("+password");

        if(!user) {
            const error = new Error("Wrong Credentials");
            error.statusCode = 401;
            throw error;
        }

        const validPassword = await user.validatePasswords(reqPassword, user.password);

        
        if(!validPassword) {
            const error = new Error("Wrong Credentials");
            error.statusCode = 401;
            throw error;
        }

        const token = jwt.encode({ id: user.id }, config.jwtSecret );
        return res.send({user, token});

    } catch(err) {
        next(err);
    }
};


exports.signup = async(req, res, next) => {


    try{

        validationHandler(req);

        const reqEmail = req.body.email;
        const reqPassword = req.body.password;
        const reqName = req.body.name;

        const existingUser = await User.findOne({ email: reqEmail });
        if(existingUser){
            const error = new Error("Email is already used");
            error.statusCode = 403;
            throw error;
        }

        let user = new User();
        user.email = reqEmail;
        user.password = await user.encryptPassword(reqPassword)
        user.name = reqName;
        user = await user.save();

        const token = jwt.encode( { id: user.id }, config.jwtSecret);

        return res.send({user, token});



    } catch(err){
        next(err)
    }
};


exports.meWithRedis = async(req, res, next) => {

    try{

        const cacheValue = await redisClient.hget("users", req.user.id);
        let user = undefined;

        if(cacheValue){
            console.log("Getting from Redis");
            const doc = JSON.parse(cacheValue);
            const cacheUser = new User(doc);
            return res.send(cacheUser);
        }

        console.log("Getting from the DB");
        user = await User.findById(req.user);
        redisClient.hset("users", req.user.id, JSON.stringify(user));
        
        return res.send(user);

    } catch(err) {
        next(err);
    }

};

exports.meBlank = async(req, res, next) => {
    try{

        console.log("Getting from the MONGO DB");
        const user = await User.findById(req.user);
        return res.send(user);

    } catch(err) {
        next(err);
    }
};