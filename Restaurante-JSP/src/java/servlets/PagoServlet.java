/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.pago.Efectivo;
import logica.pago.Tarjeta;
import logica.pago.TipoPago;

/**
 *
 * @author eandr
 */
@WebServlet(name = "PagoServlet", urlPatterns = {"/PagoServlet"})
public class PagoServlet extends HttpServlet {
        static TipoPago tp;
            static public void pagando(TipoPago tipoP){
                tipoP.pagar();
                tp = tipoP;
            }
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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        String Tipo = request.getParameter("TipoPago");
        out.write(Tipo);      
        if (Tipo.equalsIgnoreCase("Tarjeta")){
            Tarjeta T = new Tarjeta();
            //T.pagar();
            pagando(T);
            request.getSession().setAttribute("rutina", T);
        }else if(Tipo.equalsIgnoreCase("Efectivo")){
            Efectivo E = new Efectivo();
            pagando(E);
            request.getSession().setAttribute("rutina", E);
        }
        try{   
            
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Pago</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println("<h1>" + tp.getTipoDePago()+ "</h1>");
            out.println("</body>");
            out.println("</html>");*/
            response.sendRedirect("menu.jsp");
        }catch(Exception e){
            
        }finally {            
            //out.close();
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
