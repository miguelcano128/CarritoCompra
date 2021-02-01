package modelo;

import java.sql.Connection;
import config.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public Producto listarPorID(int id) {
        String sql = "SELECT * FROM producto WHERE idProducto=" + id;
        Producto p = new Producto();

        try {
            con = cn.getConection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setFoto(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
            }
        } catch (SQLException e) {
        }
        return p;
    }

    public double descuenta(int id, double descuento) {
        double descuen = 0, precioConDescuento = 0, precioSinDescuento = 0, precioInicial = 0;
        Producto p = new Producto();
        String sql = "SELECT * FROM producto WHERE idProducto=" + id;
        try {
            con = cn.getConection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                precioSinDescuento = rs.getDouble("precio");
                descuen = rs.getDouble("descuento");
                precioInicial = rs.getDouble("precio");
            }
            if (descuento > 0) {

                descuen = (precioSinDescuento * descuento) / 100;
                precioConDescuento = precioSinDescuento - descuen;
                //System.out.println("PCD=" + precioConDescuento);
            } else {
                precioConDescuento = precioInicial;
                //System.out.println("PSD=" + precioConDescuento);
            }
        } catch (SQLException e) {
        }

        return precioConDescuento;
    }

    public List listar() {
        List<Producto> productos = new ArrayList();
        String sql = "SELECT * FROM producto";
        try {
            con = cn.getConection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setFoto("http://localhost:8080/CarritoCompras/imgs/" + rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                productos.add(p);
            }
        } catch (SQLException e) {
        }
        return productos;
    }
}
