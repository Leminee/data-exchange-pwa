const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const app = express();   
const path = require('path');  
/*var parser = require("body-parser"); */
/*var urlParser = parser.urlencoded({extended:false}); */

const bcrypt = require("bcrypt"); 
const saltRounds = 10; 


app.use(express.json());  
app.use(cors());   
app.use(express.static(__dirname + '/static'));

app.use(express.urlencoded({ extended: false }))


var db = mysql.createConnection({
  host     : 'localhost',
  user     : 'hkoyun',
  password : '12345',
  database : 'pwa'
});

db.connect(function(error) { 
    if (!!error) { 
      console.log('Verbindungsfehler');
    } 
})
 
app.get("/", (req, res) => { 
res.sendFile(path.join(__dirname, "/../../index.html")); 
}); 

app.get("/login", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/login.html"));  
}); 


app.get("/about-us", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/about-us.html"));  
}); 

app.get("/admin-controller", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/admin-controller.html"));  
}); 

app.get("/admin-login", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/admin-login.html"));  
}); 

app.get("/download", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/download.html"));  
}); 

app.get("/faq", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/faq.html"));  
}); 

app.get("/pic-maker", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/pic-maker.html"));  
}); 

app.get("/upload-form", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/upload-form.html"));  
}); 

app.get("/user-profil", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/user-profil.html"));  
}); 

app.get("/voice-maker", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/voice-maker.html"));  
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
  res.send
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