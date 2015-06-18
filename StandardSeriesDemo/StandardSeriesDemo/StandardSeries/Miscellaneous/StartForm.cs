using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace StandardSeriesDemo.StandardSeries.Miscellaneous
{
    public partial class StartForm : Form
    {
        public StartForm()
        {
            InitializeComponent();
        }

        private void StartForm_Load(object sender, EventArgs e)
        {
            axTChart1.Series(0).asWorld.Pen.Color = axTChart1.Panel.Gradient.StartColor;
            axTChart1.Footer.CustomPosition = true;
            axTChart1.Footer.Left = 10;
            axTChart1.Footer.Top = axTChart1.Height - 30;
        }

        private void chartdoubleclick(object sender, EventArgs e)
        {
            (sender as AxTeeChart.AxTChart).Zoom.Enable = false;
            (sender as AxTeeChart.AxTChart).ShowEditor();
            (sender as AxTeeChart.AxTChart).StopMouse();
            (sender as AxTeeChart.AxTChart).Zoom.Enable = true;
        }
    }
}
