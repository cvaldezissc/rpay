const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const app = express();
const path = require('path');
const postRoutes = require('./routes/post');
const errorHandler = require('./middlewares/errorHandler');
const mongoose = require('mongoose');


app.use(cors());
app.use(bodyParser.json());


//Connecting to mongo
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost/rpay-nosql', { useNewUrlParser: true });



//to serve static files
app.use(express.static(path.join(__dirname, "public")));


//configure the endpoints here
app.use("/api/post", postRoutes);

//Use the errorhandler
app.use(errorHandler);



app.listen(8000, () => {
    console.log("The app is listening");
});