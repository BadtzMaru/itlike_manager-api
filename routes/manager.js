const express = require('express');
const router = express.Router();
const axios = require('axios');

router.get('/',(req,res,next)=>{
	res.render('manager/index.html');
});

module.exports = router;