const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const app = express();
const upload = require('express-fileupload');   
const path = require('path');   
const session = require('express-session');
const bcrypt = require('bcrypt'); 
const bodyParser = require('body-parser'); 
const jwt = require('jsonwebtoken');
const ejs = require('ejs'); 
const uuid = require('uuid').v4; 
const multer = require('multer');
const nodemailer = require("nodemailer"); 




const saltRounds = 10; 
const twoHours = 1000 * 60 * 60 * 2
const sessionID = 'sid'


app.use(express.json());  
app.use(cors());   
app.use(express.static(__dirname + '/static'));
app.use(express.static('/../../server'));
app.use(express.urlencoded({ extended: false }));
app.use(bodyParser.urlencoded({ extended: true })); 
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
 
app.set('view engine', 'ejs'); 
 
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
  res.render('voice-maker');
});


app.get("/", (req, res) => { 
  const { id_user } = req.session
  res.sendFile(path.join(__dirname, "/../../index.html")); 
}); 

app.get("/login", redirectUser, (req, res) => {  
  res.render('login');
}); 

app.get("/about-us", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/about-us.html"));  
}); 

app.get("/download/:id_file", (req, res) => {   
  res.render('download');
}); 

app.get("/faq", (req, res) => { 
  res.sendFile(path.join(__dirname, "/../html/faq.html"));  
}); 

app.get("/pic-maker", redirectLogin, (req, res) => {  
  res.render('pic-maker');
}); 

app.get("/upload-form", redirectLogin, (req, res) => { 
      res.render('upload-form'); 
});

app.get("/user-profil/profil/data", (req, res) => {
  res.sendFile(path.join(__dirname, "/../html/show-data.html"));
});

app.get("/user-profil/profil", redirectLogin, (req, res) => { 
  res.render('user-profil');
       
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
  //res.sendFile(path.join(__dirname, "/../html/voice-maker.html"));   
  res.render('voice-maker')
});  

app.get("/upload-form", redirectLogin, (req, res) => { 
  //res.sendFile(path.join(__dirname, "/../html/upload-form.html"));  
  res.render('upload-form');
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

app.get("/show-data/file/:file_name", (req, res) => {
  let sql =`SELECT id_file, id_format, file_name, file_size, id_folder, id_user, file_path FROM file WHERE file_name = '${file_name}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
    res.send(result);
  })
}); 

app.get("/show-data/file/:file_name/download", (req, res) => { 
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


app.get("/show-data", redirectLogin, (req, res) => {
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


app.post("/register", redirectUser, async (req, res) => {
  const {email, username, password } = req.body;  
  const errors = [];
  bcrypt.hash(password, saltRounds, (err, hash) => { 

    if (err) {
      console.log(err);
    }    
     
    db.query( 
      "SELECT e_mail FROM user WHERE e_mail = ?",
      [email],
      (err, result) => {
        if (err) {
          
          console.log(err);
        } 
        if (result.length > 0) { 
  
         errors.push({message:  "E-Mail-Adresse existiert bereits!"}); 
         res.render('login', {errors});
        
        } 
        else { 
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
        }
      }
    );    
  });  
}); 

app.post('/login', async (req, res)=> {
//Information the user typed in
  const email = req.body.email_login;
  const password = req.body.password_login; 
  const errors = [];
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
          } 
                   
      
      });
  } else {

    errors.push({message: "Leider ist dein eingegebenes Passwort falsch. Bitte überprüfe es noch einmal."}); 
    res.render('login', {errors});
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
  const errors = [];  
  const succ = [];
  let sql = `SELECT e_mail, password_hash, id_user FROM user WHERE e_mail = '${emailForgot}'`;
  let query = db.query(sql, (err,result) => { 

    if (result.length < 1) {     
 
      errors.push({message: "E-Mail-Adresse nicht erkannt!"}); 
      res.render('login', {errors});
    } 

    else {

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
      from: '"Project G6" <NOREPLY@NOREPLY.de>', // sender address
      to: emailForgot, // list of receivers
      subject: "Passwort zurücksetzen", // Subject line
      text: "Link zum Zurücksetzen Deines Passworts: " + link, // plain text body
    }
    // send mail with defined transport object
    let info = transporter.sendMail(msg);

      succ.push({message: "Es wurde soeben eine E-Mail zum Zurücksetzen des Passworts versendet!"}); 
      res.render('login', {succ}); 
   
  }
  })
})

app.post('/reset-password/:id_user/:token', (req, res) => {
  const id_user = req.params.id_user;
  const token = req.params.token;
  const password = req.body.password; 
  const succ = []; 
  const errors = [];
  const password2 = req.body.password2;
  let sql = `SELECT id_user, password_hash FROM user WHERE id_user = '${id_user}'`;
  let query = db.query(sql, (err,result) => {
    if (id_user != result[0].id_user) {
      res.send("User with this ID not found")
      return;
    }
    const secret = JWT_SECRET + result[0].password_hash
    try {
      const payload = jwt.verify(token, secret)
    
      if (password != password2) { 
 
        errors.push({message: "Passwörter stimmen nicht überein!"}); 
        res.render('reset-password', {errors}); 
      } 
      else {
      bcrypt.hash(password, saltRounds, (err, hash) => { 
        if (err) {
          console.log(err);
        }
      let sqlpw = `UPDATE user SET password_hash = '${hash}' WHERE id_user = '${id_user}'`;
      let query = db.query(sqlpw, (err,result) => {
       
        succ.push({message: "Passwort wurde erfolgreich geändert. Logge dich ein!"}); 
        res.render('login', {succ});   
      

        if(err) throw err;
      });
    });
    }} catch (error) {
      console.log(error.message)
      res.send(error.message)
    }
}) 
  
})
app.post('/profil-edit/email/:id_user', (req, res) => { 
  var e_mail = req.body.email;   
  const succ = []; 

  let sql = `UPDATE user SET e_mail = '${e_mail}' WHERE id_user = '${req.session.id_user}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
  });   
   
        succ.push({message: "E-Mail-Adresse wurde erfolgreich bearbeitet!"}); 
        res.render('user-profil', {succ});   
});


