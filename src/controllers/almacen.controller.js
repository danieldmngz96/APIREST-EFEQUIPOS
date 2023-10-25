import { Router } from "express";
import { pool, pool2 } from "../db.js";

const router = Router();
//get empleado
export const getEmpleados = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM almacen.empleados");
    return res.status(200).json(rows);
  } catch (error) {
    return res.status(500).json({ message: "Error en consulta empleados" });
  }
};

//agregar empleado 2.5
export const createEmpleado = async (req, res) => {
  try {
    const { nombre, celular, e_mail, id_cargo, usuario } = req.body;
    const [rows] = await pool.query(
      "INSERT INTO empleados (nombre, celular, e_mail, id_cargo, usuario) VALUES (?,?,?,?,?)",
      [nombre, celular, e_mail, id_cargo, usuario]
    );    
    if(rows){
      res.json({ status: "empleado agregado" });
    }
  } catch (error) { // Cambié "err" por "error" en esta línea
    console.error(error); // Muestra el error en la consola para depuración
    return res
      .status(500)
      .json({ message: "Error en controlador createEmpleado" });
  }
};

//get despachos 2.0
export const getDespachos = async (req, res) => {
  const page = parseInt(req.query.page) || 1; // Página actual
  const limit = parseInt(req.query.limit) || 20; // Número de registros por página
  const offset = (page - 1) * limit; // Desplazamiento

  try {
    // Consulta para obtener los registros de la página actual
    let sql = `SELECT * FROM despachos LIMIT ${limit} OFFSET ${offset}`;
    const [rows] = await pool.query(sql);

    // Consulta para contar el total de registros en la tabla
    sql = "SELECT COUNT(*) AS count FROM despachos";
    const [result] = await pool.query(sql);
    const total = result[0].count;
    const totalPages = Math.ceil(total / limit);

    // Devolver los resultados y la información de paginación en un objeto JSON
    res.json({ total, totalPages, page, limit, offset, rows });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Error en controlador getDespachos" });
  }
};
//agregar despachos
export const createDespacho = async (req, res) => {
  try {
    const {
      cod_obra,
      cod_cont,
      fec_des,
      despachador,
      obs,
      conductor_veh,
      tipo_veh,
      autorizador,
      peso_total,
      area_total,
      placa_veh,
      descripcion,
      cantidad,
    } = req.body;
    const [rows] = await pool.query(
      "INSERT INTO despachos (cod_obra, cod_cont, fec_des, despachador, obs,conductor_veh, tipo_veh, autorizador,peso_total, area_total, placa_veh, descripcion, cantidad) VALUES (?, ?)",
      [
        cod_obra,
        cod_cont,
        fec_des,
        despachador,
        obs,
        conductor_veh,
        tipo_veh,
        autorizador,
        peso_total,
        area_total,
        placa_veh,
        descripcion,
        cantidad
      ]
    );
    res.json({ status: "despacho agregado" });
  } catch (error) {
    return res.status(500).json({ message: "Error en createDespacho" });
  }
};
//---------- agregamos rutas para clientes--------
//get clientes
export const getCliente = async (req, res) => {
  const page = parseInt(req.query.page) || 1; // Página actual
  const limit = parseInt(req.query.limit) || 10; // Número de productos por página
  const offset = (page - 1) * limit; // Desplazamiento
  try {
    const [rows] = await pool.query(`SELECT * FROM almacen.clientes LIMIT ? OFFSET ?;`,
    [limit, offset]
    );
    if (rows.length <= 0) {
      return res.status(404).json({ message: "No se encontraron clientes en getCliente" });
    } else {
      return res.status(200).json(rows); // Enviar los productos encontrados como respuesta
    }
  } catch (error) {
    return res.status(500).json({ message: "Error en getCliente", error: error });
  }
};
//Obtener cliente por id
export const getClienteById = async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await pool.query(`SELECT * FROM almacen.clientes as c WHERE c.cod_cli = ${id};`);
    if (rows.length <= 0) {
      return res.status(404).json({ message: "No se encontraron clientes" });
    }
    res.json(rows);
  } catch (error) {
    return res.status(500).json({ message: "Error en getCliente" });
  }
};
//MODIFICAR cliente-------------
//MODIFICAR cliente2.0-------------
export const updateCliente = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      NIT,
      nom_cliente,
      direccion,
      nombre_obra,
      cargo_obra,
      celular,
      ciudad,
      departamento,
      cod_cli,
    } = req.body;

    const [result] = await pool.query(
      `UPDATE clientes SET 
    NIT = ?,
    nom_cliente = ?,
    direccion = ?,
    nombre_obra = ?,
    cargo_obra = ?,
    celular = ?,
    ciudad = ?,
    departamento = ?
    WHERE cod_cli = ?`,
      [NIT,
        nom_cliente,
        direccion,
        nombre_obra,
        cargo_obra,
        ciudad,
        celular,
        departamento,
        cod_cli,
        id,]
    );
    (err, rows, fields) => {
      if (err) throw err;
      else {
        res.json({ status: "cliente modificado" });
      }
    }
    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "Error en updateCliente" });
  }
};
//addCliente 3.0
export const addCliente = async (req, res) => {
  try {
    const {
      nom_cliente,
      direccion,
      nombre_obra,
      cargo_obra,
      celular,
      NIT,
      ciudad,
      departamento,
    } = req.body;

    // Insertar el cliente en la base de datos
    const [rows] = await pool.query(
      "INSERT INTO clientes(nom_cliente, direccion, nombre_obra, cargo_obra, celular, NIT, ciudad, departamento) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
      [nom_cliente, direccion, nombre_obra, cargo_obra, celular, NIT, ciudad, departamento]
    );

    // Enviar la respuesta con el ID del cliente insertado
    res.status(201).json({ id: rows.insertId });
  } catch (error) {
    console.error(error); // Registra el error en la consola para fines de depuración
    return res.status(500).json({ message: "Error en el controlador" });
  }
};
// Obtener un cliente por su id 2.0
export const addClienteId = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query([id],
      "SELECT * FROM clientes WHERE cod_cli = ?");
    res.status(201).json({ message: "Cliente encontrado" });
  } catch (error) {
    return res.status(500).json({ error: "Error al obtener el cliente" });
  }
};
//Modificar empleado2.0
export const updateEmpleado = async (req, res) => {
  try {
    const { id_empleado } = req.params;
    const { nombre, id_cargo, celular, e_mail } = req.body;

    const [result] = await pool.query(
      `update empleados set 
      nombre ='${nombre}',
      id_cargo='${id_cargo}',
      celular='${celular}',
      e_mail='${e_mail}'
      where id_empleado = '${id_empleado}'`,
      [nombre, id_cargo, celular, e_mail]
    );
    if (result.affectedRows === 0)
      return res.status(404).json({ message: "Empleado no encontrado" });

    const [rows] = await pool.query("SELECT * FROM empleados WHERE id = ?", [
      id,
    ]);

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({ message: "ERROR en updateEmpleado" });
  }
};
//eliminar empleado2.0
export const deleteEmpleado = async (req, res) => {
  try {
    const { id } = req.params;
    const [rows] = await pool.query("DELETE FROM empleados WHERE id = ?", [id]);
    if (rows.affectedRows <= 0) {
      return res.status(404).json({ message: "Empleados not found" });
    }
    res.json({ status: "empleado eliminado" });
    res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({ message: "error goes wrong" });
  }
};
//Enviar pqrs
export const Postpqrs = async (req, res) => {
  const { name, direccion, phone, city, country, email, pqrs } = req.body;

  try {
    const sql = ` INSERT INTO pqr_i (nombre, direccion, telefono, celular, ciudad, pais, e_mail, obs) VALUES (?,?,?,?,?,?,?,?)`;
    const [rows] = await pool.query(sql, [name, direccion, phone, phone, city, country, email, pqrs ]);
    console.log(rows);
    if (rows.length === 0) {
      res.status(401).json({ error: "Pqrs invalido" });
    } else {
     /*  const pqrs = {
        name: rows[0].name,
        direccion: rows[0].direccion,
        phone: rows[0].phone,
        city: rows[0].city,
        country: rows[0].country,
        email: rows[0].email,
        pqrs: rows[0].pqrs,
      }; */
      res.status(200).json({ message: "Envio de pqrs exitoso", id: rows["insertId"] });
    }
  } catch (error) {
    console.error("Error de base de datos:", error);
    res.status(500).json({ error: "Error interno del servidor", details: error.message });
  }
};

