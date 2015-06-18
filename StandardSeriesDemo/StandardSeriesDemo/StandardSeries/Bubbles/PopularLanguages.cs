using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace StandardSeriesDemo.StandardSeries.Bubbles
{
    public partial class PopularLanguages : Form
    {
        public PopularLanguages()
        {
            InitializeComponent();
        }

        private void PopularLanguages_Load(object sender, EventArgs e)
        {
            axTChart1.Panel.Gradient.Visible = false;
        }

        private void axTChart1_OnGetLegendText(object sender, AxTeeChart.ITChartEvents_OnGetLegendTextEvent e)
        {
            switch (e.valueIndex)
            {
                case 0:
                    e.legendText = e.legendText + " 30,3 %";
                    break;
                case 1:
                    e.legendText = e.legendText + " 22,2 %";
                    break;
                case 2:
                    e.legendText = e.legendText + " 13 %";
                    break;
                case 3:
                    e.legendText = e.legendText + " 10,6 %";
                    break;
                case 4:
                    e.legendText = e.legendText + " 5,2 %";
                    break;
                case 5:
                    e.legendText = e.legendText + " 5 %";
                    break;
                case 6:
                    e.legendText = e.legendText + " 4,1 %";
                    break;
                case 7:
                    e.legendText = e.legendText + " 3,3 %";
                    break;
                case 8:
                    e.legendText = e.legendText + " 1,6 %";
                    break;
                case 9:
                    e.legendText = e.legendText + " 1,5 %";
                    break;

            }            
        }
    }
}
