//base libraries
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');
const app = express();
const mongoose = require('mongoose');
const rateLimit = require("express-rate-limit");
const config = require("./config");

//routes
const postRoutes = require('./routes/post');
const authRoutes = require('./routes/auth');
const followRoutes = require('./routes/follow');

//middlewares
const errorHandler = require('./middlewares/errorHandler');
const passportJWT = require('./middlewares/passportJWT')();


app.use(cors());

// Enable if you're behind a reverse proxy (Heroku, Bluemix, AWS ELB, Nginx, etc)
// see https://expressjs.com/en/guide/behind-proxies.html
app.set('trust proxy', 1);
 
const limiter = rateLimit({
    //windowMs: config.appConfig.timeBetweenMaxNumberOfRequestsInMin * 60 * 1000, // 15 minutes
    windowMs: config.appConfig.timeBetweenMaxNumberOfRequestsInMin * 1000, // 15 seconds
    max: config.appConfig.maximumRequestNumberAllowedPerTime // limit each IP to 100 requests per windowMs
  });
   
//  apply to all requests
app.use(limiter);

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



app.listen(config.appConfig.port, () => {
    console.log("The app is listening");
});