import { Router } from "express";
import {
  //Inventarios
  getInventario,
  // getInventarioById,
  addInventario,
  deleteEquipo,
  updateInventario,
  //LOGIN
  registerUser,
  loginUser,
  getUserInfo,
  validateEmail
} from "../controllers/bd_efequipos.controller.js";

const router = Router();
//---------- agregamos rutas para Inventarios--------
// GET all inventario
router.get("/inventario", getInventario);
// GET all inventario por ID
// router.get("/inventario/:id", getInventarioById);
// INSERT un inventario
router.post("/add-inventario", addInventario);
//Modificar inventario
router.put("update/:id", updateInventario);
//Eliminar inventario
router.delete("/inventario/:id", deleteEquipo);

//----------------------Login Registrar Usuario --------------------//
//Registrar Usuarios
router.post("/register", registerUser);
//Login User
router.post("/login", loginUser);
//Trae todos los USUARIOS
router.get("/info", getUserInfo);
//get validar email
router.get("/validateEmail/:email", validateEmail);



export default router;
