const express = require("express");
const router = express.Router();

router.get('/', (req, res, next)=>{
    res.status(200).json({
        message:'Order were fetched'
    })
});

router.post('/', (req, res, next)=>{
    res.status(200).json({
        message:'Order was created'
    })
})

router.get("/:orderId", (req, res, next)=>{
    res.status(200).json({
        message:'Order details',
        orderId: req.params.id
    })
})

module.exports = router;