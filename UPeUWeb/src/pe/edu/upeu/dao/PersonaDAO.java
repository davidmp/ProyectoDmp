/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import pe.edu.upeu.to.DocIdentidad;
import pe.edu.upeu.to.Personas;
import pe.edu.upeu.util.DBconn;

/**
 *
 * @author Intel
 */
public class PersonaDAO extends DBconn{
    
    public void reportarPersonas(){
        try {
            conexionDB();
            sql="select * from glo_persona; ";//escribiendo la consulta 
            //conexion a base de datos
            ps=con.prepareStatement(sql);//preparando la consulta
            rs=ps.executeQuery();//Ejecutando la consulta y almacena los resultados en rs
            while (rs.next()) {
            System.out.println("Nombre: "+rs.getString("nombre")+"\t id: "+rs.getInt("id_persona")+"\tUsuario: "+ 
                rs.getString("usuario"));                
            }
            
        } catch (Exception e) { System.out.println("Error al Reportar: "+e.getMessage());
        }
        
        finally{
        cerrarConexionDB();
        }
    }
    
    public void reportarPersonasX() throws Exception{
 
            conexionDB();
            sql="select * from glo_persona; ";//escribiendo la consulta 
            //conexion a base de datos
            ps=con.prepareStatement(sql);//preparando la consulta
            rs=ps.executeQuery();//Ejecutando la consulta y almacena los resultados en rs
            while (rs.next()) {
            System.out.println("Nombre: "+rs.getString("nombre")+"\t id: "+rs.getInt("id_persona")+"\tUsuario: "+ 
                rs.getString("usuario"));                
            }
            
       
        
  
    }
    
    public ArrayList reportarPersonasDos(){           
        ArrayList<Personas> data=new ArrayList();                
        Personas persona;                
        try {
            sql="select * from glo_persona ";//escribiendo la consulta 
            conexionDB();//conexion a base de datos
            ps=con.prepareStatement(sql);//preparando la consulta
            rs=ps.executeQuery();//Ejecutando la consulta y almacena los resultados en rs
            while (rs.next()) {               
                persona=new Personas();
                persona.setId_persona(rs.getInt("id_persona"));
                persona.setId_docidentidad(rs.getInt("id_docidentidad"));
                persona.setNombre(rs.getString("nombre"));
                persona.setApellido_pat(rs.getString("apellido_pat"));
                persona.setApellido_mat(rs.getString("apellido_mat"));
                persona.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                persona.setGenero(rs.getString("genero"));
                persona.setCorreo(rs.getString("correo"));
                persona.setUsuario(rs.getString("usuario"));                 
                data.add(persona);                
               // System.out.println("Nombre: "+rs.getString("nombre")+"\t id: "+rs.getInt("id")+"\tCelular: "+rs.getString("celular"));                
            }            
        } catch (Exception e) { System.out.println("Error al Reportar: "+e.getMessage());
        }        
        finally{
        cerrarConexionDB();
        }
       return data;
    }  
    
    
    public ArrayList reportarDocIndentidad(){           
        ArrayList<DocIdentidad> data=new ArrayList();                
        DocIdentidad doci;                
        try {
            sql="SELECT * FROM glo_docidentidad WHERE estado=1 ";//escribiendo la consulta 
            conexionDB();//conexion a base de datos
            ps=con.prepareStatement(sql);//preparando la consulta
            rs=ps.executeQuery();//Ejecutando la consulta y almacena los resultados en rs
            while (rs.next()) {               
                doci=new DocIdentidad();
                doci.setId_docidentidad(rs.getInt("id_docidentidad"));
                doci.setNombre(rs.getString("nombre"));
                doci.setEstado(rs.getInt("estado"));                     
                data.add(doci);                
               // System.out.println("Nombre: "+rs.getString("nombre")+"\t id: "+rs.getInt("id")+"\tCelular: "+rs.getString("celular"));                
            }            
        } catch (Exception e) { System.out.println("Error al Reportar: "+e.getMessage());
        }        
        finally{
        cerrarConexionDB();
        }
       return data;
    }    
    
    public void crearPersona(Personas per){
        int i=0;
        try {
            sql="insert into glo_persona( "
            + "id_docidentidad,nombre, "
            + "apellido_pat, apellido_mat,fecha_nacimiento,genero, "
            + "correo, usuario, clave)"
            + " values( ?, ?, ?, ?, ?, ?, ?, ?, ?);";            
            conexionDB();//conexion a base de datos
            ps=con.prepareStatement(sql);
            ps.setInt(++i, per.getId_docidentidad());
            ps.setString(++i, per.getNombre());
            ps.setString(++i, per.getApellido_pat());
            ps.setString(++i, per.getApellido_mat());
            ps.setString(++i, per.getFecha_nacimiento());
            ps.setString(++i, per.getGenero());
            ps.setString(++i, per.getCorreo());
            ps.setString(++i, per.getUsuario());
            ps.setString(++i, per.getClave());
            ps.executeUpdate();                     
        } catch (Exception e) {
            System.out.println("Error al Insertar:"+e.getMessage());
        }
        finally{cerrarConexionDB();}
    }
    
