const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const bcrypt = require("bcrypt"); 
const parser = require("body-parser"); 
const path = require('path');
const saltRounds = 10;
const session = require('express-session');

 
const app = express();    
const twoHours = 1000 * 60 * 60 * 2
const sessionID = 'sid'
app.use(express.json());  
app.use(cors());   
app.use(express.static(__dirname + "/.."));
app.use(express.urlencoded({ extended: false }))
app.use(parser.urlencoded({ extended: false }))
var id_user;
var upload_limit;

app.use(session( {
    name: sessionID,
    resave: false,
    saveUninitialized : false,
    secret: "Lemine_admin",
    cookie: {
      maxAge: twoHours,
      sameSite: true, 
    },
  }),
  );

const db = mysql.createConnection({
host: 'localhost', 
user: 'mel', 
password: '36177436',
database: 'pwa',
});

const redirectLogin = (req, res, next) => {
    if (!req.session.id_admin) {
      res.redirect("/");
    } else {
      next()
    }
  };
  
  const redirectUser = (req, res, next) => {
    if (req.session.id_admin) {
      res.redirect("/home");
    } else {
      next()
    }
  };



db.connect(function(error) { 
    if (error) { 
      console.log(error.msg);
    } else {console.log('db ' + db.state)}
  });
  

//list of all users
app.get('/', redirectUser, (req, res) => {
    res.sendFile(path.join(__dirname, "/../../../html/admin-login.html"));
});


//list of all users
  app.get('/home', redirectLogin, (req, res) => {
    res.sendFile(path.join(__dirname, "/../../../html/admin-controller.html"));
});


//list of a single user
app.get('/user/show/:id_user', redirectLogin, (req, res) => {
    res.sendFile(path.join(__dirname, "/../../../html/admin-controller-single.html"));
});


//get all users from database
app.get('/user', redirectLogin, (req, res) => {
    let sql = 'SELECT `id_user`, `e_mail`, `upload_limit` FROM user';
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});
  

//get a user from database by id
app.get('/user/:id_user', redirectLogin, (req, res) => {
    let sql = `SELECT id_user, e_mail, upload_limit FROM user WHERE id_user = '${id_user}'`;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

//get all the files from a single user
app.get('/user/:id_user/files', redirectLogin, (req, res) => {
    let sql = `SELECT id_user, id_file, id_folder, format, file_name, file_size, uploaded_on FROM file WHERE id_user = '${id_user}'`;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
})


//take id_user from html and redirect 
app.post('/user', (req, res) => {
    id_user = req.body.id_user;
    res.redirect('/user/show/' + id_user);
}); 


//update user Upload limit for all user
app.post('/update_user', (req, res) => {
    upload_limit = req.body.upload_limit;
    let sql = `UPDATE user SET upload_limit = '${upload_limit}'`;
    let query = db.query(sql, (err, res) => {
        if(err) throw err;
    });
    res.redirect('/');
    res.end()
});


//update user Upload limit for a single user
app.post('/user/show/:id_user/update_user', (req, res) => {
    upload_limit = req.body.upload_limit;
    let sql = `UPDATE user SET upload_limit = '${upload_limit}' WHERE id_user = '${id_user}'`;
    let query = db.query(sql, (err, res) => {
        if(err) throw err;
    });
    res.redirect('/user/show/' + id_user);
    res.end()
});


app.post('/login', (req, res)=> {
  const email = req.body.email;
  const password = req.body.password;
  
  if (email && password) {
     var dbResult = db.query('SELECT e_mail_admin, id_admin FROM admin WHERE e_mail_admin = ? AND password_hash_admin = ?', [email, password], 
      (error, results)=> {
          if (results.length > 0 ) {
              req.session.id_admin = results[0].id_admin;
              res.redirect('/home');
          } else {
              console.log('Incorrect E-mail and/or Password!');
          }           
          res.end();
      });
  } else {
      res.send('Please enter E-mail and Password!');
      res.end();
  }
});

    
app.post('/logout', redirectLogin, (req, res) => {
    req.session.destroy(err => {
    if(err) {
        return res.redirect('/')
    }
    res.clearCookie(sessionID)
    res.redirect("/");
    });
}); 


app.post('/deleteFile/:file_name', redirectLogin, (req, res) => {
  file_name = req.body.deleteFiles
  let sql = `DELETE FROM file WHERE file_name = '${file_name}'`;
  let query = db.query(sql, (err,result) => {
    console.log(result)
    if(err) throw err; 
  });
  res.redirect("/user/show/:user_id")
  res.end()
})


app.listen(3002, () => console.log('listening on port 3002')); 