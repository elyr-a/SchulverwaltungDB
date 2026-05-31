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
    public partial class StudentListForm : Form
    {
        private int selectedStudentId = -1;
        public StudentListForm()
        {
            InitializeComponent();

            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
        }

        private void StudentListForm_Load(object sender, EventArgs e)
        {
            RefreshStudentGrid();
            LoadClassComboBox();

            dgv_Students.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        // Retrieves student data from the database and displays it in the DataGridView
        private void RefreshStudentGrid()
        {
            string sql = "SELECT s.SchuelerID, s.Vorname, s.Nachname, s.Geburtsdatum, k.Name AS 'Class', s.Benutzername " +
                         "FROM schueler s " +
                         "JOIN klassen k ON s.KlasseID = k.KlasseID " +
                         "ORDER BY k.Name, s.Nachname";

            dgv_Students.DataSource = DatabaseHelper.ExecuteQuery(sql);

            if (dgv_Students.Columns["SchuelerID"] != null)
                dgv_Students.Columns["SchuelerID"].Visible = false;
        }

        // Loads class names into the combo box for selection
        private void LoadClassComboBox()
        {
            string sql = "SELECT KlasseID, Name FROM klassen ORDER BY Name";
            DataTable dt = DatabaseHelper.ExecuteQuery(sql);

            cmb_Class.DataSource = dt;
            cmb_Class.DisplayMember = "Name";
            cmb_Class.ValueMember = "KlasseID";
        }

        // Populates input fields with the selected student's data when a cell is clicked
        private void dgv_Students_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgv_Students.Rows[e.RowIndex];

                selectedStudentId = Convert.ToInt32(row.Cells["SchuelerID"].Value);

                txt_Vorname.Text = row.Cells["Vorname"].Value.ToString();
                txt_Nachname.Text = row.Cells["Nachname"].Value.ToString();
                txt_Username.Text = row.Cells["Benutzername"].Value.ToString();
                dtp_Birthdate.Value = Convert.ToDateTime(row.Cells["Geburtsdatum"].Value);
                cmb_Class.Text = row.Cells["Class"].Value.ToString();
            }
        }

        // Adds a new student to the database 
        private void btn_Add_Click(object sender, EventArgs e)
        {
            if (!ValidateInputs()) return;

            string lowercaseUsername = txt_Username.Text.Trim().ToLower();
            string defaultPasswordHash = PasswordHelper.HashPassword("start123", lowercaseUsername);

            string sql = "INSERT INTO schueler (Vorname, Nachname, Geburtsdatum, KlasseID, Benutzername, PasswortHash) " +
                         "VALUES (@vorname, @nachname, @geburtsdatum, @klasseId, @username, @passwordHash)";

            DatabaseHelper.ExecuteNonQuery(sql,
                ("vorname", txt_Vorname.Text.Trim()),
                ("nachname", txt_Nachname.Text.Trim()),
                ("geburtsdatum", dtp_Birthdate.Value.ToString("yyyy-MM-dd")),
                ("klasseId", cmb_Class.SelectedValue),
                ("username", lowercaseUsername),
                ("passwordHash", defaultPasswordHash)
            );

            MessageBox.Show("Student registered successfully! Temporary password is: start123",
                "Success",
                MessageBoxButtons.OK,
                MessageBoxIcon.Information);
            ClearInputFields();
            RefreshStudentGrid();
        }

        // Checks if all required input fields are filled
        private bool ValidateInputs()
        {
            if (string.IsNullOrEmpty(txt_Vorname.Text) || string.IsNullOrEmpty(txt_Nachname.Text) || string.IsNullOrEmpty(txt_Username.Text) || cmb_Class.SelectedValue == null)
            {
                MessageBox.Show("All input fields must be populated.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }

        // Clears all input fields and resets the selected student ID
        private void ClearInputFields()
        {
            selectedStudentId = -1;
            txt_Vorname.Clear();
            txt_Nachname.Clear();
            txt_Username.Clear();
            dtp_Birthdate.Value = DateTime.Now;
            if (cmb_Class.Items.Count > 0)
                cmb_Class.SelectedIndex = 0;
        }

        // Edits the selected student's information in the database
        private void btn_Edit_Click(object sender, EventArgs e)
        {
            if (selectedStudentId == -1)
            {
                MessageBox.Show("Please select a student to edit.",
                    "No Selection",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Warning);
                return;
            }

            if (!ValidateInputs()) return;

            string sql = "UPDATE schueler " +
                         "SET Vorname = @vorname, Nachname = @nachname, Geburtsdatum = @geburtsdatum, KlasseID = @klasseId, Benutzername = @username " +
                         "WHERE SchuelerID = @studentId";

            DatabaseHelper.ExecuteNonQuery(sql,
                ("vorname", txt_Vorname.Text.Trim()),
                ("nachname", txt_Nachname.Text.Trim()),
                ("geburtsdatum", dtp_Birthdate.Value.ToString("yyyy-MM-dd")),
                ("klasseId", cmb_Class.SelectedValue),
                ("username", txt_Username.Text.Trim().ToLower()),
                ("studentId", selectedStudentId)
            );

            MessageBox.Show("Student metrics updated successfully.",
                "Success",
                MessageBoxButtons.OK,
                MessageBoxIcon.Information);
            ClearInputFields();
            RefreshStudentGrid();
        }

        // Permanently deletes the selected student from the database after confirmation
        private void btn_Delete_Click(object sender, EventArgs e)
        {
            if (selectedStudentId == -1)
            {
                MessageBox.Show("Please select a student from the list first.", 
                    "No Selection", 
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            DialogResult confirm = MessageBox.Show("Are you sure you want to permanently delete this student record?" +
                "\nThis will remove their entire history, grades, and absence listings cascade-style.",
                "Critical Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

            if (confirm == DialogResult.Yes)
            {
                string sql = "DELETE FROM schueler WHERE SchuelerID = @studentId";
                DatabaseHelper.ExecuteNonQuery(sql, ("studentId", selectedStudentId));

                MessageBox.Show("Student completely purged from registry database layer.", 
                    "Data Dropped", 
                    MessageBoxButtons.OK, 
                    MessageBoxIcon.Information);
                ClearInputFields();
                RefreshStudentGrid();
            }
        }
    }
}
