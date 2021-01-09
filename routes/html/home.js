const express = require('express');
const router = express.Router();


router.get('/', (req, res)=>{
    res.render("home", {developer: "Kalenshi Katebe"});
})

module.exports = router;