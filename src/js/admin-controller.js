const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const app = express();  

app.listen('3000', () => {
    console.log('Server started on port 3000');
});



/*  
var parser = require("body-parser"); 
var urlParser = parser.urlencoded({extended:false});  

const bcrypt = require("bcrypt"); 
const saltRounds = 10;

app.use(express.json());  
app.use(cors()); 


const db = mysql.createConnection({
host: "localhost", 
user: "mel", 
password: "36177436",
database: "pwa",
});  
 
db.connect(function(error) { 
    if (!!error) { 
      console.log('Verbindungsfehler');
    } 
})*/