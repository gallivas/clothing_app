const pool = require('../database/db');


const getOwners = async (req, res) => {
  try {
    const allPeople = await pool.query("SELECT * FROM owner");
    console.log(allPeople.rows);
    res.json(allPeople.rows);
  } catch (err) {
    console.error(err.message);
  }
};

const createOwner = async (req, res) => {
  const {f_name, l_name, email} = req.body;
  try {
    const createPerson = await pool.query("INSERT INTO owner (f_name, l_name, email) \
      VALUES($1, $2, $3) RETURNING *", [f_name, l_name, email]);

    res.json(createPerson.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
};

const updateOwner = async (req, res) => {
  const {id} = req.params;
  const {f_name, l_name, email} = req.body;
  try {
    const updateOwner = await pool.query("UPDATE owner \
      SET f_name=$1, l_name=$2, email=$3 WHERE owner_id=$4", [f_name, l_name, email, id]);

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
  const {id} = req.params;
  try {
    const deleteOwner = await pool.query("DELETE FROM owner WHERE owner_id=$1", [id]);
    
    res.json({"message": "Owner has been deleted"});
  } catch (err) {
    console.error(err.message);
  }
};

module.exports = {getOwners, createOwner, updateOwner, deleteOwner}