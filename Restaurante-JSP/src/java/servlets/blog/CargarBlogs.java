/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.blog;

import database.DBBlog;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.blog.Blog;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CargarBlogs", urlPatterns = {"/CargarBlogs"})
public class CargarBlogs extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        Blog b = new Blog();
        DBBlog blogDB = new DBBlog();
        try  {
            int conId = Integer.parseInt(request.getParameter("idx"));
            String opc = request.getParameter("opc");
            out.write(opc);
            ResultSet res = blogDB.getBlogById(conId);
            if (res.next()){
                b.setIdBlog(res.getInt("idBlog"));
                b.setTitulo(res.getString("titulo"));
                b.setContenido(res.getString("contenido"));
                b.setImagen(res.getString("imagen"));                
            }
            if(opc.equals("edit")){
                request.getSession().setAttribute("blog", b);
                response.sendRedirect("EditarBlog.jsp");
            }
            if(opc.equals("delete")){
                blogDB.borrarBlog(b);
                response.sendRedirect("InicioProductos");
            }
            
        }catch(Exception e){
            
        }finally {            
            out.close();
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
