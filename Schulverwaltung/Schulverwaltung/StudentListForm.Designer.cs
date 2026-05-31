namespace Schulverwaltung
{
    partial class StudentListForm
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
            cmb_Class = new ComboBox();
            dgv_Students = new DataGridView();
            txt_Vorname = new TextBox();
            txt_Nachname = new TextBox();
            txt_Username = new TextBox();
            txt_Password = new TextBox();
            dtp_Birthdate = new DateTimePicker();
            btn_Edit = new Button();
            btn_Add = new Button();
            btn_Delete = new Button();
            ((System.ComponentModel.ISupportInitialize)dgv_Students).BeginInit();
            SuspendLayout();
            // 
            // cmb_Class
            // 
            cmb_Class.FormattingEnabled = true;
            cmb_Class.Location = new Point(667, 283);
            cmb_Class.Name = "cmb_Class";
            cmb_Class.Size = new Size(121, 23);
            cmb_Class.TabIndex = 0;
            // 
            // dgv_Students
            // 
            dgv_Students.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgv_Students.Location = new Point(22, 12);
            dgv_Students.Name = "dgv_Students";
            dgv_Students.Size = new Size(766, 265);
            dgv_Students.TabIndex = 1;
            dgv_Students.CellClick += dgv_Students_CellClick;
            // 
            // txt_Vorname
            // 
            txt_Vorname.Location = new Point(22, 283);
            txt_Vorname.Name = "txt_Vorname";
            txt_Vorname.Size = new Size(190, 23);
            txt_Vorname.TabIndex = 2;
            // 
            // txt_Nachname
            // 
            txt_Nachname.Location = new Point(22, 312);
            txt_Nachname.Name = "txt_Nachname";
            txt_Nachname.Size = new Size(190, 23);
            txt_Nachname.TabIndex = 3;
            // 
            // txt_Username
            // 
            txt_Username.Location = new Point(22, 341);
            txt_Username.Name = "txt_Username";
            txt_Username.Size = new Size(190, 23);
            txt_Username.TabIndex = 4;
            // 
            // txt_Password
            // 
            txt_Password.Location = new Point(22, 370);
            txt_Password.Name = "txt_Password";
            txt_Password.Size = new Size(190, 23);
            txt_Password.TabIndex = 5;
            // 
            // dtp_Birthdate
            // 
            dtp_Birthdate.Location = new Point(22, 399);
            dtp_Birthdate.Name = "dtp_Birthdate";
            dtp_Birthdate.Size = new Size(190, 23);
            dtp_Birthdate.TabIndex = 6;
            // 
            // btn_Edit
            // 
            btn_Edit.Location = new Point(713, 340);
            btn_Edit.Name = "btn_Edit";
            btn_Edit.Size = new Size(75, 23);
            btn_Edit.TabIndex = 8;
            btn_Edit.Text = "Edit";
            btn_Edit.UseVisualStyleBackColor = true;
            btn_Edit.Click += btn_Edit_Click;
            // 
            // btn_Add
            // 
            btn_Add.Location = new Point(713, 369);
            btn_Add.Name = "btn_Add";
            btn_Add.Size = new Size(75, 23);
            btn_Add.TabIndex = 9;
            btn_Add.Text = "Add";
            btn_Add.UseVisualStyleBackColor = true;
            btn_Add.Click += btn_Add_Click;
            // 
            // btn_Delete
            // 
            btn_Delete.Location = new Point(713, 399);
            btn_Delete.Name = "btn_Delete";
            btn_Delete.Size = new Size(75, 23);
            btn_Delete.TabIndex = 10;
            btn_Delete.Text = "Delete";
            btn_Delete.UseVisualStyleBackColor = true;
            btn_Delete.Click += btn_Delete_Click;
            // 
            // StudentListForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.ActiveCaption;
            ClientSize = new Size(800, 462);
            Controls.Add(btn_Delete);
            Controls.Add(btn_Add);
            Controls.Add(btn_Edit);
            Controls.Add(dtp_Birthdate);
            Controls.Add(txt_Password);
            Controls.Add(txt_Username);
            Controls.Add(txt_Nachname);
            Controls.Add(txt_Vorname);
            Controls.Add(dgv_Students);
            Controls.Add(cmb_Class);
            Name = "StudentListForm";
            Text = "Students";
            Load += StudentListForm_Load;
            ((System.ComponentModel.ISupportInitialize)dgv_Students).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private ComboBox cmb_Class;
        private DataGridView dgv_Students;
        private TextBox txt_Vorname;
        private TextBox txt_Nachname;
        private TextBox txt_Username;
        private TextBox txt_Password;
        private DateTimePicker dtp_Birthdate;
        private Button btn_Edit;
        private Button btn_Add;
        private Button btn_Delete;
    }
}