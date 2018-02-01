namespace StandardSeriesDemo.StandardSeries.Bubbles
{
    partial class PopularLanguages
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
      System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(PopularLanguages));
      this.axTChart1 = new AxTeeChart.AxTChart();
      ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).BeginInit();
      this.SuspendLayout();
      // 
      // axTChart1
      // 
      this.axTChart1.Dock = System.Windows.Forms.DockStyle.Fill;
      this.axTChart1.Enabled = true;
      this.axTChart1.Location = new System.Drawing.Point(0, 0);
      this.axTChart1.Name = "axTChart1";
      this.axTChart1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart1.OcxState")));
      this.axTChart1.Size = new System.Drawing.Size(1094, 660);
      this.axTChart1.TabIndex = 0;
      this.axTChart1.OnGetLegendText += new AxTeeChart.ITChartEvents_OnGetLegendTextEventHandler(this.axTChart1_OnGetLegendText);
      // 
      // PopularLanguages
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(1094, 660);
      this.Controls.Add(this.axTChart1);
      this.Name = "PopularLanguages";
      this.Text = "PopularLanguages";
      this.Load += new System.EventHandler(this.PopularLanguages_Load);
      ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).EndInit();
      this.ResumeLayout(false);

        }

        #endregion

        private AxTeeChart.AxTChart axTChart1;
    }
}