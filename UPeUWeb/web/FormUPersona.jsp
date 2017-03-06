<%-- 
    Document   : FormPersona
    Created on : 28-abr-2015, 12:30:27
    Author     : SistemasUpeu
--%>

<%@page import="pe.edu.upeu.to.DocIdentidad"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.to.Personas"%>
<%@page import="pe.edu.upeu.dao.PersonaDAO"%>
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
<%
int idperson=Integer.parseInt(request.getParameter("idpersona")==null ? "0":request.getParameter("idpersona"));
PersonaDAO dao=new PersonaDAO();
Personas to= dao.buscarPersonaId(idperson);

dao=new PersonaDAO();
ArrayList<DocIdentidad> data=null;
data= (ArrayList<DocIdentidad>)dao.reportarDocIndentidad();
%>        
        
    <center>
        <div>
            <form  action="control.jsp" id="formPersona" method="post" >
                <table>
                <tr> <td colspan="2"> Formulario para Actualizar Datos de Persona </td>  </tr>
                <tr>
                    <td>Nombre:  </td>
                    <td><input type="text" id="nombre" name="nombre" required="true" value="<%=to.getNombre() %>" >  </td>                        
                </tr> 

                <tr>
                    <td>A. Paterno:  </td>
                    <td><input type="text" id="apellpaterno" name="apellpaterno" value="<%=to.getApellido_pat() %>" required="true"></td>                        
                </tr>
                <tr>
                    <td>A. Materno:  </td>
                    <td><input type="text" id="apellmaterno" name="apellmaterno"  value="<%=to.getApellido_mat() %>" required="true"></td>                        
                </tr>
                <tr>
                    <td>DNI:  </td>
                    <td>
                        <select id="dni" name="dni">
                            <% for(DocIdentidad doc:data){ %>
                            <option value="<%=doc.getId_docidentidad() %>" <%if(to.getId_docidentidad()==doc.getId_docidentidad()){out.print("selected");} %>  ><%=doc.getNombre() %></option>                           
                            <% } %>
                        </select>                        
                    </td>                        
                </tr>
                <tr>
                    <td>F.Nacimiento:  </td>
                    <td><input type="date" id="fnacimiento" name="fnacimiento" value="<%=to.getFecha_nacimiento() %>" ></td>                        
                </tr>
                <tr>
                    <td>Genero:  </td>
                    <td> 
                        <select id="genero" name="genero">
                            <option value="M" <%if(to.getGenero().equals("M")){out.print("selected");} %>  >Masculino</option>
                            <option value="F" <%if(to.getGenero().equals("F")){out.print("selected");} %> >Femenino</option>
                        </select> 
                    </td>                        
                </tr>
                <tr>
                    <td>Correo Elec.:  </td>
                    <td><input type="email" id="correo" name="correo" required="true" value="<%=to.getCorreo() %>"></td>                        
                </tr>                    
                <tr>
                    <td colspan="2">Estado: 
                        Activo<input type="radio" name="estado" value="1" checked="true">
                        Desactivo<input type="radio" value="0" name="estado">                    
                    </td>                    
                </tr> 
                   
                <tr>
                    <td>Clave:  </td>
                    <td><input type="password" id="clave" name="clave" required="true" value="<%=to.getClave() %>" ></td>                        
                </tr>                    
                <tr>
                    <td colspan="2" align="center"> 
                        <input type="hidden" id="opt" name="opt" value="U" >
                        <input type="hidden" id="idpersona" name="idpersona" value="<%=to.getId_persona() %>" >
                        <input type="submit" id="btnCrear" value="Modificar">                        
                        <input type="button" id="btnCancelar" value="Cancelar" onclick="url('main.jsp')"> 
                    </td>
                </tr>
                
                
                </table>                
            </form>            
        </div>
    </center>
    </body>
</html>