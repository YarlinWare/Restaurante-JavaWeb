/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica.pago;

/**
 *
 * @author eandr
 */
public class Efectivo extends TipoPago {
   @Override
   public void pagar(){
       this.TipoDePago="Pago en efectivo";
   }
}
