using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace StandardSeriesDemo.StandardSeries.Bars
{
    public partial class SalesFigures : Form
    {
        public SalesFigures()
        {
            InitializeComponent();
        }

        private void axTChart1_OnAfterDraw(object sender, EventArgs e)
        {

        }

        private void SalesFigures_Load(object sender, EventArgs e)
        {
            axTChart1.Panel.Gradient.Visible = false;
            //axTChart1.Panel.MarginTop = 12;
            //add series and data
            axTChart1.Series(0).Title = "Apples";
            axTChart1.Series(0).Add(5, "jan", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(0).Add(2, "feb", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(0).Add(1, "mar", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(0).Add(4, "apr", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(0).Add(10, "may", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(0).Add(11, "jun", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(0).Add(15,"jul", (UInt32)TeeChart.EConstants.clTeeColor);

            axTChart1.Series(1).Title = "Pears";
            axTChart1.Series(1).Add(7, "", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(1).Add(5, "", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(1).Add(1, "", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(1).Add(6, "", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(1).Add(2, "", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(1).Add(11, "", (UInt32)TeeChart.EConstants.clTeeColor);
            axTChart1.Series(1).Add(5, "", (UInt32)TeeChart.EConstants.clTeeColor);

            axTChart1.Axis.Bottom.Labels.Style = TeeChart.EAxisLabelStyle.talText;
            axTChart1.Axis.Left.Increment = 3;

            axTChart1.Axis.Left.SetMinMax(0, 15);
        }

        private void axTChart1_OnDblClick(object sender, EventArgs e)
        {
            axTChart1.Zoom.Enable = false;
            axTChart1.ShowEditor();
            axTChart1.StopMouse();
        }
    }
}
