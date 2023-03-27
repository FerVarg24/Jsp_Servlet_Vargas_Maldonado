/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.gerdoc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alumno
 */
public class ClienteList extends HttpServlet
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
         
            List<Cliente> clientes = null;
            HttpSession session = null;
            
            session = request.getSession( );
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM\" crossorigin=\"anonymous\"></script>");
            out.println("<title>Servlet ClienteList</title>");            
            out.println("</head>");
            out.println("<body style=\"background-color: #F7FFF7\">");
            out.println("<table class=\"table table-dark table-hover\"");
            out.println("<tr class=\"table-success\">");
            out.println("<td>Nombre</td>");
            out.println("<td>Apellido Paterno</td>");
            out.println("<td>Apellido Materno</td>");
            out.println("<td>Edad</td>");
            out.println("<td>Acciones</td>");
            out.println("</tr");
            
 
            
            clientes = (List<Cliente>) session.getAttribute("clientes" );
            String id = null;
            String borrar = null;
            
            id = request.getParameter( "id" );
            borrar = request.getParameter( "borrar" );
            if( "Submit".equals( borrar ) )
            {
                clientes.remove( Integer.parseInt(id) );
            }
            if( clientes != null && !clientes.isEmpty() )
            {
                int j=0;
                for( Cliente cliente : clientes )
                {
               
                    out.println("<tr >");
                
                    out.println( String.format( "<td>%s</td>" , cliente.getNombre() ) );
                    out.println( String.format( "<td>%s</td>" , cliente.getApellidoP() ) );
                    out.println( String.format( "<td>%s</td>" , cliente.getApellidoM() ) );
                    out.println( String.format( "<td>%d</td>" , cliente.getEdad() ) );
                    out.println( String.format( "<td>%s</td>" , "<a href=\"ClienteList?id=" + j +"&borrar=Submit\">Borrar</a> " ) );
                    out.println("</tr>");
                    j++;
                }
            }

            out.println("</table>");
            out.println("<a href=\"AgregaCliente\">Nuevo cliente</a> ");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
