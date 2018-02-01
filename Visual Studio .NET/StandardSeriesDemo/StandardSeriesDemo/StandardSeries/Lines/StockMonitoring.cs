using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace StandardSeriesDemo.StandardSeries.Lines
{
    public partial class StockMonitoring : Form
    {
        public StockMonitoring()
        {
            InitializeComponent();
        }

        private void StockMonitoring_Load(object sender, EventArgs e)
        {
            axTChart1.Panel.Gradient.Visible = false;
            axTChart1.Walls.Back.Transparent = true;

            axTChart1.Series(0).FillSampleValues(12);
            axTChart1.Series(1).FillSampleValues(10);
            axTChart1.Series(2).FillSampleValues(11);

            axTChart1.Series(0).asLine.Pointer.Brush.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Transparent));
            axTChart1.Series(1).asLine.Pointer.Brush.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Transparent));
            axTChart1.Series(2).asLine.Pointer.Brush.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Transparent));            
        }

        private void axTChart1_OnDblClick(object sender, EventArgs e)
        {
            axTChart1.ShowEditor();
        }
    }
}
