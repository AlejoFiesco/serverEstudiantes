let express = require('express')
let oracledb = require('oracledb')
let bodyParser = require('body-parser')
let cors = require('cors');
let app = express()
const nodemailer = require("nodemailer");
const dotenv = require("dotenv");

dotenv.config()
app.use(cors({ origin: '*' }))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
let port = 5000;

let connection;

const transporter = nodemailer.createTransport({
  service: hotmail,
  auth: {
    user: process.env.EMAIL_USERNAME,
    pass: process.env.EMAIL_PASSWORD
  }
})



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

//Buscar estudiantes
app.get('/buscarBasico', async (req, res) => {
  const result = await connection.execute(`SELECT CODIGO, NOMBRES, APELLIDOS, CORREO_INSTITUCIONAL FROM estudiante`);
  // console.table(result['rows']);
  res.send(result);
})

//Buscar estudiante por codigo
app.get('/buscar/:codigo', async (req, res) => {
  const { codigo } = req.params;
  const result = await connection.execute(`SELECT * FROM estudiante WHERE CODIGO='${codigo}'`);
  res.send(result);
})

//Insertar un estudiante
app.post('/insertar', async (req, res) => {
  // console.log(req.body);
  const { codigo, nombres, apellidos, correoPersonal, tipoDocumento, fechaNacimiento, numDocumento, numCelular, proyectoCurricular, correoInstitucional } = req.body;
  const query = `INSERT INTO estudiante values
    ('${codigo}',
    '${nombres}', 
    '${apellidos}', 
    '${correoPersonal}', 
    '${tipoDocumento}', 
    TO_DATE('${fechaNacimiento}', 'YYYY,MM,DD'), 
    '${numDocumento}', 
    '${numCelular}',
    '${proyectoCurricular}', 
    '${correoInstitucional}') `;
  // console.log(query);
  const result = await connection.execute(query);
  if (result) {
    connection.commit();
    res.send(true)

    const options = {
      from: process.env.EMAIL_SENDER,
      to: correoPersonal,
      subject: "Generación de Usuario",
      text: "Bienvenido a la plataforma, muchas gracias por utilizar el aplicativo."
    }

    transporter.sendMail(options, (error, info) => {
      if (error) console.log(error)
      else console.log(info)

    })
  }
  else res.send(false)
})

//Eliminar un estudiante por código
app.get('/eliminar/:codigo', async (req, res) => {
  const codigo = req.params.codigo;
  const result = await connection.execute(`DELETE FROM estudiante WHERE codigo='${codigo}'`);
  if (result) {
    connection.commit();
    res.send(true)
  }
  else res.send(false)
})
app.post('/actualizar', async (req, res) => {
  const { codigo, nombres, apellidos, correoPersonal, tipoDocumento, fechaNacimiento, numDocumento, numCelular, proyectoCurricular, correoInstitucional } = req.body;
  const query = `UPDATE estudiante SET
    codigo = '${codigo}',
    nombres = '${nombres}',
    apellidos = '${apellidos}',
    correo_personal = '${correoPersonal}',
    tipo_documento = '${tipoDocumento}',
    fecha_nacimiento = TO_DATE('${fechaNacimiento}', 'YYYY,MM,DD'),
    num_documento = '${numDocumento}',
    celular = '${numCelular}',
    proyecto_curricular='${proyectoCurricular}',
    correo_institucional='${correoInstitucional}'
    WHERE codigo = '${codigo}'
  `;
  // const result = await connection.execute(query);
  res.send(result ? true : false);
})

conectar()
  .then(() => {
    app.listen(port, () => {
      console.log(`Listening port ${port}`);
    })
  })
