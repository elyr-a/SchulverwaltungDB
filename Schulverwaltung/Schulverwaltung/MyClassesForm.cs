using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using SchulVerwaltung.Database;
using SchulVerwaltung.Helpers;

namespace Schulverwaltung
{
    public partial class MyClassesForm : Form
    {
        public MyClassesForm()
        {
            InitializeComponent();

            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
        }

        private void MyClassesForm_Load(object sender, EventArgs e)
        {
            LoadStudentClasses();
        }

        private void LoadStudentClasses()
        {
            string sql = "SELECT lf.FachID, f.Name AS 'Subject', f.Kuerzel AS 'Abbreviation', CONCAT(l.Vorname, ' ', l.Nachname) AS 'Teacher' " +
                         "FROM schueler s " +
                         "JOIN lehrer_fach lf ON s.KlasseID = lf.KlasseID " +
                         "JOIN faecher f ON lf.FachID = f.FachID " +
                         "JOIN lehrer l ON lf.LehrerID = l.LehrerID " +
                         "WHERE s.SchuelerID = @studentId";

            dgv_MyClasses.DataSource = DatabaseHelper.ExecuteQuery(sql, ("studentId", SessionHelper.CurrentUserID));
            dgv_MyClasses.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;

            if (dgv_MyClasses.Columns["FachID"] != null)
                dgv_MyClasses.Columns["FachID"].Visible = false;
        }

        // When a cell in grid is clicked, load the lesson history and grades for the selected subject
        private void dgv_MyClasses_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow selectedRow = dgv_MyClasses.Rows[e.RowIndex];

                int fachID = Convert.ToInt32(selectedRow.Cells["FachID"].Value);

                LoadLessonHistory(fachID);
                LoadGrades(fachID);
            }
        }

        // Retrieves and displays the lesson history for the selected subject
        private void LoadLessonHistory(int fachId)
        {
            string sql = "SELECT uh.Datum AS 'Date', uh.Thema AS 'Topic', uh.Inhalt AS 'Content Summary', uh.Hausaufgaben AS 'Homework Assigned', uh.Seite AS 'Book Page' " +
                         "FROM unterrichtshistorie uh " +
                         "JOIN schueler s ON uh.KlasseID = s.KlasseID " +
                         "WHERE s.SchuelerID = @studentId AND uh.FachID = @fachId " +
                         "ORDER BY uh.Datum DESC";

            dgv_LessonHistory.DataSource = DatabaseHelper.ExecuteQuery(sql, 
                ("studentId", SessionHelper.CurrentUserID), 
                ("fachId", fachId));

            dgv_LessonHistory.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.None;

            dgv_LessonHistory.RowTemplate.Height = 25;

            DataGridViewCellStyle wrapStyle = new DataGridViewCellStyle();
            wrapStyle.WrapMode = DataGridViewTriState.True;

            if (dgv_LessonHistory.Columns["Content Summary"] != null)
                dgv_LessonHistory.Columns["Content Summary"].DefaultCellStyle = wrapStyle;

            if (dgv_LessonHistory.Columns["Homework Assigned"] != null)
                dgv_LessonHistory.Columns["Homework Assigned"].DefaultCellStyle = wrapStyle;

            if (dgv_LessonHistory.Columns["Book Page"] != null)
                dgv_LessonHistory.Columns["Book Page"].DefaultCellStyle = wrapStyle;

            dgv_LessonHistory.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgv_LessonHistory.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
        }

        // Retrieves and displays the grades for the selected subject
        private void LoadGrades(int fachId)
        {
            string sql = "SELECT Note, Typ, Beschreibung, DATE_FORMAT(Datum, '%d.%m.%Y') AS 'Datum' " +
                 "FROM noten " +
                 "WHERE SchuelerID = @studentId AND FachID = @fachId " +
                 "ORDER BY noten.Datum DESC"; 

            dgv_Grades.DataSource = DatabaseHelper.ExecuteQuery(sql,
                ("studentId", SessionHelper.CurrentUserID),
                ("fachId", fachId));
        }
    }
}