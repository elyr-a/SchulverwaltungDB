using SchulVerwaltung.Database;
using SchulVerwaltung.Helpers;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Schulverwaltung
{
    public partial class SubstitutionForm : Form
    {
        public SubstitutionForm()
        {
            InitializeComponent();

            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
        }

        private void SubstitutionForm_Load(object sender, EventArgs e)
        {
            LoadSubstitutionPlan();
            //ConfigureAdminControls();
        }

        // Loads the substitution plan 
        private void LoadSubstitutionPlan()
        {
            DataTable dt;

            string sql = "SELECT " +
             "  vp.VertretungID, " +
             "  DATE_FORMAT(vp.Datum, '%d.%m.%Y') AS 'Date', " +
             "  st.Bezeichnung AS 'Period', " +
             "  k.Name AS 'Class', " +
             "  COALESCE(f.Name, 'N/A') AS 'Subject', " +
             "  COALESCE(l1.Nachname, 'Unknown') AS 'Original Teacher', " +
             "  CASE WHEN vp.VertLehrerID IS NULL THEN 'CANCELLED / ENTFÄLLT' " +
             "       ELSE l2.Nachname END AS 'Substitute Teacher', " +
             "  vp.Raum AS 'Room', " +
             "  vp.Notiz AS 'Notes' " +
             "FROM vertretungsplan vp " +
             "LEFT JOIN klassen k ON vp.KlasseID = k.KlasseID " +
             "LEFT JOIN stunden st ON vp.StundeID = st.StundeID " +
             "LEFT JOIN faecher f ON vp.FachID = f.FachID " +
             "LEFT JOIN lehrer l1 ON vp.OrigLehrerID = l1.LehrerID " +
             "LEFT JOIN lehrer l2 ON vp.VertLehrerID = l2.LehrerID ";

            // Student filter logic
            if (SessionHelper.Role == SessionHelper.UserRole.Schueler)
            {
                sql = sql + "WHERE vp.KlasseID = (SELECT s.KlasseID FROM schueler s WHERE s.SchuelerID = @studentId) " +
                                "AND vp.Datum >= CURDATE() " +
                                "ORDER BY vp.Datum ASC, st.StundeID ASC";

                dt = DatabaseHelper.ExecuteQuery(sql, ("studentId", SessionHelper.CurrentUserID));
            }
            // Admin / Teacher logic
            else
            {
                sql = sql + "WHERE vp.Datum >= CURDATE() " +
                                "ORDER BY vp.Datum ASC, k.Name ASC, st.StundeID ASC";

                dt = DatabaseHelper.ExecuteQuery(sql);
            }

            dgv_Substitutions.DataSource = dt;

            if (dgv_Substitutions.Columns["VertretungID"] != null)
                dgv_Substitutions.Columns["VertretungID"].Visible = false;

            dgv_Substitutions.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgv_Substitutions.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dgv_Substitutions.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
        }

        //private void ConfigureAdminControls()
        //{
        //    bool isAdmin = (SessionHelper.Role == SessionHelper.UserRole.Admin);
        //    
        //    btn_AddSubstitution.Visible = isAdmin;
        //    btn_DeleteSubstitution.Visible = isAdmin;
        //    panel_AdminInputs.Visible = isAdmin;
        //}
    }
}
