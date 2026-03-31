namespace WindowsFormsApplication1
{
    partial class Form1
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));            
            this.axTChart1 = new AxTeeChart.AxTChart();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).BeginInit();
            this.SuspendLayout();
            // 
            // axTChart1
            // 
            this.axTChart1.Enabled = true;
            this.axTChart1.Location = new System.Drawing.Point(12, 12);
            this.axTChart1.Name = "axTChart1";
            this.axTChart1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart1.OcxState")));
            this.axTChart1.Size = new System.Drawing.Size(536, 320);
            this.axTChart1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart1.TabIndex = 7;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1000, 472);            
            this.Controls.Add(this.axTChart1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).EndInit();
            this.ResumeLayout(false);
        }

        #endregion
                
        private AxTeeChart.AxTChart axTChart1;

    }
}