//Obtener pqrs 
export const getPqrs = async (req, res) => {
  const page = parseInt(req.query.page) || 1; // Página actual
  const limit = parseInt(req.query.limit) || 20; // Número de registros por página
  const offset = (page - 1) * limit; // Desplazamiento

  try {
    // Consulta para obtener los registros de la página actual
    let sql = `SELECT * FROM pqr_i LIMIT ${limit} OFFSET ${offset}`;
    const [rows] = await pool.query(sql);

    // Consulta para contar el total de registros en la tabla
    sql = "SELECT COUNT(*) AS count FROM pqr_i";
    const [result] = await pool.query(sql);
    const total = result[0].count;
    const totalPages = Math.ceil(total / limit);

    // Devolver los resultados y la información de paginación en un objeto JSON
    res.json({ total, totalPages, page, limit, offset, rows });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Error en controlador getPqrs" });
  }
};

//contratos
export const getContratos = async (req, res) => {
  const page = parseInt(req.query.page) || 1; // Página actual
  const limit = parseInt(req.query.limit) || 20; // Número de registros por página
  const offset = (page - 1) * limit; // Desplazamiento

  try {
    // Consulta para obtener los registros de la página actual
    let sql = `SELECT * FROM contratos LIMIT ${limit} OFFSET ${offset}`;
    const [rows] = await pool.query(sql);

    // Consulta para contar el total de registros en la tabla
    sql = "SELECT COUNT(*) AS count FROM contratos";
    const [result] = await pool.query(sql);
    const total = result[0].count;
    const totalPages = Math.ceil(total / limit);

    // Devolver los resultados y la información de paginación en un objeto JSON
    res.json({ total, totalPages, page, limit, offset, rows });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Error en controlador getContratos" });
  }
};

