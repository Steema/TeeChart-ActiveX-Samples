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
    public partial class MultiPies : Form
    {
        public MultiPies()
        {
            InitializeComponent();
        }

        private void MultiPies_Load(object sender, EventArgs e)
        {
            axTChart1.Panel.Gradient.Visible = false;
            axTChart2.Panel.Gradient.Visible = false;
            axTChart3.Panel.Gradient.Visible = false;
            axTChart4.Panel.Gradient.Visible = false;
            axTChart5.Panel.Gradient.Visible = false;
            axTChart6.Panel.Gradient.Visible = false;
            axTChart7.Panel.Gradient.Visible = false;

            axTChart4.Series(0).Marks.FontSeriesColor = true;
            axTChart5.Series(0).Marks.FontSeriesColor = true;
            axTChart6.Series(0).Marks.FontSeriesColor = true;
        }
    }
}
