using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp7
{
	public partial class Form1 : Form
	{
		public Form1()
		{
			InitializeComponent();
		}

		private void Form1_Load(object sender, EventArgs e)
		{
			axTeeCommander1.ChartLink = axTChart1.ChartLink;			
		}

		private void button1_Click(object sender, EventArgs e)
		{
			// Apply Lagrange function
			axTChart1.Series(0).Clear();
			axTChart1.Series(1).asLine.LinePen.Width = 3;
			axTChart1.Series(1).Title = "Lagrange";
			axTChart1.Series(1).SetFunction(TeeChart.EFunctionType.tfLagrange);			
			
			axTChart1.Series(1).FunctionType.asLagrange.AutoRange = false;
			axTChart1.Series(1).FunctionType.asLagrange.StartRange = -10;
			axTChart1.Series(1).FunctionType.asLagrange.EndRange = 10;

			axTChart1.Series(1).FunctionType.asLagrange.AutoRange = false;
			axTChart1.Series(1).FunctionType.asLagrange.AutoRange = false;
			
			axTChart1.Series(0).AddXY(-9, 5, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
			axTChart1.Series(0).AddXY(-4, 2, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
			axTChart1.Series(0).AddXY(-1, -2, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
			axTChart1.Series(0).AddXY(7, 9, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
			axTChart1.Series(1).DataSource = axTChart1.Series(0);

			axTChart1.Series(1).CheckDataSource();
		}
	}
}
