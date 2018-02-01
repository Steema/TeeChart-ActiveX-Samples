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
    public partial class MultiDonut : Form
    {
        public MultiDonut()
        {
            InitializeComponent();
        }

        private void MultiDonut_Load(object sender, EventArgs e)
        {
            axTChart1.Panel.Gradient.Visible = false;
            axTChart2.Panel.Gradient.Visible = false;
            axTChart3.Panel.Gradient.Visible = false;
            axTChart4.Panel.Gradient.Visible = false;
            axTChart5.Panel.Gradient.Visible = false;
        }

        private void axTChart1_OnAfterDraw(object sender, EventArgs e)
        {
            axTChart1.Panel.BackImage.Left = axTChart1.Width / 2-32;
            axTChart2.Panel.BackImage.Left = axTChart2.Width / 2-32;
            axTChart3.Panel.BackImage.Left = axTChart3.Width / 2-32;
            axTChart4.Panel.BackImage.Left = axTChart4.Width / 2-32;
        }
    }
}
