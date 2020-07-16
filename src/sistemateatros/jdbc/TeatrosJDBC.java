package sistemateatros.jdbc;

import sistemateatros.daos.TeatrosDAO;
import sistemateatros.models.Teatro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
