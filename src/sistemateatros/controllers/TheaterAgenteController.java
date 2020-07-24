package sistemateatros.controllers;

import net.proteanit.sql.DbUtils;
import sistemateatros.database.DatabaseConnection;
import sistemateatros.jdbc.AgentesJDBC;
import sistemateatros.jdbc.PresentacionesJDBC;
import sistemateatros.jdbc.ProduccionesJDBC;
import sistemateatros.jdbc.TeatrosJDBC;
import sistemateatros.mapper.*;
import sistemateatros.models.*;
import sistemateatros.views.AgentView;

import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.TableModel;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TheaterAgenteController {
    String agente;
    int IdTeatro;
    AgentView agentView;
    Teatro teatro;
    private AgentesJDBC agentesJDBC;
    private ProduccionesJDBC produccionesJDBC;
    private TeatrosJDBC teatrosJDBC;
    private PresentacionesJDBC presentacionesJDBC;
    public  TheaterAgenteController(int IdTeatro,String agente)
    {
        this.agente=agente;
        this.IdTeatro=IdTeatro;
        agentView = new AgentView(IdTeatro,agente);
        this.agentView.setVisible();
        agentesJDBC = new AgentesJDBC();
        agentesJDBC.setConnection(DatabaseConnection.getConnection());
        teatrosJDBC = new TeatrosJDBC();
        teatrosJDBC.setConnection(DatabaseConnection.getConnection());
        produccionesJDBC = new ProduccionesJDBC();
        produccionesJDBC.setConnection(DatabaseConnection.getConnection());
        presentacionesJDBC = new PresentacionesJDBC();
        presentacionesJDBC.setConnection(DatabaseConnection.getConnection());
        this.teatro = teatrosJDBC.getTeatroByID(IdTeatro);
        this.agentView.setTheaterInfo(teatro.getNombre());

        this.agentView.getTabbedAgente().addChangeListener(new changeTabListener());
        this.agentView.getComboTeatros().addItemListener(new compraTeatroListener());
        this.agentView.getTablaProds().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        ListSelectionModel selectionModel = this.agentView.getTablaProds().getSelectionModel();
        selectionModel.addListSelectionListener(new compraTeatroProdsListener());
        this.agentView.getTablaPresent().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        selectionModel = this.agentView.getTablaPresent().getSelectionModel();
        selectionModel.addListSelectionListener(new compraTeatroPresentListener());
        this.agentView.getTablaBloques().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        selectionModel = this.agentView.getTablaBloques().getSelectionModel();
        selectionModel.addListSelectionListener(new compraTeatroBloqueListener());
        this.agentView.getTablaFilas().setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        selectionModel = this.agentView.getTablaFilas().getSelectionModel();
        selectionModel.addListSelectionListener(new compraTeatroFilaListener());



    }
    private class changeTabListener  implements ChangeListener
    {

        @Override
        public void stateChanged(ChangeEvent e) {
            // Verificar cual tabbed pane se esta cargando
            if(agentView.getTabbedAgente().getSelectedIndex() == 3)
            {
                agentView.getComboTeatros().removeAllItems();
                ArrayList<Teatro> teatros = teatrosJDBC.getTeatros();
                agentView.setComboTeatros(teatros);
                ModelTablaProd model= TablaProdMapper.mapRows(new ArrayList<Produccion>());
                agentView.getTablaProds().setModel(model);
                ModelTablaProd model2 = TablaPresenMapper.mapRows(new ArrayList<Presentacion>());
                agentView.getTablaPresent().setModel(model2);
                ModelTablaBloquePrecios model3 = TablaBloquePreciosMapper.mapRows(new ArrayList<Bloque>());
                agentView.getTablaBloques().setModel(model3);
                ModelTablaBloques model4 = TablaFilasMapper.mapRows(new ArrayList<Fila>());
                agentView.getTablaFilas().setModel(model4);
            }
        }
    }
    private class compraTeatroListener implements ItemListener {

        @Override
        public void itemStateChanged(ItemEvent e) {
            if (e.getStateChange() == ItemEvent.SELECTED) {
                Teatro teatro = (Teatro) agentView.getComboTeatros().getSelectedItem();
                ArrayList <Produccion> producciones = produccionesJDBC.getProdTIdView(teatro.getId());
                ModelTablaProd model= TablaProdMapper.mapRows(producciones);
                agentView.getTablaProds().setModel(model);
                ModelTablaProd model2 = TablaPresenMapper.mapRows(new ArrayList<Presentacion>());
                agentView.getTablaPresent().setModel(model2);
                ModelTablaBloquePrecios model3 = TablaBloquePreciosMapper.mapRows(new ArrayList<Bloque>());
                agentView.getTablaBloques().setModel(model3);
                ModelTablaBloques model4 = TablaFilasMapper.mapRows(new ArrayList<Fila>());
                agentView.getTablaFilas().setModel(model4);
            }
        }
    }



    private class compraTeatroProdsListener implements ListSelectionListener {
        @Override
        public void valueChanged(ListSelectionEvent e) {
            if(agentView.getTablaProds().getRowCount()>0) {
                Produccion produccion = (Produccion) agentView.getTablaProds().getValueAt(agentView.getTablaProds().getSelectedRow(), 0);
                ArrayList<Presentacion> presentacions = presentacionesJDBC.getPresentByProdIdView(produccion);
                ModelTablaProd model = TablaPresenMapper.mapRows(presentacions);
                agentView.getTablaPresent().setModel(model);
                ModelTablaBloquePrecios model3 = TablaBloquePreciosMapper.mapRows(new ArrayList<Bloque>());
                agentView.getTablaBloques().setModel(model3);
                ModelTablaBloques model4 = TablaFilasMapper.mapRows(new ArrayList<Fila>());
                agentView.getTablaFilas().setModel(model4);

            }
        }
    }
    private class compraTeatroPresentListener implements  ListSelectionListener{

        @Override
        public void valueChanged(ListSelectionEvent e) {
            if(agentView.getTablaPresent().getRowCount()>0)
            {
                Presentacion presentacion = (Presentacion) agentView.getTablaPresent().getValueAt(agentView.getTablaPresent().getSelectedRow(),0);
                ArrayList<Bloque> bloques = agentesJDBC.getBloquePreciosByProdId(presentacion.getId());
                ModelTablaBloquePrecios model = TablaBloquePreciosMapper.mapRows(bloques);
                agentView.getTablaBloques().setModel(model);
                ModelTablaBloques model4 = TablaFilasMapper.mapRows(new ArrayList<Fila>());
                agentView.getTablaFilas().setModel(model4);
            }
        }
    }
    private class compraTeatroBloqueListener implements  ListSelectionListener {

        @Override
        public void valueChanged(ListSelectionEvent e) {
            if(agentView.getTablaBloques().getRowCount()>0)
            {
                Bloque bloque = (Bloque) agentView.getTablaBloques().getValueAt(agentView.getTablaBloques().getSelectedRow(),0);
                ArrayList<Fila> filas = teatrosJDBC.getFilasByBloque(bloque);
                ModelTablaBloques model = TablaFilasMapper.mapRows(filas);
                agentView.getTablaFilas().setModel(model);
            }
        }
    }
    private class compraTeatroFilaListener implements  ListSelectionListener {

        @Override
        public void valueChanged(ListSelectionEvent e) {
            if(agentView.getTablaFilas().getRowCount()>0)
            {
                Fila fila = (Fila) agentView.getTablaFilas().getValueAt(agentView.getTablaFilas().getSelectedRow(),0);
                Presentacion presentacion = (Presentacion) agentView.getTablaPresent().getValueAt(agentView.getTablaPresent().getSelectedRow(),0);
                ArrayList<Asiento> asientos = teatrosJDBC.getAsientosByFila(fila,presentacion);
                ModelTablaBloques model = TablaAsientosMapper.mapRows(asientos);
                agentView.getTablaAsientos().setModel(model);
            }
        }
    }
}
