namespace StandardSeriesDemo.StandardSeries.PieAndDonut
{
    partial class PiesSalesFigures
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PiesSalesFigures));
            this.axTChart1 = new AxTeeChart.AxTChart();
            this.axTChart2 = new AxTeeChart.AxTChart();
            this.axTChart3 = new AxTeeChart.AxTChart();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart3)).BeginInit();
            this.SuspendLayout();
            // 
            // axTChart1
            // 
            this.axTChart1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart1.Enabled = true;
            this.axTChart1.Location = new System.Drawing.Point(0, 0);
            this.axTChart1.Name = "axTChart1";
            this.axTChart1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart1.OcxState")));
            this.axTChart1.Size = new System.Drawing.Size(1134, 720);
            this.axTChart1.TabIndex = 0;
            this.axTChart1.OnAfterDraw += new System.EventHandler(this.axTChart1_OnAfterDraw);
            // 
            // axTChart2
            // 
            this.axTChart2.Enabled = true;
            this.axTChart2.Location = new System.Drawing.Point(816, 398);
            this.axTChart2.Name = "axTChart2";
            this.axTChart2.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart2.OcxState")));
            this.axTChart2.Size = new System.Drawing.Size(289, 111);
            this.axTChart2.TabIndex = 1;
            // 
            // axTChart3
            // 
            this.axTChart3.Enabled = true;
            this.axTChart3.Location = new System.Drawing.Point(816, 515);
            this.axTChart3.Name = "axTChart3";
            this.axTChart3.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart3.OcxState")));
            this.axTChart3.Size = new System.Drawing.Size(289, 111);
            this.axTChart3.TabIndex = 2;
            // 
            // PiesSalesFigures
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1134, 720);
            this.Controls.Add(this.axTChart3);
            this.Controls.Add(this.axTChart2);
            this.Controls.Add(this.axTChart1);
            this.Name = "PiesSalesFigures";
            this.Text = "PiesSalesFigures";
            this.Load += new System.EventHandler(this.PiesSalesFigures_Load);
            ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart3)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private AxTeeChart.AxTChart axTChart1;
        private AxTeeChart.AxTChart axTChart2;
        private AxTeeChart.AxTChart axTChart3;
    }
}