const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const app = express();
const upload = require('express-fileupload');   
const path = require('path');   
const session = require('express-session');
const bcrypt = require('bcrypt'); 
const bodyParser = require('body-parser'); 
const jwt = require('jsonwebtoken')

const nodemailer = require("nodemailer");

const saltRounds = 10; 
const twoHours = 1000 * 60 * 60 * 2
const sessionID = 'sid'
app.use(express.json());  
app.use(cors());   
app.use(express.static(__dirname + '/static'));
app.use(express.static('/../../server'));
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

const JWT_SECRET = 'LemineWebToken'


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


//Upload MP3 File to Server Folder
app.get('/upload-audio', (req, res) => {
  res.sendFile(__dirname + '/../html/voice-maker.html')
});

app.post('/upload-audio', (req, res) => {
  if (req.files) {
    console.log(req.files)
    var file = req.files.file
    filename = file.name
    console.log(filename);

    file.mv('./server/' + filename, function (err) {
      if (err) {
        res.send(err)
      } else {
        res.send("File uploaded");
      }
    });
  }
});



 
app.get("/", (req, res) => { 
  const { id_user } = req.session
  res.sendFile(path.join(__dirname, "/../../index.html")); 
}); 

app.get("/login", redirectUser, (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/login.html"));  
}); 

app.get("/about-us", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/about-us.html"));  
}); 

app.get("/download/:id_file", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/download.html"));  
}); 

app.get("/faq", (req, res) => { 
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
  res.sendFile(path.join(__dirname, "/../html/user-profil.html"));  
});

app.get("/user-profil/profil/:id_user/edit", redirectLogin, (req, res) => {
  res.sendFile(path.join(__dirname, "/../html/profil-edit.html"));
});

app.get('/edit-profil', redirectLogin, (req, res) => {
  res.redirect('/user-profil/profil/'+ req.session.id_user + '/edit');
});

app.get('/file-comment/:file_name', redirectLogin, (req, res) => {
  res.sendFile(path.join(__dirname, "/../html/file-comment.html"));
});

app.get("/voice-maker", redirectLogin, (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/voice-maker.html"));  
}); 

app.get(`/reset-password/:id_user/:token`,(req, res) => {
  res.sendFile(path.join(__dirname, "/../html/reset-password.html"));
});



app.get("/user-profil", redirectLogin, (req, res) => {
  let sql =`SELECT user.e_mail, user.username, user.profil_pic_path, (SELECT COUNT(file.id_file) FROM file WHERE file.id_user = '${req.session.id_user}') AS 'id_file', (SELECT COUNT(folder.id_folder) FROM folder WHERE folder.id_user = '${req.session.id_user}') AS 'id_folder' FROM user WHERE user.id_user = '${req.session.id_user}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
    res.send(result);
  });  
});

app.get("/show_data/file/:file_name", (req, res) => {
  let sql =`SELECT id_file, id_format, file_name, file_size, id_folder, id_user, file_path FROM file WHERE file_name = '${file_name}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
    res.send(result);
  })
}); 

app.get("/show_data/file/:file_name/download", (req, res) => { 
  let sql = `SELECT id_format, file_name, id_user FROM file WHERE file_name = '${file_name}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
    id_userString = result[0].id_user.toString();
    id_formatString = result[0].id_format.toString();
    file_nameString = result[0].file_name.toString();
  res.download(path.join(__dirname, '/../../server/', id_userString, "/",  id_formatString,"/", file_nameString));
  
  })
}); 

//Sharelink
app.get("/download/:a/:b/:c", (req, res) => {
  let id_user = req.params.a;
  let id_format = req.params.b;
  let file_name = req.params.c;
  res.download(path.join(__dirname, '/../../server/', id_user, "/",  id_format,"/", file_name));
  }); 


app.get("/show_data", redirectLogin, (req, res) => {
  let sql =`SELECT file.id_file, file.file_name, file.id_format, file.file_size, file.id_folder, file.comment FROM file WHERE id_user = '${req.session.id_user}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
    res.send(result);
  });
});

