<%-- 
    Document   : index
    Created on : 10/04/2015, 12:23:37 AM
    Author     : Intel
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.to.Personas"%>
<%@page import="pe.edu.upeu.dao.PersonaDAO"%>
<%@page import="pe.edu.upeu.util.DBconn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>UPeU</title> 
        <script type="text/javascript">
            function url(urlx){
                window.location.href=urlx;
            }            
        </script>
        
    </head>
    <body>
    <%
    String opt=request.getParameter("opt")==null ? "O":request.getParameter("opt");       
    String dato=request.getParameter("dato")==null ? "":request.getParameter("dato");       
    %>
        
        <!-- comentario en HTML -->
    <center>
        
        <table>
            <tr>
                <td>
                    <form action="main.jsp" method="post" id="formBuscar">
                        Nombre Persona: <input type="text" name="dato" value="" size="60px" />
                        <input type="hidden" name="opt" value="B" />
                        <input type="submit" value="Buscar" name="btnBuscar" />
                        <input type="button" onclick="url('FormPersona.jsp')"  value="Nuevo" name="btnNew" />
                    </form>                    
                </td>                
            </tr>            
        </table>
        
        <table border="1"> 
            <thead style="background-color: aquamarine">
                <tr><td colspan="9" align="center" ><b>Reporte de Personas</b></td> </tr>    
            <tr>                
                <th>#</th>
                <th>Nombre</th>
                <th>A. Paterno</th>
                <th>A. Materno</th>
                <th>Doc. Indent.</th>
                <th>F. Nacimiento</th>
                <th>Genero</th>
                <th>Correo</th>                
                <th>Usuario</th>
                <th>Opciones</th>
            </tr>
            </thead>
            <tbody>
        <%
            /*
            comentario            
            */                        
            PersonaDAO dao=new PersonaDAO();
            ArrayList<Personas> data=null;
            int i=0;
            try{
                if(opt.equals("B")){
                    data=(ArrayList<Personas> )dao.buscarPersona(dato);
                }else{
                    data=(ArrayList<Personas> )dao.reportarPersonasDos();
                }
            if(data!=null){    
            for(Personas to:data){            
               // out.print("Nombre: "+to.getNombre()+"\t Usuario: "+to.getUsuario()+"<br>"); //Salto de linea <br>
                %>                
                <tr>
                    <td><%=++i %>  </td>    
                    <td> <%=to.getNombre() %> </td>                       
                    <td> <%=to.getApellido_pat() %> </td>
                    <td> <%=to.getApellido_mat() %> </td>
                    <td> <%=to.getId_docidentidad() %> </td>
                    <td> <%=to.getFecha_nacimiento() %> </td>
                    <td> <% if(to.getGenero().equals("M")){ out.print("Masculino"); }else{out.print("Femenino");} %> </td>
                    <td> <%=to.getCorreo() %> </td>                    
                    <td> <% out.print(to.getUsuario()); %> </td>
                    <td> 
                        <a href="control.jsp?opt=E&idpersona=<%=to.getId_persona() %>">Eliminar</a>  
                        <a href="FormUPersona.jsp?idpersona=<%=to.getId_persona() %>">Modificar</a>  
                    </td>
                </tr>                                
            <%
            }
            }else{
            out.print("No existe Datos");
            }
            }catch(Exception e){ out.print(e.getMessage());}                        
        %>
            </tbody>
        </table>  
    </center>            
    </body>
    

    
</html>
