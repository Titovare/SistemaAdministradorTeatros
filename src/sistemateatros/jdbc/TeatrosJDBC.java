package sistemateatros.jdbc;

import sistemateatros.daos.TeatrosDAO;
import sistemateatros.models.Bloque;
import sistemateatros.models.Teatro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Clase para teatros en la BD
 */
public class TeatrosJDBC implements TeatrosDAO {

    private Connection connection;

    /**
     * Configura la conexion que debe usar
     * @param connection La conexion de la base de datos
     */
    @Override
    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    /**
     * Obtiene todos los teatros
     * @return Todos los teatros de la base de datos
     */
    @Override
    public ArrayList<Teatro> getTeatros() {
        ArrayList<Teatro> teatros = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("EXEC GetTeatros");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Teatro teatro = new Teatro();
                teatro.setId(resultSet.getInt("Id"));
                teatro.setNombre(resultSet.getString("Nombre"));
                teatro.setSitioWeb(resultSet.getString("SitioWeb"));
                teatro.setCorreo(resultSet.getString("Correo"));
                teatro.setCapacidad(resultSet.getInt("Capacidad"));
                teatro.setTelefonoAdministracion(resultSet.getString("TelefonoAdministracion"));
                teatro.setTelefonoBoleteria(resultSet.getString("TelefonoBoleteria"));
                teatros.add(teatro);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return teatros;
    }

    /**
     * Obtiene el teatro por el nombre
     * @param nombre El nombre del teatro
     * @return Un teatro
     */
    @Override
    public Teatro getTeatroByNombre(String nombre) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("EXEC GetByNombreTeatros ?");
            preparedStatement.setString(1, nombre);
            ResultSet resultSet = preparedStatement.executeQuery();
            boolean teatroFound = resultSet.next();
            if (!teatroFound) {
                return null;
            }
            Teatro teatro = new Teatro();
            teatro.setNombre(resultSet.getString("Nombre"));
            return teatro;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Crea un teatro nuevo
     * @param teatro El teatro nuevo
     */
    @Override
    public void crearTeatro(Teatro teatro) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("EXEC CreateTeatros ?, ?, ?, ?, ?, ?");
            preparedStatement.setString(1, teatro.getNombre());
            preparedStatement.setInt(2, 0);
            preparedStatement.setString(3, teatro.getCorreo());
            preparedStatement.setString(4, teatro.getSitioWeb());
            preparedStatement.setString(5, teatro.getTelefonoAdministracion());
            preparedStatement.setString(6, teatro.getTelefonoBoleteria());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Obtiene un bloque por nombre
     * @param idTeatro El id del teatro de ese bloque
     * @param nombre El nombre de ese bloque
     * @return El bloque con el nombre deseado
     */
    @Override
    public Bloque getBloqueByNombre(int idTeatro, String nombre) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("EXEC GetByNombreBloques ?, ?");
            preparedStatement.setString(1, nombre);
            preparedStatement.setInt(2, idTeatro);
            ResultSet resultSet = preparedStatement.executeQuery();
            boolean bloqueFound = resultSet.next();
            if (!bloqueFound) {
                return null;
            }
            Bloque bloque = new Bloque();
            bloque.setNombre(resultSet.getString("Nombre"));
            return bloque;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Obtiene los bloques de un teatro
     * @param idTeatro El id de ese teatro
     * @return Los bloques de ese teatro
     */
    @Override
    public ArrayList<Bloque> getBloquesByIdTeatro(int idTeatro) {
        ArrayList<Bloque> bloques = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("EXEC GetByTeatroIdBloques ?");
            preparedStatement.setInt(1, idTeatro);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Bloque bloque = new Bloque();
                bloque.setId(resultSet.getInt("Id"));
                bloque.setNombre(resultSet.getString("Nombre"));
                bloque.setIdTeatro(resultSet.getInt("IdTeatro"));
                bloques.add(bloque);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return bloques;
    }

    /**
     * Crea un bloque nuevo
     * @param bloque Los datos del bloque nuevo
     */
    @Override
    public void crearBloque(Bloque bloque) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("EXEC CreateBloques ?, ?");
            preparedStatement.setString(1, bloque.getNombre());
            preparedStatement.setInt(2, bloque.getIdTeatro());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
