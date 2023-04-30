let express = require('express')
let oracledb = require('oracledb')
let app = express()
let port = 3000;

let connection;

let conectar = async () => {
  try {
    connection = await oracledb.getConnection({
      user: "SYSTEM",
      password: "BD22023",
      connectString: `(DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = DESKTOP-OUD5SK0)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XE)
    )
  )`
    });
  } catch (e) {
    console.log(e);
  }
}

app.get('/buscar', async (req, res) => {
  const result = await connection.execute(`SELECT * FROM estudiante`);
  // console.table(result['rows']);
  res.send(result);
})
app.post('/insertar', async (req, res) => {
  const {codigo, nombres, apellidos, correoPersonal, tipoDocumento, fechaNacimiento, numDocumento, numTelefono, proyectoCurricular, correoInstitucional} = req.body;
  const result = await connection.execute(`INSERT INTO estudiante values
  ('${codigo}','${nombres}', '${apellidos}', '${correoPersonal}', '${tipoDocumento}', '${fechaNacimiento}', ${numDocumento}, '${numTelefono}'
  ,'${proyectoCurricular}', '${correoInstitucional}') `
  );
  // console.table(result['rows']);
  res.send(result);
})
app.get('/eliminar/:codigo', async (req, res) => {
  const codigo = req.params.codigo;
  const result = await connection.execute(`DELETE FROM estudiante WHERE CODIGO='${codigo}'`);
  // console.table(result['rows']);
  res.send(result);
})
// app.post('/modificar', async (req, res) => {
//   const datos = req.body;
//   const result = await connection.execute(`UPDATE estudiante set`);
//   // console.table(result['rows']);
//   res.send(result);
// })

conectar()
.then(()=>{
  app.listen(port, () => {
    console.log(`Listening port ${port}`);
  })
})
