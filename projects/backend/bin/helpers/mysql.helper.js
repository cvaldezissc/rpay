var config = require('config');
var mysql = require('promise-mysql');
var responseHelper = require('./response.helper');

var redemptionMysqlSettings = config.get('redemptionMysql');


function createConnection() {
    return mysql.createConnection(redemptionMysqlSettings);
}

module.exports = {
    storedProcedures: {
        usersGet: "CALL " + redemptionMysqlSettings.database + ".sp_users_get();",
        usersGetById: "CALL " + redemptionMysqlSettings.database + ".sp_users_getbyid(?);"
    },
    executeQuery: function (statement, params) {
        return createConnection()
            .then(function (conexion) {
                var result = conexion.query(statement, params);
                conexion.end();
                return result;
            })
            .then(function (result) {
                return result[0];
            }, function (error) {
                throw error;
            });
    },
    handleError: function(res, error) {
        console.error(error);
        responseHelper.respond(
            res,
            500, 
            'An error occurred while executing a query on the server',
            {
                errno: error.errno,
                message: error.sqlMessage
            });
    }
}
