import { Router } from "express";
import {
  deleteEmpleado,
  updateEmpleado,
  getEmpleados,
  createEmpleado,
  //despachos
  getDespachos,
  createDespacho,
  //clientes
  getCliente,
  updateCliente,
  addCliente,
  addClienteId,
  getClienteById,
  //pqrs
  Postpqrs,
  getPqrs,
  //Contratos
  getContratos,
  loginUser,
  //Productos
  getProductos,
  getInventarioById
} from "../controllers/almacen.controller.js";

const router = Router();
//---------- agregamos rutas para empleados--------
// GET all Empleados
router.get("/empleados", getEmpleados);
// INSERT un Empleado
router.post("/add-empleado", createEmpleado);
//Modificar empleado
router.put("/:id_empleado", updateEmpleado);
//Eliminar empleado
router.delete("/empleados/:id", deleteEmpleado);

//---------- agregamos rutas para despachos--------
//Trae todos los despachos
router.get("/despachos", getDespachos);
// Agregar  un despacho
router.post("/add-despachos", createDespacho);

//---------- agregamos rutas para clientes--------
// traer todos los clientes 
router.get("/clientes", getCliente);
// Consulta cliente por id
router.get("/clientes/:id", getClienteById);
// Modifica los clientes 
router.put("/modificar/:id", updateCliente);
//agregar cliente
router.post("/add-cliente", addCliente);
// Obtener un cliente por su id
router.get("/cliente/:id", addClienteId);
//---------- agregamos rutas para pqrs--------
// Post de pqrs
router.post("/Postpqrs", Postpqrs);
//Get de pqrs
router.get("/getPqrs", getPqrs);
//---------- agregamos rutas para Contratos--------
//Get de pqrs
router.get("/getContratos", getContratos);
//////////////////////////////////////////////////////
//Login User
router.post("/login", loginUser);
//get productos
router.get("/getProductos", getProductos);
//por id productos
router.get("/getInventarioById/:id", getInventarioById);


export default router;
