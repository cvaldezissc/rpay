const path = require('path');
const multer = require('multer');

module.exports = (folderName) => {

    return multer({
        fileFilter: (req, file, callback) => {
            const ext = path.extname(file.originalname);

            if(
                ext != ".png" &&
                ext != ".jpg" &&
                ext != ".gif" &&
                ext != ".jpeg"
            ) {
                return callback(new Error("Only images allowed"));
            }
            callback(null, true);
        },
        dest: `public/uploads/${folderName}/`
    });
};