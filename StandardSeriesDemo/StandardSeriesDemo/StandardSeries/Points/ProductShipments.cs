using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace StandardSeriesDemo.StandardSeries.Points
{
    public partial class ProductShipments : Form
    {
        public ProductShipments()
        {
            InitializeComponent();
        }

        private void ProductShipments_Load(object sender, EventArgs e)
        {
            int[] Yarr1 = new int[] { 5,3,2,7,1,6,4,5,1,0,10,7,11,15,12,21,17,15,19,24,21,11,15,21,19,17,20,23 }; 
            int[] Yarr2 = new int[] { 7,1,5,1,0,10,6,3,2,7,11,4,5,3,4,5,1,5,11,15,16,14,14,13,12,15,17,19 };

            DateTime[] Xarr = new DateTime[] {new DateTime(2012, 9, 1),new DateTime(2012, 9, 15),new DateTime(2012, 10, 1),new DateTime(2012, 10, 15),new DateTime(2012, 11, 1)
                  ,new DateTime(2012, 11, 15),new DateTime(2012, 12, 1),new DateTime(2012, 12, 15),new DateTime(2013, 1, 1),new DateTime(2013, 1, 15)
				  ,new DateTime(2013, 2, 1),new DateTime(2013, 2, 15),new DateTime(2013, 3, 1),new DateTime(2013, 3, 15)
				  ,new DateTime(2013, 4, 1),new DateTime(2013, 4, 15),new DateTime(2013, 5, 1),new DateTime(2013, 5, 15),new DateTime(2013, 6, 1)
                  ,new DateTime(2013, 6, 15),new DateTime(2013, 7, 1),new DateTime(2013, 7, 15),new DateTime(2013, 8, 1),new DateTime(2013, 8, 15)
				  ,new DateTime(2013, 9, 1),new DateTime(2013, 9, 15),new DateTime(2013, 10, 1),new DateTime(2013, 10, 15)};

            axTChart1.Panel.Gradient.Visible = false;
            axTChart1.Walls.Back.Visible = false;
            
            axTChart1.Series(0).Title = "Apples";
            axTChart1.Series(1).Title = "Pears";
            axTChart1.Series(2).Title = "Average";
            axTChart1.Series(0).AddArray(Yarr1.Length, Yarr1, Xarr);
            axTChart1.Series(1).AddArray(Yarr1.Length, Yarr2, Xarr);

            axTChart1.Series(0).XValues.DateTime = true;
            axTChart1.Series(1).XValues.DateTime = true;

            axTChart1.Series(0).asPoint.Pointer.Style = TeeChart.EPointerStyle.psCircle;
            axTChart1.Series(1).asPoint.Pointer.Style = TeeChart.EPointerStyle.psCircle;
            axTChart1.Series(0).asPoint.Pointer.Pen.Visible = false;
            axTChart1.Series(1).asPoint.Pointer.Pen.Visible = false;

            axTChart1.Series(2).CheckDataSource();

            axTChart1.Series(3).DataSource = axTChart1.Series(2);
            axTChart1.Series(3).asLine.Smoothed = true;
            axTChart1.Series(2).Pen.Visible = false;
            axTChart1.Series(2).ShowInLegend = false;

            axTChart1.Header.Font.Size = 16;
            axTChart1.SubHeader.Font.Size = 10;
            axTChart1.SubHeader.Alignment = TeeChart.ETitleAlignment.taLeftJustify;
        }
    }
}
