const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const bcrypt = require("bcrypt"); 
const parser = require("body-parser"); 
const saltRounds = 10;

const app = express();    

app.use(express.json());  
app.use(cors()); 
app.use(express.static(__dirname + '/static'));
app.use(express.urlencoded({ extended: false }));
app.use(parser.urlencoded({ extended: false }));
app.use(parser.json());

const db = mysql.createConnection({
host: "localhost", 
user: "root", 
password: "",
database: "pwa",
});


app.listen(3001, () => console.log('listening on port 3001'));




db.connect(function(error) { 
    if (error) { 
      console.log(error.msg);
    } else {console.log('db ' + db.state)}
  });
  

//get all users from database
app.get('/user', (req, res) => {
    let sql = 'SELECT `id_user`, `e_mail`, `upload_limit` FROM user';
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});
  

//get a user from database by id
app.get('/user/:id_user', (req, res) => {
    let sql = `SELECT id_user, e_mail, upload_limit FROM user WHERE id_user = ${req.params.id_user}`;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result);
    });
});

//take id_user from html and redirect 
app.post('/user', (req, res, next) => {
    var id_user = req.body.id_user;
    res.redirect('/user/' + id_user);
});



//update user Upload limit
app.get('/updateuser/:id_user', (req, res) => {
    let newUploadLimit = '55';
    let sql = `UPDATE user SET upload_limit = '${newUploadLimit}' WHERE id_user = ${req.params.id_user}`;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        res.send('user updated');
    });
});


