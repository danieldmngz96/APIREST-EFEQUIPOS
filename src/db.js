import express from 'express';
import  mysql  from "mysql2/promise";
import {
  DB_DATABASE,
  DB_HOST,
  DB_PASSWORD,
  DB_PORT,
  DB_USER
} from "./config.js";

// Connect to the first database
export const pool = mysql.createPool({
  host: DB_HOST,
  user: DB_USER,
  password: DB_PASSWORD,
  port: DB_PORT,
  database: DB_DATABASE
});

// Connect to the second database
// export const pool2 = mysql.createPool({
//   host: DB_HOST2,
//   user: DB_USER2,
//   password: DB_PASSWORD2,
//   port: DB_PORT2,
//   database: DB_DATABASE2
// });