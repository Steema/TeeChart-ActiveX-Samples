namespace StandardSeriesDemo.StandardSeries.Bars
{
    partial class ServerStatus
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
      System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ServerStatus));
      this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
      this.axTChart1 = new AxTeeChart.AxTChart();
      this.axTChart2 = new AxTeeChart.AxTChart();
      this.panel1 = new System.Windows.Forms.Panel();
      this.axTChart3 = new AxTeeChart.AxTChart();
      this.tableLayoutPanel1.SuspendLayout();
      ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).BeginInit();
      ((System.ComponentModel.ISupportInitialize)(this.axTChart2)).BeginInit();
      this.panel1.SuspendLayout();
      ((System.ComponentModel.ISupportInitialize)(this.axTChart3)).BeginInit();
      this.SuspendLayout();
      // 
      // tableLayoutPanel1
      // 
      this.tableLayoutPanel1.ColumnCount = 2;
      this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 52.44845F));
      this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 47.55155F));
      this.tableLayoutPanel1.Controls.Add(this.axTChart1, 0, 0);
      this.tableLayoutPanel1.Controls.Add(this.axTChart2, 1, 0);
      this.tableLayoutPanel1.Controls.Add(this.panel1, 0, 1);
      this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
      this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
      this.tableLayoutPanel1.Name = "tableLayoutPanel1";
      this.tableLayoutPanel1.RowCount = 2;
      this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50.35971F));
      this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 49.64029F));
      this.tableLayoutPanel1.Size = new System.Drawing.Size(776, 417);
      this.tableLayoutPanel1.TabIndex = 0;
      // 
      // axTChart1
      // 
      this.axTChart1.Dock = System.Windows.Forms.DockStyle.Fill;
      this.axTChart1.Enabled = true;
      this.axTChart1.Location = new System.Drawing.Point(3, 3);
      this.axTChart1.Name = "axTChart1";
      this.axTChart1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart1.OcxState")));
      this.axTChart1.Size = new System.Drawing.Size(400, 203);
      this.axTChart1.TabIndex = 0;
      this.axTChart1.OnAfterDraw += new System.EventHandler(this.axTChart1_OnAfterDraw);
      // 
      // axTChart2
      // 
      this.axTChart2.Dock = System.Windows.Forms.DockStyle.Fill;
      this.axTChart2.Enabled = true;
      this.axTChart2.Location = new System.Drawing.Point(409, 3);
      this.axTChart2.Name = "axTChart2";
      this.axTChart2.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart2.OcxState")));
      this.axTChart2.Size = new System.Drawing.Size(364, 203);
      this.axTChart2.TabIndex = 1;
      this.axTChart2.OnCalendarSeriesChange += new AxTeeChart.ITChartEvents_OnCalendarSeriesChangeEventHandler(this.axTChart2_OnCalendarSeriesChange);
      // 
      // panel1
      // 
      this.tableLayoutPanel1.SetColumnSpan(this.panel1, 2);
      this.panel1.Controls.Add(this.axTChart3);
      this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
      this.panel1.Location = new System.Drawing.Point(3, 212);
      this.panel1.Name = "panel1";
      this.panel1.Size = new System.Drawing.Size(770, 202);
      this.panel1.TabIndex = 2;
      // 
      // axTChart3
      // 
      this.axTChart3.Dock = System.Windows.Forms.DockStyle.Fill;
      this.axTChart3.Enabled = true;
      this.axTChart3.Location = new System.Drawing.Point(0, 0);
      this.axTChart3.Name = "axTChart3";
      this.axTChart3.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart3.OcxState")));
      this.axTChart3.Size = new System.Drawing.Size(770, 202);
      this.axTChart3.TabIndex = 0;
      // 
      // ServerStatus
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(776, 417);
      this.Controls.Add(this.tableLayoutPanel1);
      this.Name = "ServerStatus";
      this.Tag = "ServerStatus";
      this.Text = "ServerStatus";
      this.Load += new System.EventHandler(this.ServerStatus_Load);
      this.tableLayoutPanel1.ResumeLayout(false);
      ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).EndInit();
      ((System.ComponentModel.ISupportInitialize)(this.axTChart2)).EndInit();
      this.panel1.ResumeLayout(false);
      ((System.ComponentModel.ISupportInitialize)(this.axTChart3)).EndInit();
      this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private AxTeeChart.AxTChart axTChart1;
        private AxTeeChart.AxTChart axTChart2;
        private System.Windows.Forms.Panel panel1;
        private AxTeeChart.AxTChart axTChart3;

    }
}