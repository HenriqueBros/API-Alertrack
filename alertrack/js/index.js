const express = require('express');
const app = express();         
const bodyParser = require('body-parser');
const port = 3000;
const mysql = require('mysql');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

const router = express.Router();
router.get('/', (req, res) => res.json({ message: 'Funcionando!' }));
app.use('/', router);

app.listen(port);
console.log('API funcionando!');

function execSQLQuery(sqlQry, res){
    const connection = mysql.createConnection({
      host     : 'localhost',
      user     : 'root',
      password : '',
      database : 'api'
    });
   
    connection.query(sqlQry, function(error, results, fields){
        if(error) 
          res.json(error);
        else
          res.json(results);
        connection.end();
        console.log('executou!');
    });
  }

    router.get('/pessoas', (req, res) =>{
        execSQLQuery('SELECT * FROM PESSOAS', res);
})

    router.get('/companies', (req, res) =>{
         execSQLQuery('SELECT * FROM COMPANIES', res);
})

    router.get('/endereco', (req, res) =>{
         execSQLQuery('SELECT * FROM ENDERECO', res);
})

    router.get('/telefone', (req, res) =>{
         execSQLQuery('SELECT * FROM TELEFONE', res);
})

