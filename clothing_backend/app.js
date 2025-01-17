const express = require('express');
const app = express();
const cors = require('cors')
// const pool = require('./database/db');
const PORT = 3000;

const owners = require('./routes/owners');
const locations = require('./routes/locations');
const clothing = require('./routes/clothing');

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Welcome to the clothing DB');
})

app.use('/owners', owners);
app.use('/locations', locations);
app.use('/clothing', clothing);


app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});