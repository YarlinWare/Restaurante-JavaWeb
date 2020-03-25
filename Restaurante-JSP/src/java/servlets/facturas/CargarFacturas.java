/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.facturas;

import database.DBFacturas;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.facturas.Facturas;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CargarFacturas", urlPatterns = {"/CargarFacturas"})
public class CargarFacturas extends HttpServlet {

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
        
        Facturas f = new Facturas();
        DBFacturas conDB = new DBFacturas();
        try {
            int factura_Id = Integer.parseInt(request.getParameter("idx"));
            String opc = request.getParameter("opc");
            out.write(opc);
            ResultSet res = conDB.getFacturasById(factura_Id);
            if(res.next()){
                f.setIdFactura(res.getInt("idFactura"));
                f.setIdPedido(res.getInt("idPedido"));
                f.setFecha(res.getString("fecha"));
                f.setNeto(res.getDouble("valorNeto"));
                f.setTotal(res.getDouble("valorTotal"));
                f.setPropina(res.getDouble("propina"));
                f.setIVA(res.getDouble("iva"));
                f.setEstado(res.getBoolean("estado"));
                f.setPago(res.getBoolean("pago"));
            }            
            if(opc.equals("edit")){
                request.getSession().setAttribute("facturas", f);
                response.sendRedirect("Listfacturas.jsp");
            }
            if(opc.equals("delete")){
                conDB.borrarFacturas(f);
                response.sendRedirect("Listfacturas.jsp");
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
