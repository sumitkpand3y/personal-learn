const express = require('express');
const router =  express.Router();

router.get('/', (req, res, next)=>{
    res.status(200).json({
        message:'Handling Get requests to /Products'
    })
});
router.post('/', (req, res, next)=>{
    const product = {
        name:req.body.name
    }
    res.status(200).json({
        message:'Handling Post requests to /Products'
    })
});

router.get('/:productId', (req ,res, next)=>{
    const id = req.params.productId;
    if(id === 'special'){
        res.status(200).json({
            message:'You discovered the special ID',
            id:id
        })
    }else{
        res.status(200).json({
            message:"Youy passed Id"
        })
    }
})
router.patch('/:productId', (req ,res, next)=>{
    res.status(200).json({
        message:'Updated product!'
    })
})
router.delete('/:productId', (req ,res, next)=>{
    res.status(200).json({
        message:'Delete product!'
    })
})


module.exports = router;


