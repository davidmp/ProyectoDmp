/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

localStorage=null;

function validarLogin(){
    var usuario = document.getElementById("usuario").value;
    var clave = document.getElementById("password").value;   
    var resulTRows="";  
    if(mydb){
    mydb.transaction(function(tx) { 
      tx.executeSql('SELECT idpersona, usuario, clave FROM persona WHERE usuario = ? and clave = ?', [usuario,clave], function(thisTx, results) {
        var numRows = results.rows.length;   

        if (numRows===1) {
          resulTRows= results.rows.item(0).idpersona; 
          localStorage.setItem("Nombre", "INICIO_SESION"); 
          localStorage.setItem("IdPersona", resulTRows);  

          document.location.href="mainPersona.html";        
        }else{

         alert("Usuario y Contraseña invalidos");

        }
      }, null);
    });
    }else{
          alert("db no");
          return "";
    }
}