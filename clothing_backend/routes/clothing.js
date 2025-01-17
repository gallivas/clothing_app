const express = require('express');
const router = express.Router();

const {getAllClothing, createClothing, updateClothing, deleteClothing, getClothesByOwnerId} = require('../controllers/clothing');

router.route('/')
  .get(getAllClothing)
  .post(createClothing);
router.route('/:id')
  .get(getClothesByOwnerId)
  .put(updateClothing)
  .delete(deleteClothing);

module.exports = router;