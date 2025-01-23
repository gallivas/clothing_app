const pool = require('../database/db');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

const getOwners = async (req, res) => {
  try {
    const authorizedOwner = await pool.query("SELECT f_name, l_name, email FROM owner WHERE email=$1", [req.user.username]);
    console.log(authorizedOwner.rows);
    res.json(authorizedOwner.rows);
  } catch (err) {
    console.error(err.message);
  }
};

const createOwner = async (req, res) => {
  const {f_name, l_name, email} = req.body;
  try {
    const hashedPassword = await bcrypt.hash(req.body.password, 10);
    const createPerson = await pool.query("INSERT INTO owner (f_name, l_name, email, password) \
      VALUES($1, $2, $3, $4) RETURNING *", [f_name, l_name, email, hashedPassword]);

    res.json(createPerson.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
};

const updateOwner = async (req, res) => {
  const {f_name, l_name, email} = req.body;
  try {
    const updateOwner = await pool.query("UPDATE owner \
      SET f_name=$1, l_name=$2, email=$3 WHERE email=$4", [f_name, l_name, email, req.user.username]);

    if (updateOwner.rowCount === 0) {
      res.status(404).json({"error": "The owner you attempted to update does not exist"});
    } else {
      res.send("Owner info has been updated");
    }
  } catch (err) {
    console.error(err.message);
  }
};

const deleteOwner = async (req, res) => {
  // const {id} = req.params;
  try {
    const deleteOwner = await pool.query("DELETE FROM owner WHERE email=$1", [req.user.username]);
    
    res.json({"message": "Owner has been deleted"});
  } catch (err) {
    console.error(err.message);
  }
};

const ownerLogin = async (req, res) => {
  const ownerEmail = req.body.email;
  const ownerInfo = await pool.query("SELECT email, password FROM owner WHERE email=$1", [ownerEmail]);
  if (ownerInfo.rowCount < 1) return res.status(400).send('Cannot find user');

  try {
    if (await bcrypt.compare(req.body.password, ownerInfo.rows[0].password)) {
      const accessToken = generateAccessToken(ownerEmail);
      const refreshToken = jwt.sign({username: ownerEmail}, process.env.REFRESH_TOKEN_SECRET);
      res.json({ accessToken: accessToken, refreshToken: refreshToken });
    }
  } catch (err) {
    console.error(err.message);
    res.status(500).send();
  }
};

function generateAccessToken(username) {
  return jwt.sign({username: username}, process.env.ACCESS_TOKEN_SECRET, { expiresIn: '15m' });
}

module.exports = {getOwners, createOwner, updateOwner, deleteOwner, ownerLogin}