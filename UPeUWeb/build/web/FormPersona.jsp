<%-- 
    Document   : FormPersona
    Created on : 28-abr-2015, 12:30:27
    Author     : SistemasUpeu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function url(urlx){
                window.location.href=urlx;
            }            
        </script>        
    </head>
    <body>
    <center>
        <div>
            <form  action="control.jsp" id="formPersona" method="post" >
                <table>
                <tr> <td colspan="2"> Formulario de Registro Persona </td>  </tr>
                <tr>
                    <td>Nombre:  </td>
                    <td><input type="text" id="nombre" name="nombre" required="true" >  </td>                        
                </tr> 

                <tr>
                    <td>A. Paterno:  </td>
                    <td><input type="text" id="apellpaterno" name="apellpaterno" required="true"></td>                        
                </tr>
                <tr>
                    <td>A. Materno:  </td>
                    <td><input type="text" id="apellmaterno" name="apellmaterno" required="true"></td>                        
                </tr>
                <tr>
                    <td>F.Nacimiento:  </td>
                    <td><input type="date" id="fnacimiento" name="fnacimiento" ></td>                        
                </tr>
                <tr>
                    <td>Genero:  </td>
                    <td> 
                        <select id="genero" name="genero">
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select> 
                    </td>                        
                </tr>
                <tr>
                    <td>Correo Elec.:  </td>
                    <td><input type="email" id="correo" name="correo" required="true" ></td>                        
                </tr>                    
                <tr>
                    <td colspan="2">Estado: 
                        Activo<input type="radio" name="estado" value="1" checked="true">
                        Desactivo<input type="radio" value="0" name="estado">                    
                    </td>                    
                </tr> 
                <tr>
                    <td>Usuario:  </td>
                    <td><input type="text" id="usuario" name="usuario" required="true" ></td>                        
                </tr>                    
                <tr>
                    <td>Clave:  </td>
                    <td><input type="password" id="clave" name="clave" required="true" ></td>                        
                </tr>                    
                <tr>
                    <td colspan="2"> 
                        <input type="hidden" id="opt" name="opt" value="C" >
                        <input type="submit" id="btnCrear" value="Crear">
                        <input type="reset" id="btnBorrar" value="Limpiar">
                        <input type="button" id="btnCancelar" value="Cancelar" onclick="url('main.jsp')">
                    </td>
                </tr>
                
                
                </table>                
            </form>            
        </div>
    </center>
    </body>
</html>
