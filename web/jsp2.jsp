<%-- 
    Document   : jsp2
    Created on : 14 mar 2023, 13:12:32
    Autdor     : alumno
--%>

<%@page import="java.util.List"%>
<%@page import="org.gerdoc.Datos"%>
<%@page import="org.gerdoc.Negocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <div class="p-3 mb-1 bg-light">
        <title>JSP Page</title>
    </head>
    <body style="background-color: #F7FFF7">
        <h1>
            Tabla de Calificaciones <br>         
            <small class="text-muted">Selecciona añadir para agregar otro estudiante</small>
        </h1><br><br>
        <%
            int i = 0;
            List<Datos> lista = null;
            String id = null;
            String borrar = null;
            session = request.getSession( true );
            
            if( session != null )
            {
                if( session.getAttribute("lista") != null )
                {
                    lista = (List)session.getAttribute( "lista" );
                }
            }
            id = request.getParameter( "id" );
            borrar = request.getParameter( "borrar" );
            if( "Submit".equals( borrar ) )
            {
                lista.remove( Integer.parseInt(id) );
            }
        %>
        <div class="btn-group" role="group" aria-label="Basic mixed styles example">
            <button type="button" class="btn btn-success"><a href="jsp1.jsp" class="link-light">Regresar a jsp1</a></button>
            <button type="button" class="btn btn-secondary"><a href="jsp3.jsp" class="link-light">ir a jsp3</a></button>
            <button type="button" class="btn btn-primary"><a href="index.html" class="link-light">Pagina Principal</a></button>
        </div><br><br>
        
        
        <table class="table table-striped table-hover">
            <tr>           
                <td>#</td>
                <td>Id</td>
                <td>Nombre</td>
                <td>Cal</td>
                <td>Acciones</td>
            </tr>
            <%
              if( lista != null && !lista.isEmpty() )
              {
                for( Datos datos : lista)
                {
            %>
            <tr>
                <td><%=i + 1%></td>
                <td><%=i%></td>
                <td><%=datos.getNombre( )%></td>
                <td><%=datos.getCalf()%></td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                        <button type="button" class="btn btn-danger"><a href="jsp2.jsp?id=<%=i%>&borrar=Submit" class="link-light">Borrar</a> </button>
                        <button type="button" class="btn btn-info"><a href="jsp3.jsp?id=<%=i++%>&editar=Submit" class="link-dark">Editar</a> </button>
                    </div>

                </td>
            </tr>
            <%
                }
              }
            %>
           
        </table>
            </div>
    </body>
</html>