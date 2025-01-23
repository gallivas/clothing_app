const express = require('express');
const router = express.Router();
const {getOwners, createOwner, updateOwner, deleteOwner, ownerLogin} = require('../controllers/owners');
const { authenticateToken } = require('../security/authorization');

router.route('/').get(authenticateToken, getOwners).post(createOwner).put(authenticateToken, updateOwner);
router.route('/delete').delete(authenticateToken, deleteOwner);
router.route('/login').post(ownerLogin);

module.exports = router;