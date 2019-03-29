var respond = function(response, statusCode, message, data) {
    
    response.writeHead(statusCode, {
        'Content-Type': 'application/json'
    });

    response.end(JSON.stringify({
        message: message
        , data: data
    }));
};

module.exports = {
    respond: respond
};