/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.usuarios;

import controladores.ControladorLogin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author eandr
 */
@WebServlet(name = "InicioSesion", urlPatterns = {"/InicioSesion"})
public class InicioSesion extends HttpServlet {

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
        
        String usuario = request.getParameter("username");
        String contraseña = request.getParameter("password");
        
        ControladorLogin ctrl = new ControladorLogin();
        HttpSession ObjSesion = request.getSession(true);
        
        
        switch(ctrl.autenticacion(usuario, contraseña)){
            case 1:
                ObjSesion.setAttribute("nivel", "1");
                response.sendRedirect("admin.jsp");
                
                break;
            case 2:
                 ObjSesion.setAttribute("nivel", "2");
                 response.sendRedirect("camarero.jsp");
                break;
            default:
                if (request.getParameter("cerrar")!=null){
                    ObjSesion.invalidate();
                    response.sendRedirect("login.jsp");
                }else{
                    response.sendRedirect("login.jsp"); 
                }
                
                break;
                
        }
        
        
        
        //if(ctrl.autenticacion(usuario, contraseña)){
            
          //  ObjSesion.setAttribute("usuario", usuario);
            //response.sendRedirect("admin.jsp");
        //}else{
          //  if (request.getParameter("cerrar")!=null){
            //ObjSesion.invalidate();
            //response.sendRedirect("login.jsp");
        //}else{
          //  response.sendRedirect("login.jsp");  
            //}
        //}
        
       
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
