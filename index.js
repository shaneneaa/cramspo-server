const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const cors = require('cors');

app.use(cors());
app.use(bodyParser.json());

console.clear();

//Create database connection

const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'db_cramspot'
});

const secretKey = "ver";

//mysq connection
conn.connect();

//Create server
app.listen(3000,()=>{
    console.log('Server started on port 3000');
});


app.post('/login',(req,res)=>{
    let sql = "SELECT * FROM user WHERE email = ?";
    conn.query(sql,[req.body.email],(err,result)=>{
        if(err) throw err;
        if(result.length == 1){
            if(bcrypt.compareSync(req.body.password, result[0].password)){
                let payload = {
                    user_id : result[0].user_id,
                    firstname: result[0].firstname,
                    lastname: result[0].lastname,
                    email: result[0].email
                };
                res.json({token: jwt.sign(payload,secretKey)});
            } else {
                res.status(404).json({message: "invalid username/password"});
            }
        } else {
            res.status(404).json({message: "invalid username/password"});
        }
    });

});

app.post('/signup',(req,res)=>{
    req.body.password =  bcrypt.hashSync(req.body.password, 5);
    let sql = "INSERT INTO user SET ?";
    
    let query =conn.query(sql,[req.body],(err,result)=>{
        if(err) throw err;
        let payload = {
            firstname: req.body.firstname,
            lastname: req.body.lastname,
            user_id: result.insertId,
            emai: req.body.emai
        };
        res.json({token: jwt.sign(payload,secretKey)});
    });
});
//feed

// app.post('/feed',(req,res)=>{
//     let sql = "INSERT INTO feed SET ?";
    
//     let query =conn.query(sql,[req.body],(err,result)=>{
//         if(err) throw err;
//         let payload = {
//             user_id: req.body.insertId,
//             feed_id: result.insertId,
//             message: req.body.massage
//         };
//     });
// });