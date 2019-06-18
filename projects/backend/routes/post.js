const express = require('express');
const router = express.Router();
const postController = require('../controllers/postController');
const { hasName, hasDescription } = require('../validations/validators');
const uploadImage = require('../middlewares/multer');


//First route
router.get("/", postController.index );
router.get("/:id", postController.showById);
router.patch("/:id", postController.update);
router.delete("/:id", postController.delete);


router.post(
    "/", 
    uploadImage('postsFolder').single('image'), 
    hasDescription, 
    postController.store 
);



module.exports = router;