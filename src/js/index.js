const express = require('express');  
const mysql = require('mysql'); 
const cors = require('cors');
const app = express();  


app.use(express.json());  
app.use(cors()); 


const db = mysql.createConnection({
host: "localhost", 
user: "mel", 
password: "36177436",
database: "app",

});  
 
db.connect(function(error) { 
    if (!!error) { 
      console.log('Fehler');
    } 
    else { 
      console.log('Verbunden')
    }

})


app.get('/index.html', (req, res) => {   
   
  db.query("INSERT INTO test (id, username) VALUES (1, 'Lem')") 
  if (error) throw error; 
  
}) 


app.listen(8080, ()=> { 

});