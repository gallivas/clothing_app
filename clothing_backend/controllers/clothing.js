const pool = require('../database/db');

const getAllClothing = async (req, res) => {
  try {
    const allCLothing = await pool.query("SELECT * FROM clothing");
    res.json(allCLothing.rows);
  } catch (err) {
    console.error(err.message);
  }
};


const createClothing = async (req, res) => {
  try {
    const {clothing_name, clothing_category, clothing_condition, clothing_description,
         clothing_photo, clothing_brand, location_id, owner_id} = req.body;

    const created = await pool.query("INSERT INTO clothing (clothing_name, \
        clothing_category, clothing_condition, clothing_description, clothing_photo, clothing_brand, \
        location_id, owner_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *", 
        [clothing_name, clothing_category, clothing_condition, clothing_description,
          clothing_photo, clothing_brand, location_id, owner_id]);
    res.json(created.rows[0]);
    
  } catch (err) {
    console.error(err.message);
  }
};


const updateClothing = async (req, res) => {
  const {id} = req.params;
  const {clothing_name, clothing_category, clothing_condition, clothing_description, clothing_photo,
     clothing_brand, location_id, owner_id} = req.body;
  try {
    const updated = await pool.query("UPDATE clothing SET clothing_name=$1, \
          clothing_category=$2, clothing_condition=$3, clothing_description=$4, \
          clothing_photo=$5, clothing_brand=$6, location_id=$7, owner_id=$8 \
          WHERE clothing_id=$9", [clothing_name, clothing_category, clothing_condition,
          clothing_description, clothing_photo, clothing_brand, location_id, owner_id, id]);
    res.json({"message": "Clothing has been updated"});
  } catch (err) {
    console.error(err.message);
  }
};


const deleteClothing = async (req, res) => {
  const {id} = req.params;
  try {
    const deleted = await pool.query("DELETE FROM clothing WHERE clothing_id=$1", [id]);
    res.json({"message": "Clothing item has been deleted"});
  } catch (err) {
    console.error(err.message);
  }
};

const getClothesByOwnerId = async (req, res) => {
  const {id} = req.params;
  try {
    const response = await pool.query("SELECT clothing_name, nickname AS location \
         FROM clothing INNER JOIN location ON clothing.location_id = location.location_id \
         WHERE owner_id=$1", [id]);
    res.json(response.rows);
  } catch (err) {
    console.error(err.message);
  }
}


module.exports = {getAllClothing, createClothing, updateClothing, deleteClothing, getClothesByOwnerId};