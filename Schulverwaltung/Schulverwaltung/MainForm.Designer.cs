namespace Schulverwaltung
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            gb_1 = new GroupBox();
            btn_SubstitutionSchedule = new Button();
            btn_MyClasses = new Button();
            lbl_CurrentSession = new Label();
            btn_Logout = new Button();
            btn_StudentList = new Button();
            gb_1.SuspendLayout();
            SuspendLayout();
            // 
            // gb_1
            // 
            gb_1.BackColor = SystemColors.AppWorkspace;
            gb_1.Controls.Add(btn_SubstitutionSchedule);
            gb_1.Controls.Add(btn_MyClasses);
            gb_1.Location = new Point(102, 61);
            gb_1.Name = "gb_1";
            gb_1.Size = new Size(552, 297);
            gb_1.TabIndex = 0;
            gb_1.TabStop = false;
            // 
            // btn_SubstitutionSchedule
            // 
            btn_SubstitutionSchedule.Location = new Point(123, 22);
            btn_SubstitutionSchedule.Name = "btn_SubstitutionSchedule";
            btn_SubstitutionSchedule.Size = new Size(102, 94);
            btn_SubstitutionSchedule.TabIndex = 2;
            btn_SubstitutionSchedule.Text = "Vertretungsplan";
            btn_SubstitutionSchedule.UseVisualStyleBackColor = true;
            btn_SubstitutionSchedule.Click += btn_SubstitutionSchedule_Click;
            // 
            // btn_MyClasses
            // 
            btn_MyClasses.Location = new Point(15, 22);
            btn_MyClasses.Name = "btn_MyClasses";
            btn_MyClasses.Size = new Size(102, 94);
            btn_MyClasses.TabIndex = 1;
            btn_MyClasses.Text = "Mein Unterricht";
            btn_MyClasses.UseVisualStyleBackColor = true;
            btn_MyClasses.Click += btn_MyClasses_Click;
            // 
            // lbl_CurrentSession
            // 
            lbl_CurrentSession.AutoSize = true;
            lbl_CurrentSession.BackColor = SystemColors.ActiveCaption;
            lbl_CurrentSession.Font = new Font("Segoe UI", 18F);
            lbl_CurrentSession.ForeColor = Color.Black;
            lbl_CurrentSession.Location = new Point(12, 9);
            lbl_CurrentSession.Name = "lbl_CurrentSession";
            lbl_CurrentSession.Size = new Size(78, 32);
            lbl_CurrentSession.TabIndex = 1;
            lbl_CurrentSession.Text = "label1";
            // 
            // btn_Logout
            // 
            btn_Logout.BackColor = Color.FromArgb(192, 0, 0);
            btn_Logout.ForeColor = Color.Black;
            btn_Logout.Location = new Point(688, 9);
            btn_Logout.Name = "btn_Logout";
            btn_Logout.Size = new Size(100, 37);
            btn_Logout.TabIndex = 2;
            btn_Logout.Text = "Log out";
            btn_Logout.UseVisualStyleBackColor = false;
            btn_Logout.Click += btn_Logout_Click;
            // 
            // btn_StudentList
            // 
            btn_StudentList.Location = new Point(10, 400);
            btn_StudentList.Name = "btn_StudentList";
            btn_StudentList.Size = new Size(80, 38);
            btn_StudentList.TabIndex = 3;
            btn_StudentList.Text = "Student List";
            btn_StudentList.UseVisualStyleBackColor = true;
            btn_StudentList.Click += btn_StudentList_Click;
            // 
            // MainForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.ActiveCaption;
            ClientSize = new Size(800, 450);
            Controls.Add(btn_StudentList);
            Controls.Add(btn_Logout);
            Controls.Add(lbl_CurrentSession);
            Controls.Add(gb_1);
            Name = "MainForm";
            Text = "Homepage";
            Load += MainForm_Load;
            gb_1.ResumeLayout(false);
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private GroupBox gb_1;
        private Button btn_MyClasses;
        private Label lbl_CurrentSession;
        private Button btn_Logout;
        private Button btn_SubstitutionSchedule;
        private Button btn_StudentList;
    }
}