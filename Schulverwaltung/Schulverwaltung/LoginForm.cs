using System;
using System.Text;
using System.Windows.Forms;
using SchulVerwaltung.Helpers;
using System.Data;
using SchulVerwaltung.Database;

namespace Schulverwaltung
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();

            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;

            this.AcceptButton = btn_Login;
        }
        private void btn_Login_Click(object sender, EventArgs e)
        {
            string username = txt_Username.Text;
            string password = txt_Password.Text;

            // Input check
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lbl_Popup.Text = "Please enter both username and password.";
                lbl_Popup.Visible = true;

                return;
            }

            // Lehrer check
            if (TryLoginAsLehrer(username, password))
            {
                MessageBox.Show("Login successful! Welcome, " + SessionHelper.Vollname,
                    "Success",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);
                return;
            }

            // Then schüler check
            if (TryLoginAsSchueler(username, password))
            {
                MessageBox.Show("Login successful! Welcome, " + SessionHelper.Vollname,
                    "Success",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information);
                return;
            }

            // If reached this point, then login failed
            lbl_Popup.Text = "Invalid username or password.";
            lbl_Popup.Visible = true;

        }

        private bool TryLoginAsLehrer(string username, string password)
        {
            string sql = "SELECT LehrerID, Vorname, Nachname, PasswortHash, Rolle " +
                         "FROM Lehrer WHERE Benutzername = @user LIMIT 1";

            DataTable dt = DatabaseHelper.ExecuteQuery(sql, ("@user", username));
            if (dt.Rows.Count == 0) return false;

            DataRow row = dt.Rows[0];
            string storedHash = row["PasswortHash"].ToString();

            if (!PasswordHelper.VerifyPassword(password, username, storedHash))
                return false;

            // Login successful, set session
            string rolle = row["Rolle"].ToString();
            var role = rolle == "Admin"
                ? SessionHelper.UserRole.Admin
                : SessionHelper.UserRole.Lehrer;

            SessionHelper.Login(
                (int)row["LehrerID"],
                username,
                $"{row["Vorname"]} {row["Nachname"]}",
                role);

            OpenMainForm();
            return true;
        }

        private bool TryLoginAsSchueler(string username, string password)
        {
            string sql = "SELECT SchuelerID, Vorname, Nachname, PasswortHash " +
                         "FROM Schueler WHERE Benutzername = @user LIMIT 1";

            DataTable dt = DatabaseHelper.ExecuteQuery(sql, ("@user", username));
            if (dt.Rows.Count == 0) return false;

            DataRow row = dt.Rows[0];

            if (row["PasswortHash"] == DBNull.Value) return false;

            string storedHash = row["PasswortHash"].ToString();

            if (!PasswordHelper.VerifyPassword(password, username, storedHash))
                return false;

            // Login succesful, set session
            SessionHelper.Login(
                (int)row["SchuelerID"],
                username,
                $"{row["Vorname"]} {row["Nachname"]}",
                SessionHelper.UserRole.Schueler);

            OpenMainForm();
            return true;
        }

        private void OpenMainForm()
        {
            MainForm mainForm = new MainForm();
            mainForm.Show();
            this.Hide();

            mainForm.FormClosed += (s, e) => this.Close();
        }

        private void chk_ShowPassword_CheckedChanged(object sender, EventArgs e)
        {
            txt_Password.PasswordChar = chk_ShowPassword.Checked ? '\0' : '*';
        }
    }
}
