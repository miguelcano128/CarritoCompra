/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author migue
 */
public class altaArticulosController extends HttpServlet {

    Connection conn;
    Conexion cn = new Conexion();
    PreparedStatement stm;
    String url = "jdbc:mysql://localhost:3306/carrito";
    String user = "root";
    String pass = "";

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
//          out.print("altaArticulosController");
        String nom = request.getParameter("nombre");
        String arch = request.getParameter("archivo");
        String desc = request.getParameter("descripcion");
        double prec = Double.parseDouble(request.getParameter("precio"));        
        int cant = Integer.parseInt(request.getParameter("cantidad"));
        double descuento = 0.0;
        String insertarArticulo = "INSERT INTO producto(nombre, foto, descripcion, precio, stock, descuento, precioInicial) VALUES (?,?,?,?,?.?,?)";
        
        try {
            conn = cn.getConection();
            conn = DriverManager.getConnection(url, user, pass);
            stm = conn.prepareStatement(insertarArticulo);
            
            stm.setString(1, nom);
            stm.setString(2, arch);
            stm.setString(3, desc);
            stm.setDouble(4, prec);            
            stm.setInt(5, cant);
            stm.setDouble(6, descuento);
            stm.setDouble(7, prec);
            stm.executeUpdate();
            
            stm.close();
            conn.close();
            response.sendRedirect("formAltaArticulo.jsp");
        } catch (SQLException e) {
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
