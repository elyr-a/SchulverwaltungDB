namespace Schulverwaltung
{
    partial class LoginForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lbl_Un = new Label();
            txt_Username = new TextBox();
            label2 = new Label();
            txt_Password = new TextBox();
            label3 = new Label();
            btn_Login = new Button();
            chk_ShowPassword = new CheckBox();
            lbl_Popup = new Label();
            SuspendLayout();
            // 
            // lbl_Un
            // 
            lbl_Un.AutoSize = true;
            lbl_Un.Location = new Point(13, 67);
            lbl_Un.Name = "lbl_Un";
            lbl_Un.Size = new Size(63, 15);
            lbl_Un.TabIndex = 0;
            lbl_Un.Text = "Username:";
            // 
            // txt_Username
            // 
            txt_Username.Location = new Point(79, 64);
            txt_Username.Name = "txt_Username";
            txt_Username.Size = new Size(359, 23);
            txt_Username.TabIndex = 1;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("Segoe UI", 25F);
            label2.Location = new Point(168, 9);
            label2.Name = "label2";
            label2.Size = new Size(103, 46);
            label2.TabIndex = 2;
            label2.Text = "Login";
            // 
            // txt_Password
            // 
            txt_Password.Location = new Point(79, 93);
            txt_Password.Name = "txt_Password";
            txt_Password.PasswordChar = '*';
            txt_Password.Size = new Size(359, 23);
            txt_Password.TabIndex = 4;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(11, 96);
            label3.Name = "label3";
            label3.Size = new Size(60, 15);
            label3.TabIndex = 3;
            label3.Text = "Password:";
            // 
            // btn_Login
            // 
            btn_Login.Location = new Point(180, 216);
            btn_Login.Name = "btn_Login";
            btn_Login.Size = new Size(75, 23);
            btn_Login.TabIndex = 5;
            btn_Login.Text = "Login";
            btn_Login.UseVisualStyleBackColor = true;
            btn_Login.Click += btn_Login_Click;
            // 
            // chk_ShowPassword
            // 
            chk_ShowPassword.AutoSize = true;
            chk_ShowPassword.Location = new Point(79, 122);
            chk_ShowPassword.Name = "chk_ShowPassword";
            chk_ShowPassword.Size = new Size(108, 19);
            chk_ShowPassword.TabIndex = 6;
            chk_ShowPassword.Text = "Show password";
            chk_ShowPassword.UseVisualStyleBackColor = true;
            chk_ShowPassword.CheckedChanged += chk_ShowPassword_CheckedChanged;
            // 
            // lbl_Popup
            // 
            lbl_Popup.AutoSize = true;
            lbl_Popup.Font = new Font("Segoe UI", 9F);
            lbl_Popup.ForeColor = Color.Red;
            lbl_Popup.Location = new Point(79, 144);
            lbl_Popup.Name = "lbl_Popup";
            lbl_Popup.Size = new Size(38, 15);
            lbl_Popup.TabIndex = 7;
            lbl_Popup.Text = "label1";
            lbl_Popup.Visible = false;
            // 
            // LoginForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.ActiveCaption;
            ClientSize = new Size(450, 251);
            Controls.Add(lbl_Popup);
            Controls.Add(chk_ShowPassword);
            Controls.Add(btn_Login);
            Controls.Add(txt_Password);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(txt_Username);
            Controls.Add(lbl_Un);
            Name = "LoginForm";
            Text = "Login";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lbl_Un;
        private TextBox txt_Username;
        private Label label2;
        private TextBox txt_Password;
        private Label label3;
        private Button btn_Login;
        private CheckBox chk_ShowPassword;
        private Label lbl_Popup;
    }
}
