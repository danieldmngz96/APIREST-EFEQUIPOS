import express from "express";
import morgan from "morgan";
import cors from "cors";
import almacenRoutes from "./routes/almacen.routes.js";
import bd_efequiposRoutes from "./routes/bd_efequipos.routes.js";
import indexRoutes from "./routes/index.routes.js";

const app = express();

// Middlewares
app.use(morgan("dev"));
app.use(express.json());
//Evitar error de cors
app.use(cors());

// Routes
app.use("/", indexRoutes);
app.use("/almacen", almacenRoutes);
app.use("/bd_efequipos", bd_efequiposRoutes);

app.use((req, res, next) => {
  res.status(404).json({ message: "Not found" });
});

export default app;
