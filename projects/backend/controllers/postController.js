const validationHandler = require('../validations/validationHandler');
const PostModel = require('../models/post');


exports.index = async (req, res) => {
    
    try{
        const posts = await PostModel.find().sort({createdAt: -1});
        res.send(posts);
    } catch(err) {
        next(err);
    }
};


exports.showById = async(req, res) => {
    try{
    const foundPost = await PostModel.findOne({
        _id: req.params.id
    });
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
        await foundedPost.delete();
        res.send({message: "Success"});

    } catch(err) {
        next(err);
    }
};