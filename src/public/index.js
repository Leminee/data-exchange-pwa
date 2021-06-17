const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const app = express();   
const path = require('path');   

const bcrypt = require("bcrypt"); 
const saltRounds = 10; 

app.use(express.json());  
app.use(cors());   
app.use(express.static(__dirname + '/static'));

app.use(express.urlencoded({ extended: false }))

var id_format;
let id_file;
var id_folder;
var audio_url;
var id_user;
var e_mail;
var username;


var db = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'pwa'
});

db.connect(function(error) { 
    if (!!error) { 
      console.log('Verbindungsfehler');
    }  
 
    else { 
      console.log("db " + db.state);
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


app.get("/download/:id_file", (req, res) => { 
  id_file = req.params.id_file;
  console.log(id_file);
  res.sendFile(path.join(__dirname, "/../html/download.html"));  
}); 


app.get("/download/:id_file/d", (req, res) => { 
  id_file = req.params.id_file;
  console.log(id_file);
  let sql = `SELECT file_name, id_file FROM file WHERE id_file = ${id_file}`;
  let query = db.query(sql, (err, result) => {
    if(err) throw err;
     res.send(result);
  }); 
}); 

app.get("/download/:id_file/download", (req, res) => { 
   
}); 


app.post('/download/:id_file', (req, res) => {
  console.log(id_file);
  /*
  let sql = `SELECT file_name FROM file WHERE id_file = ${id_file}`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
  });
  */
  res.sendFile(path.join(__dirname, "/../html/download.html"));  
  res.end();
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

app.get("/user-profil/profil/:id_user", (req, res) => {
  res.sendFile(path.join(__dirname, "/../html/user-profil.html"));  
});

app.get("/user-profil/profil/:id_user/edit", (req, res) => {
  res.sendFile(path.join(__dirname, "/../html/profil-edit.html"));
});

app.get("/user-profil/:id_user", (req, res) => {
  id_user = req.params.id_user;
  console.log(id_user);
  let sql =`SELECT id_user, e_mail, username, profil_pic_path FROM user WHERE id_user = '${id_user}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
    res.send(result);
    console.log(result);
  });
});


app.get('/edit-profil', (req, res) => {
  id_user = req.params.id_user;
  res.redirect('/user-profil/profil/'+ id_user + '/edit');
});


app.post('/profil-edit/:id_user', (req, res) => {
  id_user = req.params.id_user;
  e_mail = req.body.e_mail;
  username = req.body.username;
  let sql = `UPDATE user SET email = '${e_mail}', username = '${username}' WHERE id = '${id_user}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
  });
  res.redirect('/user-profil/profil/' + id_user);
  res.end();
});









app.get("/voice-maker", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/voice-maker.html"));  
}); 

app.get("/voice-maker", (req, res) => { 
  audio_url = URL.createObjectURL(req.params.blob);
});



app.post("/voice-maker", (req, res) => {
  id_user = 2;
  id_format = 3;
  file_name = req.body.file_name;
  file_size = req.body.file_size;
  file_path = req.body.file_path;

  let sql = `INSERT INTO file (id_user, id_format, file_name, file_size, file_path) VALUES ('${id_user}', '${id_format}', '${file_name}', '${file_size}', '${file_path}')`;
  let query = db.query(sql, (err, res) => {
    if (err) throw err;
    console.log(file_name);
    console.log(file_size);
    console.log(file_path);
  });
  res.redirect('/voice-maker');
  res.end();
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
