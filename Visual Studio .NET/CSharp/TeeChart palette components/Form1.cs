using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            axChartPageNavigator1.ChartLink = axTChart1.ChartLink;
            axChartGrid1.ChartLink = axTChart1.ChartLink;
            axTeeCommander1.ChartLink = axTChart1.ChartLink;
            axTeeEditor1.ChartLink = axTChart1.ChartLink;
            axChartGridNavigator1.GridLink = axChartGrid1.GridLink;

            axTeeCommander1.EditorLink = axTeeEditor1.EditorLink;
            axTeeEditor1.DefaultPage = TeeChart.ETeeEditorPage.epGeneral;

            axTChart1.Series(0).FillSampleValues(100);
        }
    }
}
