namespace WindowsFormsApplication2
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
            this.axTeeCommander1 = new AxTeeChart.AxTeeCommander();
            this.panel1 = new System.Windows.Forms.Panel();
            this.axChartPageNavigator1 = new AxTeeChart.AxChartPageNavigator();
            this.axChartGridNavigator1 = new AxTeeChart.AxChartGridNavigator();
            this.axTeeEditor1 = new AxTeeChart.AxTeeEditor();
            this.axChartGrid1 = new AxTeeChart.AxChartGrid();
            this.axTChart1 = new AxTeeChart.AxTChart();
            ((System.ComponentModel.ISupportInitialize)(this.axTeeCommander1)).BeginInit();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.axChartPageNavigator1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axChartGridNavigator1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTeeEditor1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axChartGrid1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).BeginInit();
            this.SuspendLayout();
            // 
            // axTeeCommander1
            // 
            this.axTeeCommander1.Dock = System.Windows.Forms.DockStyle.Top;
            this.axTeeCommander1.Location = new System.Drawing.Point(0, 0);
            this.axTeeCommander1.Name = "axTeeCommander1";
            this.axTeeCommander1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTeeCommander1.OcxState")));
            this.axTeeCommander1.Size = new System.Drawing.Size(706, 35);
            this.axTeeCommander1.TabIndex = 0;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.axTeeEditor1);
            this.panel1.Controls.Add(this.axChartGridNavigator1);
            this.panel1.Controls.Add(this.axChartPageNavigator1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 363);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(706, 44);
            this.panel1.TabIndex = 1;
            // 
            // axChartPageNavigator1
            // 
            this.axChartPageNavigator1.Enabled = true;
            this.axChartPageNavigator1.Location = new System.Drawing.Point(3, 7);
            this.axChartPageNavigator1.Name = "axChartPageNavigator1";
            this.axChartPageNavigator1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axChartPageNavigator1.OcxState")));
            this.axChartPageNavigator1.Size = new System.Drawing.Size(340, 31);
            this.axChartPageNavigator1.TabIndex = 0;
            // 
            // axChartGridNavigator1
            // 
            this.axChartGridNavigator1.Enabled = true;
            this.axChartGridNavigator1.Location = new System.Drawing.Point(361, 4);
            this.axChartGridNavigator1.Name = "axChartGridNavigator1";
            this.axChartGridNavigator1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axChartGridNavigator1.OcxState")));
            this.axChartGridNavigator1.Size = new System.Drawing.Size(332, 37);
            this.axChartGridNavigator1.TabIndex = 1;
            // 
            // axTeeEditor1
            // 
            this.axTeeEditor1.Enabled = true;
            this.axTeeEditor1.Location = new System.Drawing.Point(306, 10);
            this.axTeeEditor1.Name = "axTeeEditor1";
            this.axTeeEditor1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTeeEditor1.OcxState")));
            this.axTeeEditor1.Size = new System.Drawing.Size(25, 24);
            this.axTeeEditor1.TabIndex = 2;
            // 
            // axChartGrid1
            // 
            this.axChartGrid1.Dock = System.Windows.Forms.DockStyle.Right;
            this.axChartGrid1.Enabled = true;
            this.axChartGrid1.Location = new System.Drawing.Point(496, 35);
            this.axChartGrid1.Name = "axChartGrid1";
            this.axChartGrid1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axChartGrid1.OcxState")));
            this.axChartGrid1.Size = new System.Drawing.Size(210, 328);
            this.axChartGrid1.TabIndex = 3;
            // 
            // axTChart1
            // 
            this.axTChart1.Dock = System.Windows.Forms.DockStyle.Left;
            this.axTChart1.Enabled = true;
            this.axTChart1.Location = new System.Drawing.Point(0, 35);
            this.axTChart1.Name = "axTChart1";
            this.axTChart1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart1.OcxState")));
            this.axTChart1.Size = new System.Drawing.Size(490, 328);
            this.axTChart1.TabIndex = 4;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(706, 407);
            this.Controls.Add(this.axTChart1);
            this.Controls.Add(this.axChartGrid1);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.axTeeCommander1);
            this.Name = "Form1";
            this.Text = "TeeChart Palette Components";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.axTeeCommander1)).EndInit();
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.axChartPageNavigator1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axChartGridNavigator1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTeeEditor1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axChartGrid1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private AxTeeChart.AxTeeCommander axTeeCommander1;
        private System.Windows.Forms.Panel panel1;
        private AxTeeChart.AxTeeEditor axTeeEditor1;
        private AxTeeChart.AxChartGridNavigator axChartGridNavigator1;
        private AxTeeChart.AxChartPageNavigator axChartPageNavigator1;
        private AxTeeChart.AxChartGrid axChartGrid1;
        private AxTeeChart.AxTChart axTChart1;

    }
}

