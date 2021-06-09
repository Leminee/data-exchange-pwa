const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const app = express();     
/*var parser = require("body-parser"); */
/*var urlParser = parser.urlencoded({extended:false}); */

const bcrypt = require("bcrypt"); 
const saltRounds = 10; 


app.use(express.json());  
app.use(cors());   
app.use(express.static(__dirname + '/static'));

app.use(express.urlencoded({ extended: false }))


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

app.get("/src/html/login.html", (req, res) => { 
res.sendFile("/Users/lem/Documents/Projekte/pwa/src/html/login.html");  
});  

app.post("/src/html/login.html", async (req, res) => {   
  const email = req.body.email; 
  const username = req.body.username; 
  const password = req.body.password; 
  bcrypt.hash(password, saltRounds, (err, hash) => { 
    if (err) {
      console.log(err);
    }  
    db.query( 
      "INSERT INTO user (e_mail, username, password_hash) VALUES (?,?,?)",
      [email,username, hash],
      (err, result) => {
        console.log(err); 
    
      }
    );
  }); 
  res.sendFile("/Users/lem/Documents/Projekte/pwa/src/html/login.html");
}); 

app.post("/src/html/login.html", async (req, res) => {   
  const email = req.body.email; 
  const username = req.body.username-login; 
  const password = req.body.password-login; 
  bcrypt.hash(password, saltRounds, (err, hash) => { 
    if (err) {
      console.log(err);
    }    

    if (username && password) {
      connection.query('SELECT username FROM user where username = ? AND password = ?', [username, password], function(error, results, fields) {
        if (results.length > 0) {
        
          response.redirect('/src/html/user-profil.html');
        } else {
          response.send('Error');
        }			
        response.end();
      });
    } else {
      response.send('?');
      response.end();
    }
  });
});

app.listen(3001, ()=> { 

}); 