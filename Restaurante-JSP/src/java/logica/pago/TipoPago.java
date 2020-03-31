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
public class TipoPago implements PagoInterface{
    String TipoDePago;

    public String getTipoDePago() {
        return TipoDePago;
    }

    public void setTipoDePago(String TipoDePago) {
        this.TipoDePago = TipoDePago;
    }
    
    @Override
    public void pagar(){
        this.TipoDePago="vacio";
    }
}
