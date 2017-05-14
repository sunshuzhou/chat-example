app = require('express')()
http = require('http').Server(app)
io = require('socket.io')(http)

app.get '/', (req, res) ->
  res.sendFile __dirname + '/index.html'


io.on 'connection', (socket) ->
  console.log 'a user connected'
  socket.on 'disconnect', ->
    console.log('user disconnected')

  socket.on 'chat message', (msg) ->
    console.log('message: ' + msg)
    io.emit('chat message', msg)

http.listen 3000, ->
  console.log('listening on *:3000')
