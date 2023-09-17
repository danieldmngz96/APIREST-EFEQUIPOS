import { Router } from "express";
import { pool, pool2 } from "../db.js";

const router = Router();
//get empleado
export const getEmpleados = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM empleados");
    return res.status(200).json(rows);
  } catch (error) {
    return res.status(500).json({ message: "Error en consulta empleados" });
  }
};

//agregar empleado 2.0
export const createEmpleado = async (req, res) => {
  try {
    const { nombre, celular, e_mail } = req.body;
    const [rows] = await pool.query(
      "INSERT INTO empleados (nombre, celular,e_mail) VALUES (?, ?,?)",
      [nombre, celular, e_mail]
    );
    res.json({ status: "empleado agregado" });
  } catch (error) {
    if (err) throw err;
    return res
      .status(500)
      .json({ message: "Error en controlador createEmpleado " });
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
  try {
    const [rows] = await pool.query("SELECT * FROM almacen.clientes;");
    if (!rows) {
      return res.status(404).json({ message: "No se encontraron clientes" });
    }
    res.json(rows);
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
//addCliente 2.0
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
    const [rows] = await pool.query(
      "INSERT INTO clientes(nom_cliente, direccion, nombre_obra, cargo_obra, celular, NIT , ciudad, departamento) values(' VALUES (?, ?)",
      [nom_cliente,
        direccion,
        nombre_obra,
        cargo_obra,
        celular,
        NIT,
        ciudad,
        departamento,]
    );
    res.status(201).json({ id: rows.insertId, name, salary });
  } catch (error) {
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
export default router;
