const express = require('express');
const router = express.Router();
const {getOwners, createOwner, updateOwner, deleteOwner, ownerLogin} = require('../controllers/owners');

router.route('/').get(getOwners).post(createOwner);
router.route('/:id').put(updateOwner).delete(deleteOwner);
router.route('/login').post(ownerLogin);

module.exports = router;