//Post de login 3.0
export const loginUser = async (req, res) => {
  const { correo, clave } = req.body; 

  try {
    const sql = `SELECT * FROM usuarios WHERE correo = ? AND clave = ?`; 
    const [rows] = await pool.query(sql, [correo, clave]); 
    
    if (rows.length !== 0) { // Cambia de != false a !== 0
      const user = {
        correo: rows[0].correo,
        clave: rows[0].clave,
      };
      res.status(200).json({ message: "Inicio de sesión exitoso", user });
    } else {
      res.status(401).json({ error: "Credenciales inválidas" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error interno del servidor en loginUser de almacen" });
  }
};
//GET user 2.5
export const getUserInfo = async (req, res) => {
  //const { nombre } = req.query;
  const { correo } = req.query;
  try {
    const sql = "SELECT nombre FROM usuarios WHERE correo = ?";
    const [rows] = await pool.query(sql, [correo]);

    if (rows && rows.length > 0) {
      // Extrae solo el nombre de los resultados
      const nombres = rows.map((row) => row.nombre);
      res.json(nombres);
    } else {
      res.json({ message: "No se encontraron usuarios con ese nombre." });
    }
  } catch (error) {
    console.error("Error al ejecutar la consulta:", error);
    res.status(500).json({ error: "Ocurrió un error al procesar la solicitud." });
  }
};


//GET PARA OBTENER AL INVENTARIO 3.5
export const getProductos = async (req, res) => {
  const page = parseInt(req.query.page) || 1; // Página actual
  const limit = parseInt(req.query.limit) || 10; // Número de productos por página
  const offset = (page - 1) * limit; // Desplazamiento

  try {
    const [rows] = await pool.query(
      `SELECT * FROM almacen.productos LIMIT ? OFFSET ?;`,
      [limit, offset]
    );

    if (rows.length <= 0) {
      return res.status(404).json({ message: "No se encontraron productos en el inventario" });
    } else {
      return res.status(200).json(rows); // Enviar los productos encontrados como respuesta
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Error en la consulta del inventario" });
  }
};


//GET POR ID DE PRODUCTOS 3.0
export const getProductosById = async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    const [rows] = await pool.query(`SELECT * FROM almacen.productos  WHERE cod_prod = ?;`,[id]);
    if (rows.length <= 0) {
      return res.status(404).json({ message: "No se encontraron productos en el inventario" });
    } else {
      return res.status(200).json(rows); // Enviar los productos encontrados como respuesta
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Error en la consulta del inventario" });
  }
};
//Modificar Inventario 2.0 
export const updateProductos = async (req, res) => {
  const { id } = req.params;
  const { tipo, descripcion, cantidad, valor_uni, peso_uni, area_total , area , peso_total } = req.body;

  try {
    const sql = `UPDATE productos 
    SET tipo = ?, descripcion = ?, cantidad = ?, valor_uni = ?, peso_uni = ?, area_total = ?, area = ?, peso_total = ? 
    WHERE cod_prod = ?;
    `;
    const [rows] = await pool.query(sql, [tipo, descripcion, cantidad, valor_uni, peso_uni, area_total, area, peso_total, id]);
     return res.status(200).json({ status: "Producto modificado" });
  } catch (error) {
    return res.status(500).json({ message: "Error al modificar el Producto" });
  }
};
//add Contrato 1.0
export const addContrato = async (req, res) => {
  try {
    const {
      nombre,
      cod_cli,
      fec_ini,
      fec_fin,
      estado,
    } = req.body;
    console.log("body", req.body)
    // Insertar el contrato en la base de datos
    const [rows] = await pool.query(
      "INSERT INTO contratos(nombre, cod_cli, fec_ini, fec_fin, estado) VALUES (?, ?, ?, ?, ?)",
      [nombre, cod_cli, fec_ini, fec_fin, estado]
    );

    // Enviar la respuesta con el ID del contrato insertado
    res.status(201).json({ id: rows.insertId , message: req.body.nombre });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: "Error en el controlador" });
  }
};

//Agregar productos 2.0
export const addProducto = async (req, res) => {
  const { tipo, descripcion, cantidad, valor_uni, peso_uni, area, area_total, peso_total } = req.body;

  try {
    const sql = `INSERT INTO productos (tipo, descripcion, cantidad, valor_uni, peso_uni, area, area_total, peso_total) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;
    const values = [tipo, descripcion, cantidad, valor_uni, peso_uni, area, area_total, peso_total];
    await  pool.query(sql, values);
    res.json({ status: "Producto agregado" });
  } catch (error) {
    console.error("Error al agregar el Producto:", error);
    return res.status(500).json({ message: "Error al agregar el Producto" });
  }
};




export default router;