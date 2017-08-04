express = require('express')
app = express()
mongoose = require('mongoose')
passport = require("passport")
bodyParser = require("body-parser")
User = ("/user")
LocalStrategy = require("passport-local")
passportLocalMongoose = require("passport-local-mongoose")

mongoose.connect('mongodb://localhost/test2')
app.set("view engine", "ejs")
app.use(bodyParser.urlencoded({extended: true}))
app.use(require("express-session"),{
  secret: "wah wah wah wah wah",
  resave: false,
  saveUnitialized: false
})

app.use(passport.initialize())
app.use(passport.session())

passport.use(new LocalStrategy(User.authenticcate()))
passport.serializeUser(User.serializeUser())
passport.deserilizeUser(User.deserilizeUser())

app.get('/', (req, res) ->
  res.send('index')
)

app.get('/secret', (req, res) ->
  res.render("secret")
)

app.listen(3000, ->
  console.log('Example app listening on port 3000!')
)