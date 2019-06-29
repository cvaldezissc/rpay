const util = require('util');
const redis = require('redis');
const config = require('../config');

let client; 


module.exports = {
    getClient: () => {
        if(!client) {
            //console.log("Initializing REDIS!!!!");
            redisConfig = {
                host: config.persistanceConfig.redis.host,
                port: config.persistanceConfig.redis.port
            };

            if(process.env.NODE_ENV === "production") {
                redisConfig.password = config.redisPassword;
            }

            client = redis.createClient(redisConfig);
            client.hget = util.promisify(client.hget);
            client.hdel = util.promisify(client.hdel);
            return client;
        }
    }
};