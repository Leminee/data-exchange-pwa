var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'pwa'
}); 

connection.connect(function(err){
if(!err) {
    console.log("connected");
} else {
    console.log("Verbindungsfehler");
}
});
module.exports = connection;