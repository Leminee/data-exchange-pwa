const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const app = express();    
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
})
 
app.get("/", (req, res) => { 
res.sendFile("/Users/lem/Documents/Projekte/pwa/index.html"); 

});

app.post("/register", async (req, res) => {   
  const email = req.body.email-reg; 
  const username = req.body.username-reg; 
  const password = req.body.password-reg; 
  bcrypt.hash(password, saltRounds, (err, hash) => { 
    if (err) {
      console.log(err);
    }  
    db.query( 
      "INSERT INTO user (e_mail, username, password_hash, profil_pic_path, token) VALUES (?,?,?, NULL, NULL)",
      [email,username, hash],
      (err, result) => {
        console.log(err);
      }
    );
  });
});

app.listen(3001, ()=> { 

});