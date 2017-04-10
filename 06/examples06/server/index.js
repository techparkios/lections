var express = require('express')
var pause = require('connect-pause')
var serveStatic = require('serve-static')
var morgan = require('morgan')

var app = express()

app.use(morgan('dev'))
app.use(pause(15 * 1000))
app.use(serveStatic('./public'))

app.listen(3000)

