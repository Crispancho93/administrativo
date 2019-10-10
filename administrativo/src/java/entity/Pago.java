/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Crispancho
 */
public class Pago {
    
    private int idPago;
    private String llave;

    public Pago() {
    }

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public String getLlave() {
        return llave;
    }

    public void setLlave(String llave) {
        this.llave = llave;
    }

    @Override
    public String toString() {
        return "Pago{" + "idPago=" + idPago + ", llave=" + llave + '}';
    }
    
    
}
