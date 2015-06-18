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
    public partial class StackedBars : Form
    {
        public StackedBars()
        {
            InitializeComponent();
        }

        private void StackedBars_Load(object sender, EventArgs e)
        {
            axTChart1.Panel.Gradient.Visible = false;       
        }

        private void axTChart1_OnGetSeriesMark(object sender, AxTeeChart.ITChartEvents_OnGetSeriesMarkEvent e)
        {
            e.markText = e.markText + " $";
        }

        private void axTChart1_OnGetAxisLabel(object sender, AxTeeChart.ITChartEvents_OnGetAxisLabelEvent e)
        {
            if (e.axis == axTChart1.Axis.Right.Index-1)
                e.labelText = e.labelText + " $";
        }
    }
}
