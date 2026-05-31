using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using SchulVerwaltung.Helpers;
using SchulVerwaltung.Database;

namespace Schulverwaltung
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();

            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            lbl_CurrentSession.Text = $"Welcome, {SessionHelper.Vollname}";

            ConfigureUIPermissions();
        }

        // Restricts or grants access to UI controls based on the user's role
        private void ConfigureUIPermissions()
        {
            //if (!SessionHelper.IsAdmin)
            //{
            //    btn_StudentList.Enabled = false;
            //    btn_StudentList.Visible = false;
            //}
        }

        // Logout
        private void btn_Logout_Click(object sender, EventArgs e)
        {
            SessionHelper.Logout();

            LoginForm loginForm = new LoginForm();
            loginForm.Show();

            this.Hide();
            this.Dispose();
        }

        private void btn_MyClasses_Click(object sender, EventArgs e)
        {
            MyClassesForm myClassesForm = new MyClassesForm();
            myClassesForm.Show();
        }

        private void btn_StudentList_Click(object sender, EventArgs e)
        {
            StudentListForm studentListForm = new StudentListForm();
            studentListForm.Show();
        }

        private void btn_SubstitutionSchedule_Click(object sender, EventArgs e)
        {
            SubstitutionForm substitutionForm = new SubstitutionForm();
            substitutionForm.Show();
        }
    }
}