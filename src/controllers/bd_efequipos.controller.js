//const router = require("express").Router();
/* const express = require("express");
const conexion = require("./config/conexion");
const index = require("./index");
const bd_efequipos = conexion.bd_efequipos;
const router = express.Router(); */
import { Router } from "express";
import { pool2, pool } from "../db.js";


const router = Router();
//---------- agregamos rutas para bd_efequipos--------
//get inventarios 2.0   
export const getInventario = async (req, res) => {
  const page = parseInt(req.query.page) || 1; // Página actual
  const limit = parseInt(req.query.limit) || 20; // Número de registros por página
  const offset = (page - 1) * limit; // Desplazamiento

  try {
    // Consulta para obtener los registros de la página actual
    let sql = `SELECT * FROM inventario LIMIT ${limit} OFFSET ${offset}`;
    const [rows] = await  pool2.query(sql);

    // Consulta para contar el total de registros en la tabla
    sql = "SELECT COUNT(*) AS count FROM inventario";
    const [result] = await  pool2.query(sql);
    const total = result[0].count;
    const totalPages = Math.ceil(total / limit);

    // Devolver los resultados y la información de paginación en un objeto JSON
    res.json({ total, totalPages, page, limit, offset, rows });
  } catch (error) {
    return res.status(500).json({ message: "Error en consulta de inventarios" });
  }
};

// get un inventario obtener por id
/* router.get("/:id", (req, res) => {
  const { id } = req.params;
  let sql = "select * from inventario where id_inventario = ?";
   pool2.query(sql, [id], (err, rows, fields) => {
    if (err) throw err;
    else {
      res.json(rows);
    }
  });
}); */
// get un inventario obtener por id 2.0
export const getInventarioById = async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await pool2.query(`SELECT * FROM almacen.inventario as c WHERE c.id_inventario = ${id};`);
    if (rows.length <= 0) {
      return res.status(404).json({ message: "No se encontraron el inventario" });
    }
  } catch (error) {
    return res.status(500).json({ message: "Error en consulta de inventario por ID" });
  }
};

//agregar Inventario
/* router.post("/add-inventario", (req, res) => {
  const { descripcion, cantidad, peso_kg, area_m2, peso_total, area_total } =
    req.body;

  let sql = `insert into inventario(descripcion,cantidad,peso_kg,area_m2,peso_total,area_total) values('${descripcion}','${cantidad}','${peso_kg}','${area_m2}','${peso_total}','${area_total}')`;
   pool2.query(sql, (err, rows, fields) => {
    if (err) throw err;
    else {
      res.json({ status: "Inventario agregado" });
    }
  });
}); */
//Agregar inventario 2.0
export const addInventario = async (req, res) => {
  const { descripcion, cantidad, peso_kg, area_m2, peso_total, area_total } = req.body;

  try {
    const sql = `INSERT INTO inventario (descripcion, cantidad, peso_kg, area_m2, peso_total, area_total) VALUES (?, ?, ?, ?, ?, ?)`;
    const values = [descripcion, cantidad, peso_kg, area_m2, peso_total, area_total];
    await  pool2.query(sql, values);
    res.json({ status: "Inventario agregado" });
  } catch (error) {
    return res.status(500).json({ message: "Error al agregar el inventario" });
  }
};


//eliminar inventario
/* router.delete("/:id", (req, res) => {
  const { id } = req.params;

  let sql = `delete from tb_equipo where id_equipo = '${id}'`;
   pool2.query(sql, (err, rows, fields) => {
    if (err) throw err;
    else {
      res.json({ status: "equipo eliminado" });
    }
  });
}); */
//eliminar inventario 2.0
export const deleteEquipo = async (req, res) => {
  const { id } = req.params;
  try {
    const sql = `DELETE FROM tb_equipo WHERE id_equipo = ?`;
    await  pool2.query(sql, [id]);
    res.json({ status: "Equipo eliminado" });
  } catch (error) {
    return res.status(500).json({ message: "Error al eliminar el equipo" });
  }
};

