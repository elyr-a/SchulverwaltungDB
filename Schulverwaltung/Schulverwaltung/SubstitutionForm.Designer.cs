namespace Schulverwaltung
{
    partial class SubstitutionForm
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
            dgv_Substitutions = new DataGridView();
            ((System.ComponentModel.ISupportInitialize)dgv_Substitutions).BeginInit();
            SuspendLayout();
            // 
            // dgv_Substitutions
            // 
            dgv_Substitutions.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgv_Substitutions.Location = new Point(12, 12);
            dgv_Substitutions.Name = "dgv_Substitutions";
            dgv_Substitutions.Size = new Size(776, 426);
            dgv_Substitutions.TabIndex = 0;
            // 
            // SubstitutionForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.ActiveCaption;
            ClientSize = new Size(800, 450);
            Controls.Add(dgv_Substitutions);
            Name = "SubstitutionForm";
            Text = "Substitution Plan";
            Load += SubstitutionForm_Load;
            ((System.ComponentModel.ISupportInitialize)dgv_Substitutions).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private DataGridView dgv_Substitutions;
    }
}