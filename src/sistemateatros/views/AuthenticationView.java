package sistemateatros.views;

import javax.swing.*;

/**
 * Vista para iniciar sesion
 */
public class AuthenticationView {

    private JFrame frame;
    private JPanel jPanel;
    private JTabbedPane sysAdminTab;
    private JTextField sysAdminUsernameField;
    private JButton loginSysAdminBtn;
    private JPasswordField sysAdminPasswordField;
    private JLabel sysAdminLoginTitle;

    public AuthenticationView() {
        this.frame = new JFrame("Iniciar Sesion");
        this.frame.setContentPane(this.jPanel);
        this.frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.frame.pack();
        this.frame.setSize(700, 500);
    }

    public void setVisible() {
        this.frame.setVisible(true);
    }

    public void displayMessage(String message, boolean success) {
        JOptionPane.showMessageDialog(this.frame, message, success ? "EXITO" : "ERROR",
                success ? JOptionPane.INFORMATION_MESSAGE : JOptionPane.ERROR_MESSAGE);
    }

    public String getUsername() {
        return this.sysAdminUsernameField.getText();
    }

    public String getPassword() {
        return new String(this.sysAdminPasswordField.getPassword());
    }

    public void close() {
        this.frame.dispose();
    }

    public JButton getLoginSysAdminBtn() {
        return loginSysAdminBtn;
    }
}
