const express = require('express');
const bodyParser = require('body-parser');
const api = require("./routes/api/api.js");
const homeHtml = require("./routes/html/home");


const app = express();
const PORT = process.env.PORt || 3000;


//middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

app.set('view engine', 'ejs');

app.use("/api", api);
app.use("/", homeHtml);

app.listen(PORT, ()=>{
    console.log(`Listening on port ${PORT} ...`);
});
