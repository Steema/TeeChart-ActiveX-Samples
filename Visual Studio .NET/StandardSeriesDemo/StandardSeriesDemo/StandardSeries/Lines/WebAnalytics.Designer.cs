namespace StandardSeriesDemo.StandardSeries.Lines
{
    partial class WebAnalytics
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(WebAnalytics));
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.axTChart3 = new AxTeeChart.AxTChart();
            this.axTChart2 = new AxTeeChart.AxTChart();
            this.panel1 = new System.Windows.Forms.Panel();
            this.axTChart4 = new AxTeeChart.AxTChart();
            this.axTChart1 = new AxTeeChart.AxTChart();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart2)).BeginInit();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).BeginInit();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 3;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333F));
            this.tableLayoutPanel1.Controls.Add(this.axTChart3, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.axTChart2, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.panel1, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.axTChart1, 0, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 38.1733F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 61.8267F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(785, 427);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // axTChart3
            // 
            this.axTChart3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart3.Enabled = true;
            this.axTChart3.Location = new System.Drawing.Point(525, 3);
            this.axTChart3.Name = "axTChart3";
            this.axTChart3.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart3.OcxState")));
            this.axTChart3.Size = new System.Drawing.Size(257, 156);
            this.axTChart3.TabIndex = 3;
            this.axTChart3.OnDblClick += new System.EventHandler(this.chartdoubleclick);
            // 
            // axTChart2
            // 
            this.axTChart2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart2.Enabled = true;
            this.axTChart2.Location = new System.Drawing.Point(264, 3);
            this.axTChart2.Name = "axTChart2";
            this.axTChart2.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart2.OcxState")));
            this.axTChart2.Size = new System.Drawing.Size(255, 156);
            this.axTChart2.TabIndex = 2;
            this.axTChart2.OnDblClick += new System.EventHandler(this.chartdoubleclick);
            // 
            // panel1
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.panel1, 3);
            this.panel1.Controls.Add(this.axTChart4);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 165);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(779, 259);
            this.panel1.TabIndex = 0;
            // 
            // axTChart4
            // 
            this.axTChart4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart4.Enabled = true;
            this.axTChart4.Location = new System.Drawing.Point(0, 0);
            this.axTChart4.Name = "axTChart4";
            this.axTChart4.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart4.OcxState")));
            this.axTChart4.Size = new System.Drawing.Size(779, 259);
            this.axTChart4.TabIndex = 0;
            this.axTChart4.OnAfterDraw += new System.EventHandler(this.axTChart4_OnAfterDraw);
            this.axTChart4.OnDblClick += new System.EventHandler(this.chartdoubleclick);
            this.axTChart4.OnCursorToolChange += new AxTeeChart.ITChartEvents_OnCursorToolChangeEventHandler(this.axTChart4_OnCursorToolChange);
            // 
            // axTChart1
            // 
            this.axTChart1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart1.Enabled = true;
            this.axTChart1.Location = new System.Drawing.Point(3, 3);
            this.axTChart1.Name = "axTChart1";
            this.axTChart1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart1.OcxState")));
            this.axTChart1.Size = new System.Drawing.Size(255, 156);
            this.axTChart1.TabIndex = 1;
            this.axTChart1.OnDblClick += new System.EventHandler(this.chartdoubleclick);
            // 
            // WebAnalytics
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(785, 427);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "WebAnalytics";
            this.Text = "WebAnalytics";
            this.Load += new System.EventHandler(this.WebAnalytics_Load);
            this.tableLayoutPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.axTChart3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart2)).EndInit();
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.axTChart4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Panel panel1;
        private AxTeeChart.AxTChart axTChart1;
        private AxTeeChart.AxTChart axTChart3;
        private AxTeeChart.AxTChart axTChart2;
        private AxTeeChart.AxTChart axTChart4;
    }
}