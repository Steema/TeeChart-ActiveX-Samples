namespace StandardSeriesDemo.StandardSeries.PieAndDonut
{
    partial class MultiDonut
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MultiDonut));
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.axTChart4 = new AxTeeChart.AxTChart();
            this.axTChart3 = new AxTeeChart.AxTChart();
            this.axTChart2 = new AxTeeChart.AxTChart();
            this.axTChart1 = new AxTeeChart.AxTChart();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.axTChart5 = new AxTeeChart.AxTChart();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).BeginInit();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart5)).BeginInit();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 4;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tableLayoutPanel1.Controls.Add(this.axTChart4, 3, 0);
            this.tableLayoutPanel1.Controls.Add(this.axTChart3, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.axTChart2, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.axTChart1, 0, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 30);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 1;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 97.00375F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(841, 267);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // axTChart4
            // 
            this.axTChart4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart4.Enabled = true;
            this.axTChart4.Location = new System.Drawing.Point(633, 3);
            this.axTChart4.Name = "axTChart4";
            this.axTChart4.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart4.OcxState")));
            this.axTChart4.Size = new System.Drawing.Size(205, 261);
            this.axTChart4.TabIndex = 3;
            this.axTChart4.OnAfterDraw += new System.EventHandler(this.axTChart1_OnAfterDraw);
            // 
            // axTChart3
            // 
            this.axTChart3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart3.Enabled = true;
            this.axTChart3.Location = new System.Drawing.Point(423, 3);
            this.axTChart3.Name = "axTChart3";
            this.axTChart3.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart3.OcxState")));
            this.axTChart3.Size = new System.Drawing.Size(204, 261);
            this.axTChart3.TabIndex = 2;
            this.axTChart3.OnAfterDraw += new System.EventHandler(this.axTChart1_OnAfterDraw);
            // 
            // axTChart2
            // 
            this.axTChart2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart2.Enabled = true;
            this.axTChart2.Location = new System.Drawing.Point(213, 3);
            this.axTChart2.Name = "axTChart2";
            this.axTChart2.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart2.OcxState")));
            this.axTChart2.Size = new System.Drawing.Size(204, 261);
            this.axTChart2.TabIndex = 1;
            this.axTChart2.OnAfterDraw += new System.EventHandler(this.axTChart1_OnAfterDraw);
            // 
            // axTChart1
            // 
            this.axTChart1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart1.Enabled = true;
            this.axTChart1.Location = new System.Drawing.Point(3, 3);
            this.axTChart1.Name = "axTChart1";
            this.axTChart1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart1.OcxState")));
            this.axTChart1.Size = new System.Drawing.Size(204, 261);
            this.axTChart1.TabIndex = 0;
            this.axTChart1.OnAfterDraw += new System.EventHandler(this.axTChart1_OnAfterDraw);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.White;
            this.panel1.Controls.Add(this.label1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 518);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(841, 22);
            this.panel1.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.label1.Location = new System.Drawing.Point(0, 6);
            this.label1.Name = "label1";
            this.label1.Padding = new System.Windows.Forms.Padding(0, 0, 0, 3);
            this.label1.Size = new System.Drawing.Size(145, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Ericson consumerLab.   2014";
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.White;
            this.panel2.Controls.Add(this.label2);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(841, 30);
            this.panel2.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label2.Font = new System.Drawing.Font("Meiryo UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(0, 0);
            this.label2.Name = "label2";
            this.label2.Padding = new System.Windows.Forms.Padding(0, 3, 0, 0);
            this.label2.Size = new System.Drawing.Size(403, 23);
            this.label2.TabIndex = 0;
            this.label2.Text = "Where do customers watch mobile video content ?";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // axTChart5
            // 
            this.axTChart5.Dock = System.Windows.Forms.DockStyle.Fill;
            this.axTChart5.Enabled = true;
            this.axTChart5.Location = new System.Drawing.Point(0, 297);
            this.axTChart5.Name = "axTChart5";
            this.axTChart5.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart5.OcxState")));
            this.axTChart5.Size = new System.Drawing.Size(841, 221);
            this.axTChart5.TabIndex = 3;
            this.axTChart5.OnAfterDraw += new System.EventHandler(this.axTChart1_OnAfterDraw);
            // 
            // MultiDonut
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(841, 540);
            this.Controls.Add(this.axTChart5);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Controls.Add(this.panel2);
            this.Name = "MultiDonut";
            this.Text = "MultiDonut";
            this.Load += new System.EventHandler(this.MultiDonut_Load);
            this.tableLayoutPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.axTChart4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart1)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.axTChart5)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private AxTeeChart.AxTChart axTChart1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label label2;
        private AxTeeChart.AxTChart axTChart4;
        private AxTeeChart.AxTChart axTChart3;
        private AxTeeChart.AxTChart axTChart2;
        private AxTeeChart.AxTChart axTChart5;
    }
}