    public boolean eliminarPersona(int idpersona){
        boolean resultado=false;
        try {
            sql=" DELETE FROM glo_persona WHERE id_persona = ? ";            
            conexionDB();
            ps=con.prepareStatement(sql);
            ps.setInt(1, idpersona);
            if(ps.execute()==false){resultado=true;
                System.out.println("Ingreso");
            }else{resultado=false;}
                     
        } catch (SQLException e) { System.out.println("Error al eliminar:" + e.getMessage());}
          catch (Exception e) { System.out.println("Error al eliminar:" + e.getMessage());}
        finally{cerrarConexionDB(); }
        
        return resultado;
    }
    
    public ArrayList buscarPersona(String dato){
        ArrayList data=new ArrayList();
        Personas to;
        try {
            sql=" SELECT * FROM glo_persona WHERE UPPER(CONCAT(nombre,' ',apellido_pat,' ',apellido_mat)) LIKE UPPER(?) ";            
            conexionDB();
            ps=con.prepareStatement(sql);
            ps.setString(1, "%"+dato+"%");
            rs=ps.executeQuery();
            while (rs.next()) {                
                to=new Personas();
                to.setId_persona(rs.getInt("id_persona"));
                to.setId_docidentidad(rs.getInt("id_docidentidad"));
                to.setNombre(rs.getString("nombre"));
                to.setApellido_pat(rs.getString("apellido_pat"));
                to.setApellido_mat(rs.getString("apellido_mat"));
                to.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                to.setGenero(rs.getString("genero"));
                to.setCorreo(rs.getString("correo"));
                to.setUsuario(rs.getString("usuario"));
                data.add(to);
            }
        } catch (SQLException e) { System.out.println("Error al reporta:" + e.getMessage());}
          catch (Exception e) { System.out.println("Error al reporta:" + e.getMessage());}
        finally{cerrarConexionDB(); }        
        return data; 
    }
        
    public Personas buscarPersonaId(int idpersona){
      
        Personas to=null;
        try {
            sql=" SELECT * FROM glo_persona WHERE id_persona=? ";            
            conexionDB();
            ps=con.prepareStatement(sql);
            ps.setInt(1, idpersona);
            rs=ps.executeQuery();
            if(rs.next()) {                
                to=new Personas();
                to.setId_persona(rs.getInt("id_persona"));
                to.setId_docidentidad(rs.getInt("id_docidentidad"));
                to.setNombre(rs.getString("nombre"));
                to.setApellido_pat(rs.getString("apellido_pat"));
                to.setApellido_mat(rs.getString("apellido_mat"));
                to.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                to.setGenero(rs.getString("genero"));
                to.setCorreo(rs.getString("correo"));
                to.setUsuario(rs.getString("usuario"));                
            }
        } catch (SQLException e) { System.out.println("Error al reporta:" + e.getMessage());}
          catch (Exception e) { System.out.println("Error al reporta:" + e.getMessage());}
        finally{cerrarConexionDB(); }        
        return to; 
    }
   
    public boolean actualizarDatosPersona(Personas per){
        int i=0;
        try {
            sql="UPDATE glo_persona SET  id_docidentidad = ? , nombre = ? , apellido_pat = ? , "
                    + " apellido_mat = ?, fecha_nacimiento = ? , genero =? , correo = ?, "
                    + " clave =? WHERE id_persona = ? ;";            
            conexionDB();//conexion a base de datos
            ps=con.prepareStatement(sql);
            ps.setInt(++i, per.getId_docidentidad());
            ps.setString(++i, per.getNombre());
            ps.setString(++i, per.getApellido_pat());
            ps.setString(++i, per.getApellido_mat());
            ps.setString(++i, per.getFecha_nacimiento());
            ps.setString(++i, per.getGenero());
            ps.setString(++i, per.getCorreo());
            ps.setString(++i, per.getClave());
            ps.setInt(++i, per.getId_persona());
            
            ps.executeUpdate();                     
        } catch (Exception e) {
            System.out.println("Error al Actualizar:"+e.getMessage());
        }
        finally{cerrarConexionDB();}
        return false;
    }
    
    
    public static void main(String[] a){
    PersonaDAO per=new PersonaDAO();
    per.reportarPersonas();
    per=new PersonaDAO();
    per.eliminarPersona(3);
    
    }
    
}
