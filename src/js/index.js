const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const app = express();  


app.use(express.json());  
app.use(cors());

const db = mysql.createConnection({
user: "root", 
host: "localhost", 
password: "admin",
database: "app",

});  

/*app.post('/index.html', (req, res) => { 
  db.query("INSERT INTO user (id_user, e_mail, username, password, profile_pic_url, token, registered_on) VALUES (NULL, ?, ?, ?, NULL, NULL, CURRENT_TIMESTAMP)", 
  [username, password], 
  (err, result) => { 
    console.log(err)
  } 
  );
});*/

app.get('/person', (req, res) => {
res.status(200).send({
  name: "Lem",
  age: 30
})

}); 


app.listen(8080, ()=> { 
console.log("Server läuft! ");
});