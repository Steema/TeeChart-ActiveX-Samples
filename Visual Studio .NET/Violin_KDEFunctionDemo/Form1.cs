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
      axTChart1.RemoveAllSeries();
      axTChart1.AddSeries(TeeChart.ESeriesClass.scBox);
      axTChart1.AddSeries(TeeChart.ESeriesClass.scBeeSwarm);
      axTChart1.AddSeries(TeeChart.ESeriesClass.scViolin);

      axTChart1.Series(0).Add(4.723143097, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-163.8499657, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(175.231925, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-48.35468425, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(14.6993532, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(114.734763, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(17.60508917, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(210.2650095, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-61.72121173, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(114.4151786, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(196.452651, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-93.70487623, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(94.04043151, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-18.48801027, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(108.4558658, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(26.95490135, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(205.3224574, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-146.8977273, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(185.5018042, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(8.294135496, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(170.1018831, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-25.0084555, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(109.5537878, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-42.54134484, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(161.2249696, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(1.95131609, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-33.33688556, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(109.03816, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-38.9393706, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(121.3493094, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-4.908452899, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-166.2188619, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(11.57283366, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(176.3964678, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(110.8755204, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-51.29477103, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(178.5478547, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(553.9499109, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(2.750346155, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(29.28765195, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-62.47847974, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-109.3304066, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(120.8580358, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(114.4805217, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(21.41081879, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(150.9424472, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(181.2817844, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(104.2415804, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-148.9825013, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(102.8203318, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(17.94859818, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(17.27953926, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(25.95785178, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-43.26549148, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-111.4736412, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(208.0000028, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(20.66494709, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(514.1211521, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(196.0813888, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(188.3434843, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(108.7538702, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(118.5680419, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(97.88270558, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(10.84328606, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(105.3636852, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(126.2237861, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(167.2021452, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(111.0311866, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-56.52883643, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-7.375059038, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-54.20342289, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-5.268905046, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(110.6727969, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(101.4781021, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(110.6464315, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(25.76979155, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(118.1465839, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-38.29618771, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(1.485343235, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(2.132530501, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));
      axTChart1.Series(0).Add(-25.96838117, "", Convert.ToUInt32(ColorTranslator.ToOle(Color.Blue)));

      axTChart1.Series(0).YValues.Order = TeeChart.EValueListOrder.loAscending;
      axTChart1.Series(0).YValues.Sort();
      
      axTChart1.Series(0).asBoxPlot.Position= 1996;
      axTChart1.Series(0).asBoxPlot.ExtrOut.Visible = false;

      axTChart1.Series(1).DataSource = axTChart1.Series(0);
      axTChart1.Series(1).asBeeSwarm.Transparency = 40;
      axTChart1.Series(1).asBeeSwarm.Position = 1996;
      axTChart1.Series(1).asBeeSwarm.KDEFunction.Options.Sides = TeeChart.EKDESides.kdsLeft;
      axTChart1.Series(1).asBeeSwarm.KDEFunction.Options.Resolution = 1000;
      axTChart1.Series(1).Active = false;

      axTChart1.Axis.Bottom.Automatic = true;

      axTChart1.Series(2).DataSource = axTChart1.Series(0);
      axTChart1.Series(2).asViolin.Transparency = 40;
      axTChart1.Series(2).asViolin.Position = 1996;
      axTChart1.Series(2).asViolin.KDEFunction.Options.Sides = TeeChart.EKDESides.kdsBoth;

      axTChart1.Series(2).asViolin.Update();

      checkBox1.Checked = true;

      //Notes beeswarm max width 5 points
      //frequency = height/point vsize
		}

		private void button2_Click(object sender, EventArgs e)
		{
			NewSampleData();
		}

		private void NewSampleData()
		{
			axTChart1.Series(0).FillSampleValues(30);
      axTChart1.Series(1).asBeeSwarm.Position = axTChart1.Series(0).asBoxPlot.Position;
      axTChart1.Series(1).CheckDataSource();

			checkBox1.Checked = false;

			axTChart1.Refresh();
			axTChart1.Repaint();
		}

		private void checkBox1_CheckedChanged(object sender, EventArgs e)
		{
      if (checkBox1.Checked)
      {
        axTChart1.Series(1).asBeeSwarm.KDEFunction.Options.Clamp = TeeChart.EKDEClamp.kdcManual;

        //DataRange := Series1.YValues.Range;

        axTChart1.Series(1).asBeeSwarm.KDEFunction.ClampMax = axTChart1.Series(0).YValues.Maximum + (axTChart1.Series(0).YValues.Range * 0.3);
        axTChart1.Series(1).asBeeSwarm.KDEFunction.ClampMin = axTChart1.Series(0).YValues.Maximum - (axTChart1.Series(0).YValues.Range * 0.3);

        axTChart1.Axis.Left.SetMinMax(axTChart1.Series(1).asBeeSwarm.KDEFunction.ClampMin, axTChart1.Series(1).asBeeSwarm.KDEFunction.ClampMax);
      }
      else
      {
        axTChart1.Series(1).asBeeSwarm.KDEFunction.Options.Clamp = TeeChart.EKDEClamp.kdcMinMax;
      }

      axTChart1.Repaint();
    }
  }
}
