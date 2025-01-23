require('dotenv').config();

const express = require('express');
const app = express();
const cors = require('cors')
// const pool = require('./database/db');
const PORT = 3000;
// const jwt = require('jsonwebtoken');

const owners = require('./routes/owners');
const locations = require('./routes/locations');
const clothing = require('./routes/clothing');

// const authenticateToken = (req, res, next) => {
//   console.log(req.headers);
//   const authHeader = req.headers['authorization'];
//   const token = authHeader && authHeader.split(' ')[1];
//   if (!token) return res.sendStatus(401);
//   jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
//     if (err) return res.sendStatus(403);
//     console.log(user);
//     req.user = user;
//     next();
//   });
// };

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Welcome to the clothing DB');
})

app.use('/owners', owners);
app.use('/locations', locations);
app.use('/clothing', clothing);



app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});