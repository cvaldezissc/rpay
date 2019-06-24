const validationHandler = require('../validations/validationHandler');
const PostModel = require('../models/post');


exports.index = async (req, res) => {
    
    try{
        const posts = await PostModel.find({
            user: { $in: [...req.user.following, req.user.id] }
        })
        .populate("user")
        .sort({createdAt: -1});

        res.send(posts);
    } catch(err) {
        next(err);
    }
};

exports.show = async(req, res) => {
    const post = await PostModel.findOne({ 
        _id: req.params.id,
        user: { $in: [...req.user.following, req.user.id] }
    }).populate("user");
    res.send(post);
};

exports.showById = async(req, res) => {
    try{
    const foundPost = await PostModel.findOne({
        _id: req.params.id,
        user: { $in: [...req.user.following, req.user.id] }
    }).populate("user");
    res.send(foundPost);
    } catch(err) {
        next(err);
    }
}

exports.store = async (req, res, next) => {
    try{
        validationHandler(req);
        //res.send({message: "The name is "+req.body.name});

        let post = new PostModel();
        post.description = req.body.description;
        post.image = req.file.filename;
        post.user = req.user;
        await post.save();
        res.send(post);
    } catch(err) {
        next(err);
    }
};

exports.update = async (req, res, next) => {
    try{
        validationHandler(req);

        let foundedPost = await PostModel.findById(req.params.id);

        //checks if auth user is author
        if(!foundedPost || foundedPost.user != req.user.id) {
            console.log(foundedPost.user);
            console.log(req.user._id);
            const error = new Error("Wrong request (You are not the author of this post, so you are not allowed to update)");
            error.statusCode = 400;
            throw error;
        }

        foundedPost.description = req.body.description;
        await foundedPost.save();
        res.send(foundedPost);

    } catch(err) {
        next(err);
    }
};


exports.delete = async (req, res, next) => {
    try{

        let foundedPost = await PostModel.findById(req.params.id);

        //checks if auth user is author
        if(!foundedPost || foundedPost.user != req.user.id) {
            const error = new Error("Wrong request (You are not the author of this post so not allowed to delete)");
            error.statusCode = 400;
            throw error;
        }
        await foundedPost.delete();
        res.send({message: "Success"});

    } catch(err) {
        next(err);
    }
};