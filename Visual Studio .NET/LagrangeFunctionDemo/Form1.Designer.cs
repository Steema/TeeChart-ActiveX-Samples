
namespace WindowsFormsApp7
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
			this.axTeeCommander1 = new AxTeeChart.AxTeeCommander();
			this.button1 = new System.Windows.Forms.Button();
			((System.ComponentModel.ISupportInitialize)(this.axTChart1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.axTeeCommander1)).BeginInit();
			this.SuspendLayout();
			// 
			// axTChart1
			// 
			this.axTChart1.Dock = System.Windows.Forms.DockStyle.Fill;
			this.axTChart1.Enabled = true;
			this.axTChart1.Location = new System.Drawing.Point(0, 37);
			this.axTChart1.Name = "axTChart1";
			this.axTChart1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTChart1.OcxState")));
			this.axTChart1.Size = new System.Drawing.Size(1023, 569);
			this.axTChart1.TabIndex = 0;
			// 
			// axTeeCommander1
			// 
			this.axTeeCommander1.Dock = System.Windows.Forms.DockStyle.Top;
			this.axTeeCommander1.Location = new System.Drawing.Point(0, 0);
			this.axTeeCommander1.Name = "axTeeCommander1";
			this.axTeeCommander1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("axTeeCommander1.OcxState")));
			this.axTeeCommander1.Size = new System.Drawing.Size(1023, 37);
			this.axTeeCommander1.TabIndex = 1;
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(349, 5);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(239, 23);
			this.button1.TabIndex = 4;
			this.button1.Text = "Apply Lagrange Function";
			this.button1.UseVisualStyleBackColor = true;
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// Form1
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(1023, 606);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.axTChart1);
			this.Controls.Add(this.axTeeCommander1);
			this.Name = "Form1";
			this.Text = "Form1";
			this.Load += new System.EventHandler(this.Form1_Load);
			((System.ComponentModel.ISupportInitialize)(this.axTChart1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.axTeeCommander1)).EndInit();
			this.ResumeLayout(false);

		}

		#endregion

		private AxTeeChart.AxTChart axTChart1;
		private AxTeeChart.AxTeeCommander axTeeCommander1;
		private System.Windows.Forms.Button button1;
	}
}

