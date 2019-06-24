const express = require("express");
const Router = express.Router();

const followController = require('../controllers/followController');

Router.post("/:id", followController.follow);


module.exports = Router;