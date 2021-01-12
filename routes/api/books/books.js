const express = require('express');

const router = express.Router();

router.get("/", (req, res)=>{
    res.json({result:" Sending all the books in the library"});
});

router.get("/:id", (req, res)=>{
    res.json({id: req.params.id});
});

router.post("/add", (req, res)=>{
    res.send("thank you for Posting it! We're looking forward to adding it");
});

router.post("/update/:id", (req, res)=>{
   res.send("Thank you for requesting an update!");
});



module.exports = router;