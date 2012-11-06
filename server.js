var express = require('express');
var app = express();

//expose the lib dir to http
app.use('/lib',express.static('./lib'));
app.use(express.static('./lib'));

//expose the components dir to http
app.use('/components',express.static('./components'));


//expose the assets dir to http
app.use('/media',express.static('./media'));
app.use(express.static('./media'));

//expose the dist dir to http
app.use('/dist',express.static('./dist'));

var port = process.env.PORT || 9090;

console.log("Started server on port " + port);

app.listen(port);