const express = require('express');
const router = express.Router();
const {getOwners, createOwner, updateOwner, deleteOwner} = require('../controllers/owners');

router.route('/').get(getOwners).post(createOwner);
router.route('/:id').put(updateOwner).delete(deleteOwner);

module.exports = router;