app.post('/profil-edit/username/:id_user', (req, res) => {
  var username = req.body.username; 
  const succ = [];
  let sql = `UPDATE user SET username = '${username}' WHERE id_user = '${req.session.id_user}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
  });    
    
  succ.push({message: "Username wurde erfolgreich bearbeitet!"}); 
  res.render('user-profil', {succ}); 
});

 
 
app.post('/profil-edit/pass/:id_user', async(req, res) => {
  var password = req.body.password;  

  const hashedPassword = await new Promise((resolve, reject) => {
    bcrypt.hash(password, saltRounds, function(err, hash) {
      if (err) reject(err)
      resolve(hash)
    }); 
  })
  const succ = [];
  let sql = `UPDATE user SET password_hash = '${hashedPassword}' WHERE id_user = '${req.session.id_user}'`;
  let query = db.query(sql, (err,result) => {
    if(err) throw err;
  });
  succ.push({message: "Passwort wurde erfolgreich bearbeitet!"}); 
  res.render('user-profil', {succ}); 
}); 

app.post('/show-data', (req, res) => {
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
    var fromInput = req.body.fromInput;
    var toInput = req.body.toInput;
    var downloadLink = req.body.dLink;


    console.log(fromInput);
    console.log(toInput);
    console.log(downloadLink);
    


    // create reusable transporter object using the default SMTP transport
    let transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'ProjectG6.2021@gmail.com',
        pass: 'ABC123!?',
      }
    });
  

    const msg ={
      from: fromInput + '<foo@example.com>', // sender address
      to: toInput, // list of receivers
      subject: "Downloadlink", // Subject line
      text: "Hier ist Ihr Downloadlink:"+ downloadLink, // plain text body
    }

    // send mail with defined transport object
    let info = await transporter.sendMail(msg);

    res.send('Email sent!');
})



const storage = multer.diskStorage({
  destination: (req, file, cb) => {
      cb(null, 'up/')
  }, 
  filename: (req, file, cb) => {
      const { originalname } = file;

      cb(null, originalname);
  }
})
const up = multer({ storage });  
app.use(express.static('public'))

app.post('/up', up.single('upload'), (req, res) => {
  return res.json({ status: '201'});
});

app.listen(3001, ()=> {

});