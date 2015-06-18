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
    public partial class DonutChart : Form
    {
        public DonutChart()
        {
            InitializeComponent();
        }

        private void DonutChart_Load(object sender, EventArgs e)
        {
            axTChart1.Panel.Gradient.Visible = false;
            axTChart1.Legend.Transparent = true;         
        }
    }
}
