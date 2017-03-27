var io = require('socket.io').listen(3000);
io.sockets.on('connection', function (socket) {
    socket.on('mensaje_cliente', function (mensaje) {
        io.sockets.emit("mensaje_servidor", mensaje);
        var str = mensaje;
        var res = str.split("*"); 
        console.log("Usuario: "+res[0] +"   Mensaje: "+res[1]);
    });
});