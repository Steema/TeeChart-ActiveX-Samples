using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TeeChart;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        
        private void Form1_Load(object sender, EventArgs e)
        {
            axTChart1.Aspect.View3D = false;
            axTChart1.RemoveAllSeries();
            axTChart1.AddSeries(ESeriesClass.scTornado);            
                        
            axTChart1.Series(0).asTornado.MarksOnBar = true;
            var series = axTChart1.Series(0);
            series.Marks.Font.Size = 12;
            series.Marks.Font.Bold = true;

            axTChart1.Series(0).asTornado.SortBy = ETornadoSortBy.sbLeft;

            axTChart1.Series(0).asTornado.Add(1.2, 2.1, "Potatoes", System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Blue)) );
            axTChart1.Series(0).asTornado.Add(4.8, 3.7, "Cabbages", System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Blue)));
            axTChart1.Series(0).asTornado.Add(3.1, 6.1, "Carrots", System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Blue)));
            axTChart1.Series(0).asTornado.Add(5.1, 4.2, "Turnips", System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Blue)));

            axTChart1.Legend.Visible = false;
            axTChart1.Header.Text.Text = "Greenhouse       Open air";
            axTChart1.Axis.Bottom.Title.Caption = "tonnes";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            axTChart1.ShowAboutBox();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
