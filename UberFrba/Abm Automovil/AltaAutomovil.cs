﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using UberFrba.Dao;
using UberFrba.Dto;
using UberFrba.Abm_Turno;
using UberFrba.Interface;

namespace UberFrba.Abm_Automovil
{
    public partial class AltaAutomovil : Form, ListadoSeleccionListener
    {
        public AltaAutomovil()
        {
            InitializeComponent();
            cargarComboBox();
        }

        public void onOperationFinish(TurnoDTO turno)
        {
            txtTurnoDescripcion.Text = turno.descripcion;
            txtTurnoHoraInicio.Text = turno.horaInicial.ToString();
            txtTurnoHoraFin.Text = turno.horaFinal.ToString();
        }



        private void cargarComboBox()
        {
            List<MarcaDTO> marcas = MarcaDAO.getAllMarcas();
            cmbMarca.DataSource = marcas;
            cmbMarca.DisplayMember = "descripcion";
            cmbMarca.ValueMember = "id";

            List<ModeloDTO> modelo = ModeloDAO.getAllModelos();
          //  cmbModelo.DataSource = modelo;
            cmbModelo.ValueMember = "id";
            cmbModelo.DisplayMember = "descripcion";
        }

        private void txtPatente_KeyPress(object sender, EventArgs e) {
          /*  this.allowAlphanumericOnly(e);
            if (e.KeyChar != 8) this.allowMaxLenght(txtPatente, 10, e);
            */
        }


        private AutomovilDTO cargarAutomovil()
        {

            int licencia;
            if (!Int32.TryParse(txtLicencia.Text, out licencia)) throw new Exception("La licencia debe ser numerica");

            AutomovilDTO unAutomovil = new AutomovilDTO();

            return unAutomovil;

        }

        

        private void cmbModelo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void AltaAutomovil_Load(object sender, EventArgs e)
        {

        }

        private void cmdSeleccionarTurno_Click(object sender, EventArgs e)
        {
            ListadoTurno ListadoSeleccionDeTurnoForm = new ListadoTurno(this);
            ListadoSeleccionDeTurnoForm.ShowDialog();
        }

        private void cmdSeleccionarChofer_Click(object sender, EventArgs e)
        {
            /*
            ListadoChofer ListadoSeleccionDeChoferForm = new ListadoChofer(this);
            ListadoSeleccionDeChoferForm.ShowDialog();
             */ 
        }

        private void btnCrearAutomovil_Click(object sender, EventArgs e)
        {

        }

    }
}