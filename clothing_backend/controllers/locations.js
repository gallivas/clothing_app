const pool = require('../database/db');

const getLocations = async (req, res) => {
  try {
    const allLocations = await pool.query("SELECT * FROM location");
    res.json(allLocations.rows);
  } catch (err) {
    console.error(err.message);
  }
};


const createLocation = async (req, res) => {
  const {nickname, street_address, apartment_number, city, state, 
    postal_code, country}= req.body;
  try {
    const newLocation = await pool.query("INSERT INTO location \
      (nickname, street_address, apartment_number, city, state, \
      postal_code, country) \
      VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *", [nickname, street_address, 
        apartment_number, city, state, postal_code, country]);

    res.json(newLocation.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
};


const updateLocation = async (req, res) => {
  const {id} = req.params;
  const {nickname, street_address, apartment_number, city, state,
         postal_code, country} = req.body;
  try {
    const updated = await pool.query('UPDATE location SET \
      nickname=$1, street_address=$2, apartment_number=$3, city=$4, state=$5, postal_code=$6, country=$7 \
      WHERE location_id=$8',
      [nickname, street_address, apartment_number, city, state,
        postal_code, country, id]);
    
    res.json({"message": "Location has been successfully updated"});
  } catch (err) {
    console.error(err.message);
  }
};


const deleteLocation = async (req, res) => {
  const {id} = req.params;
  try {
    const deleted = pool.query("DELETE FROM location WHERE location_id=$1", [id]);

    res.json({"message": "Location was successfully deleted"});
  } catch (err) {
    console.error(err.message);
  }
};

module.exports = {getLocations, createLocation, updateLocation, deleteLocation};