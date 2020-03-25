/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.productos;

import database.DBProductos;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.productos.Productos;

/**
 *
 * @author eandr
 */
@WebServlet(name = "CargarProducto", urlPatterns = {"/CargarProducto"})
public class CargarProducto extends HttpServlet {

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
        Productos p = new Productos();
        DBProductos producDB = new DBProductos();
        try  {
            int conId = Integer.parseInt(request.getParameter("idx"));
            String opc = request.getParameter("opc");
            out.write(opc);
            ResultSet res = producDB.getMenuById(conId);
            if (res.next()){
                p.setIdProducto(res.getInt("idProducto"));
                p.setNombre(res.getString("nombre"));
                p.setDescripcion(res.getString("descripcion"));
                p.setValor(res.getInt("valor"));
                p.setIdCategoria(res.getInt("idCategoria"));;
                p.setCantidad(res.getInt("cantidad"));
                
            }
            if(opc.equals("edit")){
                request.getSession().setAttribute("productos", p);
                response.sendRedirect("EditarProducto.jsp");
            }
            if(opc.equals("delete")){
                producDB.borrarMenu(p);
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
