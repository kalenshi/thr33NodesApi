
const express = require('express');
const bodyParser = require('body-parser');
const api = require("./routes/api/api.js");
const homeHtml = require("./routes/html/home");
const books = require("./routes/api/books/books");
const {getConnection} = require("./routes/dao/dao");


const app = express();
const PORT = process.env.PORt || 3000;


//middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use("/assets", express.static(`${__dirname}/public`));

app.set('view engine', 'ejs');

//database connections
//
app.use("/api", api);
app.use("/api/books/", books);
app.use("/", homeHtml);

app.listen(PORT, ()=>{
    console.log(`Listening on port ${PORT} ...`);
});
