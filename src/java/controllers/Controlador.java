/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Carrito;
import modelo.Producto;
import modelo.ProductoDAO;

public class Controlador extends HttpServlet {

    ProductoDAO pdao = new ProductoDAO();
    List<Producto> productos = new ArrayList();
    List<Carrito> listaCarrito = new ArrayList();
    Producto p = new Producto();
    Carrito car = new Carrito();
    int item;
    double totalPago = 0.0;
    int cantidad = 1;
    int idp;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        String accion = request.getParameter("accion");

        switch (accion) {
            case "1"://comprar
                totalPago = 0.0;
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarPorID(idp);
                item = item + 1;
                car = new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombre(p.getNombre());
                car.setImagen("http://localhost:8080/CarritoCompras/imgs/" + p.getFoto());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(p.getPrecio() * cantidad);
                listaCarrito.add(car);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPago = totalPago + listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("totalPago", totalPago);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
            case "2"://agregarCarrito
                int pos = 0;
                cantidad = 1;
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarPorID(idp);
                if (listaCarrito.size() > 0) {
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if (idp == listaCarrito.get(i).getIdProducto()) {
                            pos = i;
                        }
                    }
                    if (idp == listaCarrito.get(pos).getIdProducto()) {
                        cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                        double subtotal = listaCarrito.get(pos).getPrecioCompra() * cantidad;
                        listaCarrito.get(pos).setCantidad(cantidad);
                        listaCarrito.get(pos).setSubTotal(subtotal);

                    } else {
                        item = item + 1;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(p.getId());
                        car.setNombre(p.getNombre());
                        car.setImagen("http://localhost:8080/CarritoCompras/imgs/" + p.getFoto());
                        car.setPrecioCompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(p.getPrecio() * cantidad);
                        listaCarrito.add(car);
                    }
                } else {
                    item = item + 1;
                    car = new Carrito();
                    car.setItem(item);
                    car.setIdProducto(p.getId());
                    car.setNombre(p.getNombre());
                    car.setImagen("http://localhost:8080/CarritoCompras/imgs/" + p.getFoto());
                    car.setPrecioCompra(p.getPrecio());
                    car.setCantidad(cantidad);
                    car.setSubTotal(p.getPrecio() * cantidad);
                    listaCarrito.add(car);
                }
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);

                break;
            case "3"://carrito
                totalPago = 0.0;
                request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPago = totalPago + listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("totalPago", totalPago);

                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
            case "4"://borrarArticulo

                int idpro = Integer.parseInt(request.getParameter("idproducto"));
                // out.print("ID: " + idpro);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdProducto() == idpro) {
                        listaCarrito.remove(i);

                    }
                }
                request.setAttribute("carrito", listaCarrito);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
                /*************************************************************************/
            case "5"://Actualizar carrito

                int idPro = Integer.parseInt(request.getParameter("idp"));
               int cant = Integer.parseInt(request.getParameter("cantidad"));
               
               out.println("Cantidad=" +  cant);

                for (int i = 0; i < listaCarrito.size(); i++) {

                    if (listaCarrito.get(i).getIdProducto() == idPro) {
                       

                        
                        listaCarrito.get(i).setCantidad(cant);
                        out.println("cantDespues: " + listaCarrito.get(i).getCantidad());
                        double sub = listaCarrito.get(i).getPrecioCompra() * cant;
                        listaCarrito.get(i).setSubTotal(sub);
                        out.println("SubtotalDespues: " + listaCarrito.get(i).getSubTotal());

                    }

                }

                request.setAttribute("carrito", listaCarrito);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
                /*************************************************************************/
            default:
                productos = pdao.listar();
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
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
