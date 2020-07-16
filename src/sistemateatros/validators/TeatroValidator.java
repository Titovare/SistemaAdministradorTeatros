package sistemateatros.validators;

import sistemateatros.database.DatabaseConnection;
import sistemateatros.jdbc.TeatrosJDBC;
import sistemateatros.models.Teatro;
import java.util.regex.Pattern;
import java.util.ArrayList;

/**
 * Clase para validar teatros
 */
public class TeatroValidator {

    /**
     * Valida un teatro
     * @param teatro El teatro a validar
     * @return Los errores de validacion
     */
    public static ArrayList<String> validarTeatro (Teatro teatro) {
        ArrayList<String> errores = new ArrayList<String>();
        if (teatro.getNombre().isEmpty() || teatro.getCorreo().length() > 30) {
            errores.add("Nombre invalido");
        }
        if (!validarTelefono(teatro.getTelefonoAdministracion()) || teatro.getTelefonoAdministracion().length() > 9) {
            errores.add("Telefono administracion invalido");
        }
        if (!validarTelefono(teatro.getTelefonoBoleteria()) || teatro.getTelefonoBoleteria().length() > 9) {
            errores.add("Telefono boleteria invalido");
        }
        if (!validarCorreo(teatro.getCorreo()) || teatro.getCorreo().length() > 30) {
            errores.add("Correo invalido");
        }
        if (teatro.getSitioWeb().isEmpty() || teatro.getSitioWeb().length() > 30) {
            errores.add("Sitio web invalido");
        }
        if (errores.size() > 0) {
            return  errores;
        }
        TeatrosJDBC teatrosJDBC = new TeatrosJDBC();
        teatrosJDBC.setConnection(DatabaseConnection.getConnection());
        // Verificar nombre repetido
        Teatro teatroConNombre = teatrosJDBC.getTeatroByNombre(teatro.getNombre());
        if (teatroConNombre != null) {
            errores.add("Nombre ya existe");
        }
        return errores;
    }

    /**
     * Valida los telefonos
     * @param telefono El telefono para validar
     * @return Si el telefono es valido o no
     */
    public static boolean validarTelefono(String telefono) {
        String patternStr = "\\d{4}(-?)\\d{4}";
        Pattern pattern = Pattern.compile(patternStr);
        return pattern.matcher(telefono).matches();
    }

    /**
     * Valida los correos
     * @param correo El correo para validar
     * @return Si el correo es valido o no
     */
    public static boolean validarCorreo(String correo) {
        String patternStr = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
        Pattern pattern = Pattern.compile(patternStr);
        return pattern.matcher(correo).matches();
    }

}