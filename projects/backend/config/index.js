module.exports = {
    appConfig: {
        port: 8000,
        timeBetweenMaxNumberOfRequestsInMin: 15,
        maximumRequestNumberAllowedPerTime: 10
    },
    persistanceConfig: {
        mongodb: {
            
        },
        redis:{
            host: "127.0.0.1",
            port: "6379",
            password: ""
        }
    },
    jwtSecret: 'ANY_RANDOM_STRING'
};