//Modificar Inventario
/* router.put("/:id", (req, res) => {
  const { id } = req.params;
  const { descripcion, cantidad, peso_kg, area_m2, peso_total, area_total } = req.body;

  let sql = `UPDATE inventario SET descripcion = ?, cantidad = ?, peso_kg = ?, area_m2 = ?, peso_total = ?, area_total = ? WHERE id_inventario = ?`;

   pool2.query(sql, [descripcion, cantidad, peso_kg, area_m2, peso_total, area_total, id], (err, rows, fields) => {
    if (err) {
      throw err;
    } else {
      res.json({ status: "inventario modificado" });
    }
  });
}); */
//Modificar Inventario 2.0 
export const updateInventario = async (req, res) => {
  const { id } = req.params;
  const { descripcion, cantidad, peso_kg, area_m2, peso_total, area_total } = req.body;

  try {
    const sql = `UPDATE inventario SET descripcion = ?, cantidad = ?, peso_kg = ?, area_m2 = ?, peso_total = ?, area_total = ? WHERE id_inventario = ?`;
    await  pool2.query(sql, [descripcion, cantidad, peso_kg, area_m2, peso_total, area_total, id]);
    res.json({ status: "Inventario modificado" });
  } catch (error) {
    return res.status(500).json({ message: "Error al modificar el inventario" });
  }
};


//----------------------Login Registrar Usuario --------------------//
//Registar Usuario 2.0
export const registerUser = async (req, res) => {
  const { email, password, name } = req.body;

  try {
    const sql = `INSERT INTO users (email, password, name) VALUES (?, ?, ?)`;
    await  pool2.query(sql, [email, password, name]);
    res.json({ status: "Registrado con éxito" });
  } catch (error) {
    throw error;
  }
};


//Post de login
/* router.post("/login", (req, res) => {
  const { email, password } = req.body;

  // Verificar si el correo electrónico y la contraseña son válidos
  let sql = `SELECT * FROM users WHERE email = '${email}' AND password = '${password}'`;
   pool2.query(sql, (err, rows, fields) => {
    if (err) {
      console.log(err);
      res.status(500).json({ error: "Error interno del servidor" });
    } else if (rows.length == 0) {
      // No se encontró un usuario con ese correo electrónico y contraseña
      res.status(401).json({ error: "Credenciales inválidas" });
    } else {
      // Se encontró un usuario con ese correo electrónico y contraseña
      const user = {
        id: rows[0].id,
        name: rows[0].name,
        email: rows[0].email,
      };
      res.status(200).json({ message: "Inicio de sesión exitoso", user: user });
    }
  });
}); */
//Post de login 2.0
export const loginUser = async (req, res) => {
  const { correo, clave } = req.body;

  try {
    const sql = `INSERT INTO usuarios (correo, clave, name) VALUES (?, ?, ?)`;
    const [rows] = await pool.query(sql, [correo, clave]);

    if (rows.length === 0) {
      res.status(401).json({ error: "Credenciales inválidas" });
    } else {
      const user = {
       // id: rows[0].id,
        correo: rows[0].name,
        clave: rows[0].email,
      };
      res.status(200).json({ message: "Inicio de sesión exitoso", user });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Error interno del servidor en loginUser" });
  }
};

//get usuario
/* router.get("/info", (req, res) => {
  const { name } = req.body;
  let sql = `SELECT * FROM users WHERE name = '${name}'`;
   pool2.query(sql, (err, rows, fields) => {
    if (err) throw err;
    else {
      res.json(rows);
    }
  });
}); */
//GET user 2.0 
export const getUserInfo = async (req, res) => {
  const { name } = req.query;

  try {
    const sql = `SELECT * FROM users WHERE name = ?`;
    const [rows] = await pool2.query(sql, [name]);
    res.json(rows);
  } catch (error) {
    throw error;
  }
};

//get user comparational
/* router.get("/validateEmail/:email", (req, res) => {
  const email = req.params.email;
  let sql = `SELECT * FROM users WHERE email = '${email}'`;
   pool2.query(sql, (err, rows, fields) => {
    if (err) throw err;
    else {
      if (rows.length > 0) {
        res.status(200).json({
          message: "El correo electrónico ya existe en la tabla de usuarios",
          email: true,
        });
      } else {
        res.status(200).json({
          message: "El correo electrónico no existe en la tabla de usuarios",
          email: false,
        });
      }
    }
  });
}); */
//Validar email 2.0
export const validateEmail = async (req, res) => {
  const email = req.params.email;

  try {
    const sql = `SELECT * FROM users WHERE email = ?`;
    const [rows] = await  pool2.query(sql, [email]);

    if (rows.length > 0) {
      res.status(200).json({
        message: "El correo electrónico ya existe en la tabla de usuarios",
        email: true,
      });
    } else {
      res.status(200).json({
        message: "El correo electrónico no existe en la tabla de usuarios",
        email: false,
      });
    }
  } catch (error) {
    throw error;
  }
};


//----------------------Login Registrar Usuario --------------------//

export default router;