app.get("/file-comment/:file_name/comment", redirectLogin, (req, res) => {
  let sql =`SELECT file_name, comment FROM file WHERE file_name ='${file_name}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
    res.send(result);
  })
});



app.get("/voice-maker", redirectLogin, (req, res) => { 
  audio_url = URL.createObjectURL(req.params.blob);
});


app.get('/reset-password/:id_user/:token', (req, res) => {
  const id_user = req.params.id_user;
  const token = req.params.token;
  let sql = `SELECT id_user, password_hash FROM user WHERE id_user = '${id_user}'`;
  let query = db.query(sql, (err,result) => {
    if (id_user != result[0].id_user) {
      res.send("User with this ID not found")
      return
    }
    const secret = JWT_SECRET + result[0].password_hash
    try {
      const payload = jwt.verify(token, secret)
      res.redirect(`/reset-password/${id_user}/${token}`)
    } catch (error) {
      console.log(error.message);
      res.send(error.message);
    }
  })
})




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
        res.redirect("/login");
      }
    );
  });  
}); 

app.post('/login', async (req, res)=> {
//Information the user typed in
  const email = req.body.email_login;
  const password = req.body.password_login;
//Take the password from the typed in e-mail
  var queryPassword = db.query('SELECT password_hash FROM user WHERE e_mail = ?', [email], (error, result3) => {
  hashDBPassword = result3[0].password_hash
//compare the hashed password from the db and the password the user typed in
  const dcryptPassword =  bcrypt.compareSync(password, hashDBPassword);
  if (email && dcryptPassword) {
//if there is an e-mail and the password fits, give the information
     var dbResult = db.query('SELECT e_mail, id_user FROM user WHERE e_mail = ? AND password_hash != ?', [email, dcryptPassword], 
      (error, results)=> {
          if (results.length > 0 ) {
//put the user id equal with the id from the session
              req.session.id_user = results[0].id_user;
              res.redirect('/user-profil/profil');
          } else {
//wrong passowrd or e-mail
              console.log('Incorrect E-mail and/or Password!');
          }           
          res.end();
      });
  } else {
//no e-mail or password typed in
      res.send('Please enter E-mail and Password!');
      res.end();
  }
});
});


app.post('/logout', redirectLogin, (req, res) => {
  req.session.destroy(err => {
    if(err) {
      return res.redirect('/user-profil/profil')
    }
    res.clearCookie(sessionID)
    res.redirect("/");
  });
})


app.post('/forgot-password',  (req, res) => {
  const emailForgot = req.body.forgotEmail;
  let sql = `SELECT e_mail, password_hash, id_user FROM user WHERE e_mail = '${emailForgot}'`;
  let query = db.query(sql, (err,result) => { 

    if (result.length < 1) {  
      res.send('E-Mail-Adresse nicht registiert!')
      return;
    }

    const secret = JWT_SECRET + result[0].password_hash
    const payload = {
      email: result[0].e_mail,
      id: result[0].id_user
    }
    const token = jwt.sign(payload, secret, {expiresIn: '15m'})
    const link = `http://localhost:3001/reset-password/${result[0].id_user}/${token}`
    let transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'ProjectG6.2021@gmail.com',
        pass: 'ABC123!?',
      }
    });
    const msg ={
      from: '"CoinFlip" <NOREPLY@NOREPLY.de>', // sender address
      to: emailForgot, // list of receivers
      subject: "Passwort Vergessen Link", // Subject line
      text: "Dieser Link ist nur für 15min Aktiv. Bitte klicke hier um ein neues Passwort einzutragen:" + link, // plain text body
    }
    // send mail with defined transport object
    let info = transporter.sendMail(msg);

    res.redirect("/login");
  })
})

app.post('/reset-password/:id_user/:token', (req, res) => {
  const id_user = req.params.id_user;
  const token = req.params.token;
  const password = req.body.password
  const password2 = req.body.password2
  let sql = `SELECT id_user, password_hash FROM user WHERE id_user = '${id_user}'`;
  let query = db.query(sql, (err,result) => {
    if (id_user != result[0].id_user) {
      res.send("User with this ID not found")
      return
    }
    const secret = JWT_SECRET + result[0].password_hash
    try {
      const payload = jwt.verify(token, secret)
      //irgednwie kontrollieren dass die beiden passwörter übereinstimmen if password == password2 oder so ?
      bcrypt.hash(password, saltRounds, (err, hash) => { 
        if (err) {
          console.log(err);
        }
      let sqlpw = `UPDATE user SET password_hash = '${hash}' WHERE id_user = '${id_user}'`;
      let query = db.query(sqlpw, (err,result) => {
        res.send("Passwort erfolgreich geändert!")
        if(err) throw err;
      });
    });
    } catch (error) {
      console.log(error.message)
      res.send(error.message)
    }
})
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



app.post('/show_data', (req, res) => {
  file_name = req.body.file_nameDownloadSelect;
});

app.post('/file-comment', (req, res) => {
  file_name = req.body.file_comment;
  res.redirect("/file-comment/" + file_name)
});

app.post('/file-comment/write', (req, res) => {
  const comment = req.body.comment;
  console.log(comment);
  console.log(file_name);
  let sql = `UPDATE file SET comment = '${comment}' WHERE file_name = '${file_name}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
    res.redirect("/user-profil/profil/data")
  });
})




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


//NodeMailer
app.post('/mail', async (req, res) => {

  //FLO WARUM GEHT DAS NICHT? AM I DUMBOOOO?
    var fromInput = req.body.fromInput;
    var toInput = req.body.toInput;
    var link = req.body.dLink;


    console.log(fromInput);
    console.log(toInput);
    console.log(link);


    // create reusable transporter object using the default SMTP transport
    let transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'ProjectG6.2021@gmail.com',
        pass: 'ABC123!?',
      }
    });
  

    const msg ={
      from: '"CoinFlip" <foo@example.com>', // sender address
      to: "calvinkluk@yahoo.de", // list of receivers
      subject: "Download Link", // Subject line
      text: "Here is your Downloadlink:", // plain text body
    }

    // send mail with defined transport object
    let info = await transporter.sendMail(msg);

    res.send('Email sent!');
})

















app.listen(3001, ()=> {

});