//base libraries
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');
const app = express();
const mongoose = require('mongoose');

//routes
const postRoutes = require('./routes/post');
const authRoutes = require('./routes/auth');
const followRoutes = require('./routes/follow');

//middlewares
const errorHandler = require('./middlewares/errorHandler');
const passportJWT = require('./middlewares/passportJWT')();


app.use(cors());
app.use(bodyParser.json());
app.use(passportJWT.initialize());

//Connecting to mongo
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost/rpay-nosql', { useNewUrlParser: true });



//to serve static files
app.use(express.static(path.join(__dirname, "public")));


//configure the endpoints here
app.use("/api/post", passportJWT.authenticate(), postRoutes);
app.use("/api/auth",  authRoutes);
app.use("/api/follow", passportJWT.authenticate(), followRoutes);


//Use the errorhandler
app.use(errorHandler);



app.listen(8000, () => {
    console.log("The app is listening");
});