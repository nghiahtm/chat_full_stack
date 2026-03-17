import express from 'express';
import routes from './routes/route.js';
import {HandleError} from './middlewares/middleware.js';
const app = express()
const port = 3000
/// Set Express json
app.use(express.json())


/// Add Routes
app.use('/api',routes)

app.use(HandleError.errorHandler)

app.listen(port ,() => {
  console.log(`Example app listening on port ${port}`)
})