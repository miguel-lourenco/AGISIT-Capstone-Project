const express = require('express')
const router = express.Router();

const app = express()
const port = 3000

app.get('/', (req, res) => {
    res.send('Hello World!')
})

app.get('/api/express', function (req, res) {
    res.send('Hello World from api/express!')
});

app.get('/api/express/add', function (req, res) {
    var operationResult = parseInt(req.query.num1) + parseInt(req.query.num2);
    //postToBootStorage(req.query.num1, req.query.num2, "+", operationResult);
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.json({ result: operationResult });
});

app.get('/api/express/subtract', function (req, res) {
    var operationResult = parseInt(req.query.num1) - parseInt(req.query.num2);
    //postToBootStorage(req.query.num1, req.query.num2, "+", operationResult);
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.json({ result: operationResult });
});

app.listen(port, () => {
    console.log('Example app listening on port ${port}')
})
