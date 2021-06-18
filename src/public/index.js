const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const app = express();   
const path = require('path');   
const session = require('express-session');
const bcrypt = require('bcrypt'); 
const bodyParser = require('body-parser'); 


const saltRounds = 10; 
const twoHours = 1000 * 60 * 60 * 2
const sessionID = 'sid'
app.use(express.json());  
app.use(cors());   
app.use(express.static(__dirname + '/static'));
app.use(express.urlencoded({ extended: false }))
app.use(bodyParser.urlencoded({ extended: true }))


app.use(session( {
  name: sessionID,
  resave: false,
  saveUninitialized : false,
  secret: "Lemine",
  cookie: {
    maxAge: twoHours,
    sameSite: true, 
  },
}),
);


var db = mysql.createConnection({
  host     : 'localhost',
  user     : 'mel',
  password : '36177436',
  database : 'pwa'
}); 


const redirectLogin = (req, res, next) => {
  if (!req.session.id_user) {
    res.redirect("/login");
  } else {
    next()
  }
}

const redirectUser = (req, res, next) => {
  if (req.session.id_user) {
    res.redirect("/user-profil/profil");
  } else {
    next()
  }
}


db.connect(function(error) { 
    if (!!error) { 
      console.log('Verbindungsfehler');
    }  
    else { 
      console.log("db " + db.state);
    }
})


 
app.get("/", (req, res) => { 
  const { id_user } = req.session
  console.log(req.session + " Landingpage");
res.sendFile(path.join(__dirname, "/../../index.html")); 
}); 

app.get("/login", redirectUser, (req, res) => { 
  console.log(req.session + " login");
  res.sendFile(path.join(__dirname, "/../html/login.html"));  
}); 


app.get("/about-us", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/about-us.html"));  
}); 


app.get("/download/:id_file", (req, res) => { 
  id_file = req.params.id_file;
  console.log(id_file);
  res.sendFile(path.join(__dirname, "/../html/download.html"));  
}); 


app.get("/download/:id_file/d", redirectLogin, (req, res) => { 
  const id_file = req.params.id_file;
  let sql = `SELECT file_name FROM file WHERE id_file = ${id_file}`;
  let query = db.query(sql, (err, result) => {
    if(err) throw err;
     res.send(result);
  }); 
}); 

app.get("/download/:id_file/download", redirectLogin, (req, res) => { 
   
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
  console.log(req.session + " faq");
  res.sendFile(path.join(__dirname, "/../html/faq.html"));  
}); 

app.get("/pic-maker", redirectLogin, (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/pic-maker.html"));  
}); 

app.get("/upload-form", redirectLogin, (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/upload-form.html"));  
});

app.get("/user-profil/profil/data", (req, res) => {
  res.sendFile(path.join(__dirname, "/../html/show_data.html"));
});

app.get("/user-profil/profil", redirectLogin, (req, res) => {
  console.log(req.session.id_user)
  res.sendFile(path.join(__dirname, "/../html/user-profil.html"));  
});

app.get("/user-profil/profil/:id_user/edit", redirectLogin, (req, res) => {
  res.sendFile(path.join(__dirname, "/../html/profil-edit.html"));
});

app.get("/user-profil", redirectLogin, (req, res) => {
  let sql =`SELECT user.e_mail, user.username, user.profil_pic_path, (SELECT COUNT(file.id_file) FROM file WHERE file.id_user = '${req.session.id_user}') AS 'id_file', (SELECT COUNT(folder.id_folder) FROM folder WHERE folder.id_user = '${req.session.id_user}') AS 'id_folder' FROM user WHERE user.id_user = '${req.session.id_user}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
    res.send(result);
  });  
});


app.get("/show_data", redirectLogin, (req, res) => {
  let sql =`SELECT id_file, id_format, file_name, file_size, id_folder FROM file WHERE id_user = '${req.session.id_user}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
    res.send(result);
  });
});

app.get('/edit-profil', redirectLogin, (req, res) => {
  res.redirect('/user-profil/profil/'+ req.session.id_user + '/edit');
});


app.get("/voice-maker", redirectLogin, (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/voice-maker.html"));  
}); 

app.get("/voice-maker", redirectLogin, (req, res) => { 
  audio_url = URL.createObjectURL(req.params.blob);
});




app.post("/register", redirectUser, async (req, res) => {
  const {email, username, password } = req.body  
  bcrypt.hash(password, saltRounds, (err, hash) => { 
    if (err) {
      console.log(err);
    }  
    db.query( 
      "INSERT INTO user (e_mail, username, password_hash) VALUES (?,?,?)",
      [email, username, hash],
      (err, result) => {
        if (err) {
          
          console.log(err);
        } 
        req.session.id_user = result.insertId;
        res.redirect("/user-profil/profil");
      }
    );
  });  
}); 

app.post('/login', async (req, res)=> {
  const email = req.body.email_login;
  const password = req.body.password_login;
  var hash = await bcrypt.hashSync(password, saltRounds);
  const dcryptPassword =  await bcrypt.compareSync(password, hash);
  console.log(dcryptPassword)
  if (email && dcryptPassword) {
     var dbResult = db.query('SELECT e_mail, id_user FROM user WHERE e_mail = ? AND password_hash != ?', [email, dcryptPassword], 
      (error, results)=> {
          if (results.length > 0 ) {
              req.session.id_user = results[0].id_user;
              res.redirect('/user-profil/profil');
          } else {
              console.log('Incorrect Email and/or Password!');
          }           
          res.end();
      });
  } else {
      res.send('Please enter Username and Password!');
      res.end();
  }
});
/*
app.post("/login", async (req, res) => {   
  const  email_login = req.body.email_login;
  const password_login = req.body.password_login;
  bcrypt.hash(password_login, saltRounds, (err, hash) => { 
    if (err) {
      console.log(err);
    }    
    if (email_login && password_login) {
      db.query('SELECT email, id_user FROM user where email = ? AND password = ?', [email_login, password_login], function(error, results, fields) {
        if (results.length > 0) {

          req.session.id_user = results[0].id_user;
          return res.redirect('/user-profil/profil');
        } else {
          response.send('Error, login failed');
        }
        console.log("nicht sicher was hier ist 1")
        res.redirect('/login');			
        response.end();
      });
    } 
  });
});
*/

app.post('/logout', redirectLogin, (req, res) => {
  req.session.destroy(err => {
    if(err) {
      return res.redirect('/user-profil/profil')
    }
    console.log(sessionID)
    res.clearCookie(sessionID)
    res.redirect("/");
  });
})




app.post('/profil-edit/:id_user', (req, res) => {
  var e_mail = req.body.e_mail;
  var username = req.body.username;
  let sql = `UPDATE user SET e_mail = '${e_mail}', username = '${username}' WHERE id_user = '${req.session.id_user}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
  });
  res.redirect('/user-profil/profil');
  res.end();
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







app.listen(3001, ()=> {

});  
