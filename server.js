import express from 'express';
import es6Renderer from 'express-es6-template-engine';
const app = express();


app.use(express.static('public'));
app.engine('html', es6Renderer);
app.set('/html/struct', 'views');
app.set('view engine', 'html');
 
app.get('/', (req, res) => {
  res.render('land')
})

app.get('/calc', (req, res) => {
  res.render('calc')
})

app.get('/todo', (req, res) => {
  res.render('todo')
})

app.get('/port', (req, res) => {
  res.render('port')
})

app.listen(3000,(req,res) =>{
    console.log('started listening at server 3000')
})

