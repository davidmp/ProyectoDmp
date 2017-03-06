<%@page import="pe.edu.upeu.to.Personas"%>
<%@page import="pe.edu.upeu.dao.PersonaDAO"%>
<%
String opt=request.getParameter("opt")==null?"O":request.getParameter("opt");

String nombre=request.getParameter("nombre");
String apaterno=request.getParameter("apellpaterno");
String amaterno=request.getParameter("apellmaterno");
String fnacimiento=request.getParameter("fnacimiento");
String genero=request.getParameter("genero");
String correo=request.getParameter("correo");
String estado=request.getParameter("estado");
String usuario=request.getParameter("usuario");
String clave=request.getParameter("clave");

PersonaDAO dao=null;
Personas to=null;
if(opt.equals("C")){
dao=new PersonaDAO();
to=new Personas();

to.setNombre(nombre);
to.setId_docidentidad(1);
to.setApellido_pat(apaterno);
to.setApellido_mat(amaterno);
to.setFecha_nacimiento(fnacimiento);
to.setGenero(genero);
to.setCorreo(correo);
to.setUsuario(usuario);
to.setClave(clave);
dao.crearPersona(to);
%>
<jsp:forward page="main.jsp" ></jsp:forward>
<%
}else if(opt.equals("E")){
int idpersona=Integer.parseInt(request.getParameter("idpersona")==null? "0": request.getParameter("idpersona"));
dao=new PersonaDAO();
if(dao.eliminarPersona(idpersona)==true){
%>
<jsp:forward page="main.jsp" ></jsp:forward>
<%
}else{ out.print("Error al Eliminar!");
 }    
}else if(opt.equals("U")){
int idpersona=Integer.parseInt(request.getParameter("idpersona")==null? "0": request.getParameter("idpersona"));
int iddocidentidad=Integer.parseInt(request.getParameter("dni")==null? "0": request.getParameter("dni"));
to=new Personas();
dao=new PersonaDAO();
to.setNombre(nombre);
to.setId_docidentidad(iddocidentidad);
to.setApellido_pat(apaterno);
to.setApellido_mat(amaterno);
to.setFecha_nacimiento(fnacimiento);
to.setGenero(genero);
to.setCorreo(correo);
to.setClave(clave);
to.setId_persona(idpersona);
dao.actualizarDatosPersona(to);

%>
<jsp:forward page="main.jsp" ></jsp:forward>
<%    
}else{
%>
<jsp:forward page="main.jsp" ></jsp:forward>
<% 
}
out.println(nombre+"<br>"+apaterno+"<br>"+amaterno
+"<br>"+fnacimiento+"<br>"+genero+"<br>"+estado
+"<br>"+correo+"<br>"+usuario+"<br>"+clave);
%>


