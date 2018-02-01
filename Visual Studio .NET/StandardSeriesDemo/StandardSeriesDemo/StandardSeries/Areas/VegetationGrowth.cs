using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace StandardSeriesDemo.StandardSeries.Areas
{
    public partial class VegetationGrowth : Form
    {
        public VegetationGrowth()
        {
            InitializeComponent();
        }

        private void VegetationGrowth_Load(object sender, EventArgs e)
        {
            Random rnd1 = new Random();
            Random rnd2 = new Random();
            Random rnd3 = new Random();

            for (int t=0; t< 15; t++)
            {
                axTChart1.Series(0).Add(rnd1.Next(100), "", (UInt32)TeeChart.EConstants.clTeeColor);
                axTChart1.Series(1).Add(rnd1.Next(60), "", (UInt32)TeeChart.EConstants.clTeeColor);
                axTChart1.Series(2).Add(rnd1.Next(30), "", (UInt32)TeeChart.EConstants.clTeeColor);
            }

            axTChart1.Series(0).asArea.Smoothed = true;
            axTChart1.Series(1).asArea.Smoothed = true;
            axTChart1.Series(2).asArea.Smoothed = true;

            axTChart1.Series(0).asArea.DrawStyle = TeeChart.ECustomSeriesDrawStyle.dsCurve;
            axTChart1.Series(1).asArea.DrawStyle = TeeChart.ECustomSeriesDrawStyle.dsCurve;
            axTChart1.Series(2).asArea.DrawStyle = TeeChart.ECustomSeriesDrawStyle.dsCurve;

            axTChart1.Axis.Bottom.Increment = 3;
            axTChart1.Panel.Gradient.Visible = false;
        }

        private void axTChart1_OnDblClick(object sender, EventArgs e)
        {
            axTChart1.ShowEditor();
        }
    }
}
