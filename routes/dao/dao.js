const mysql = require('mysql');

function getConnection() {
    let con = mysql.createConnection({
        host: "mysqlDB",
        user: "tb_admin",
        password: 'YHZ_hg2ua'
    });
    con.connect(err=>{
        if(err){
            throw err;
        }
        console.log(`Connected to database`);
        return con;
    })
}

module.exports = {
    getConnection
};