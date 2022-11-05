const express = require('express')
const request = require('request')
const router = express.Router();

const app = express()
const port = 3000

/*
  Method to send post request to Srping Boot microservice
*/
function postToBootStorage(num1, num2, operation, result){
  var data = {
        "num1": num1,
        "num2": num2,
        "op": operation,
        "result": result
         };
  
  console.log("Sending create operation request to Spring Boot service 'bootstorage'. Data = ", JSON.stringify(data));
  request({
      url: "http://bootstorage:5000/api/bootstorage/create",
      method: "POST",
      json: true,
      body: data
  }, function (error, response, body){
    console.log("Received response from Spring Boot service 'bootstorage'");
      //console.log("response = " + JSON.stringify(response));
      if(error){
        console.log("error = " + error);
      }
      if(process.env.LOG_LEVEL == 'DEBUG'){
        console.log("body = " + JSON.stringify(body));
      }
  });
};

app.get('/', (req, res) => {
    res.send('Hello World!')
})

app.get('/api/express', function (req, res) {
    res.send('Hello World from api/express!')
});

app.get('/api/express/add', function (req, res) {
    var operationResult = parseInt(req.query.num1) + parseInt(req.query.num2);
    postToBootStorage(req.query.num1, req.query.num2, "+", operationResult);
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.json({ result: operationResult });
});

app.get('/api/express/subtract', function (req, res) {
    var operationResult = parseInt(req.query.num1) - parseInt(req.query.num2);
    postToBootStorage(req.query.num1, req.query.num2, "-", operationResult);
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.json({ result: operationResult });
});

app.listen(port, () => {
    console.log('Example app listening on port ${port}')
})
