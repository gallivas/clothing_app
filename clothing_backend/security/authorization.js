require('dotenv').config();
const jwt = require('jsonwebtoken');

const authenticateToken = (req, res, next) => {
  console.log(req.headers);
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (!token) return res.sendStatus(401);
  jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
    if (err) return res.sendStatus(403);
    console.log(user);
    req.user = user;
    next();
  });
};

module.exports = {authenticateToken};