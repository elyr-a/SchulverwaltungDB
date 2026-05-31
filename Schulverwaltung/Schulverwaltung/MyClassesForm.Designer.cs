namespace Schulverwaltung
{
    partial class MyClassesForm
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
            dgv_MyClasses = new DataGridView();
            dgv_LessonHistory = new DataGridView();
            dgv_Grades = new DataGridView();
            ((System.ComponentModel.ISupportInitialize)dgv_MyClasses).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dgv_LessonHistory).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dgv_Grades).BeginInit();
            SuspendLayout();
            // 
            // dgv_MyClasses
            // 
            dgv_MyClasses.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgv_MyClasses.Location = new Point(12, 12);
            dgv_MyClasses.Name = "dgv_MyClasses";
            dgv_MyClasses.Size = new Size(776, 201);
            dgv_MyClasses.TabIndex = 0;
            dgv_MyClasses.CellContentClick += dgv_MyClasses_CellClick;
            // 
            // dgv_LessonHistory
            // 
            dgv_LessonHistory.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgv_LessonHistory.Location = new Point(12, 237);
            dgv_LessonHistory.Name = "dgv_LessonHistory";
            dgv_LessonHistory.Size = new Size(776, 201);
            dgv_LessonHistory.TabIndex = 1;
            // 
            // dgv_Grades
            // 
            dgv_Grades.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgv_Grades.Location = new Point(811, 12);
            dgv_Grades.Name = "dgv_Grades";
            dgv_Grades.Size = new Size(254, 426);
            dgv_Grades.TabIndex = 2;
            // 
            // MyClassesForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.ActiveCaption;
            ClientSize = new Size(1077, 450);
            Controls.Add(dgv_Grades);
            Controls.Add(dgv_LessonHistory);
            Controls.Add(dgv_MyClasses);
            Name = "MyClassesForm";
            Text = "My Classes";
            Load += MyClassesForm_Load;
            ((System.ComponentModel.ISupportInitialize)dgv_MyClasses).EndInit();
            ((System.ComponentModel.ISupportInitialize)dgv_LessonHistory).EndInit();
            ((System.ComponentModel.ISupportInitialize)dgv_Grades).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DataGridView dgv_MyClasses;
        private DataGridView dgv_LessonHistory;
        private DataGridView dgv_Grades;
    }
}