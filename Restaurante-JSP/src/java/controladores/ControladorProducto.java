/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import logica.productos.Productos;
import logica.productos.ModeloProducto;

/**
 *
 * @author ASUS
 */
public class ControladorProducto {
    public String getProductos(){
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        for(Productos producto : mp.getAllProductos()){
           htmlcode += "<div class=\"col-sm-4\">\n" +
                        "<div class=\"product-image-wrapper\">\n" +
                        "   <div class=\"single-products\">\n" +
                        "       <div class=\"productinfo text-center\">\n" +
                        "           <img src=\""+producto.getUrl_img()+"\" alt=\"\" />\n" +
                        "           <h2>$"+producto.getValor()+"</h2>\n" +
                        "           <p>"+producto.getNombre()+"</p>\n" +
                        "           <a href=\"product-details.jsp?id="+producto.getIdProducto()+"\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Ver detalles</a>\n" +
                        "       </div>\n" +
                        "       <div class=\"product-overlay\">\n" +
                        "           <div class=\"overlay-content\">\n" +
                        "               <h2>$"+producto.getValor()+"</h2>\n" +
                        "               <p>"+producto.getNombre()+"</p>\n" +
                        "               <a href=\"product-details.jsp?id="+producto.getIdProducto()+"\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Ver Detalles</a>\n" +
                        "           </div>\n" +
                        "       </div>\n" +
                        "   </div>\n" +
                        "   <div class=\"choose\">\n" +
                        "       <ul class=\"nav nav-pills nav-justified\">\n" +
                        "           <li><a href=\"\"><i class=\"fa fa-plus-square\"></i>Add to wishlist</a></li>\n" +
                        "           <li><a href=\"\"><i class=\"fa fa-plus-square\"></i>Add to compare</a></li>\n" +
                        "       </ul>\n" +
                        "   </div>\n" +
                        "  </div>\n" +
                        "</div>";

        }        
        return htmlcode;        
    }
    
    
    public Productos getProducto(int id){
        return new ModeloProducto().getProducto(id);
    }
}
