const express = require("express");

const { Sequelize } = require("sequelize");

const sequelize = new Sequelize(process.env.DATABASE_URL, {
  dialect: "postgres"
});

const app = express();

app.use(express.json());

const dataList = [];

app.get("/data", (req, res) => {
  res.status(200).send(dataList);
  return;
});

app.post("/data", (req, res) => {
  let data = req.body;
  dataList.push(data);
  res.status(200).send(data);
  return;
});

app.listen({ port: 8080 }, () => {
  try {
    sequelize.authenticate();
    console.log("Connected to database");
  } catch (error) {
    console.log("Could not connect to database", error);
  }
  console.log("Server is running");
});
