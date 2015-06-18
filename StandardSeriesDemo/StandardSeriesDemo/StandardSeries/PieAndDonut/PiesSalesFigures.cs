using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace StandardSeriesDemo.StandardSeries.PieAndDonut
{
    public partial class PiesSalesFigures : Form
    {
        public PiesSalesFigures()
        {
            InitializeComponent();
        }

        private void PiesSalesFigures_Load(object sender, EventArgs e)
        {
            axTChart1.Series(0).Add(19,"Facebook", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(0).Add(14, "Tencent", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(0).Add(9, "WhatsApp", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(0).Add(5, "LinkedIn", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(0).Add(4, "Twitter", (UInt32)TeeChart.EConstants.clTeeColor);

            axTChart1.Series(0).asPie.PieMarks.LegSize = 20;
            axTChart1.Series(0).Marks.FontSeriesColor = true;

            axTChart2.Panel.Gradient.Visible = false;
            axTChart3.Panel.Gradient.Visible = false;
        }

        private void axTChart1_OnAfterDraw(object sender, EventArgs e)
        {
            axTChart2.Left = axTChart1.Width - 300;
            axTChart3.Left = axTChart1.Width - 300;
        }
    }
}
