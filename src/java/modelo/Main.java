/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author migue
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       ProductoDAO pd = new ProductoDAO();
        //System.out.println(pd.descuenta(7));
        System.out.println(pd.descuenta(7, 0));
    }
    
}
