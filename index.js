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

app.post('/workspace',verifyToken, (req,res)=>{
    req.body['user_id'] = req.token.user_id;
    let sql = "INSERT INTO workspace SET ?";
    conn.query(sql,[req.body], (err,result) =>{
        if(err) throw err;
        res.json({message: "workspace inserted"});
    });
}); 

app.get('/workspace',verifyToken, (req,res)=>{
    let sql = "SELECT * FROM workspace WHERE isVerify = 1";
    conn.query(sql,(err,result)=>{
        if(err) throw err;
        res.json(result);
    });
});

app.post('/feed',verifyToken, (req,res)=>{
    let sql = "INSERT INTO feed(user_id,message) VALUES(?)";
    let insert = [req.token.user_id, req.body.message];
    conn.query(sql,(err,result) =>{
        if(err) throw err;
        res.json({message: "feed inserted"});
    });
});

app.get('/feed',verifyToken, (req,res)=>{
    let sql = "SELECT * FROM feed";
    conn.query(sql,(err,result)=>{
        if(err) throw err;
        res.json(result);
    });
});


function verifyToken(req,res,next){
    res.setHeader('Content-type','Application/json');
    const bearerHeader = req.headers['authorization'];
    if(bearerHeader !== 'undefined'){
        const bearerToken = bearerHeader.split(' ')[1];
        jwt.verify(bearerToken,secretKey , (err,result) =>{
            if(err){
                res.status(403).json({message: err.message});
            } else {
                req.token = result;
                next();
            }
        });
    } else {
        res.status(403).json({message: "Token missing from header"});
    }
}