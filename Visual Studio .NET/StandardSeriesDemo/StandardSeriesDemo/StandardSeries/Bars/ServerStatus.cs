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
    public partial class ServerStatus : Form
    {
        public ServerStatus()
        {
            InitializeComponent();
        }

        private void ServerStatus_Load(object sender, EventArgs e)
        {
            axTChart1.Panel.Gradient.Visible = false;
            axTChart2.Panel.Gradient.Visible = false;
            axTChart3.Panel.Gradient.Visible = false;

            axTChart3.Series(0).FillSampleValues(3);
            axTChart3.Series(1).FillSampleValues(3);
            axTChart3.Series(2).FillSampleValues(3);
            axTChart3.Series(0).set_PointLabel(0, "Speed");
            axTChart3.Series(0).set_PointLabel(1, "Time");
            axTChart3.Series(0).set_PointLabel(2, "Visitors");
        }

        private void axTChart1_OnAfterDraw(object sender, EventArgs e)
        {
            axTChart1.Canvas.TextOut(axTChart1.Axis.Left.Position, axTChart1.Series(0).CalcYPos(5) - 16, "Memory Usage");
            axTChart1.Canvas.TextOut(axTChart1.Axis.Left.Position, axTChart1.Series(0).CalcYPos(4) - 16, "CPU usage");
            axTChart1.Canvas.TextOut(axTChart1.Axis.Left.Position, axTChart1.Series(0).CalcYPos(3) - 16, "Storage space");
            axTChart1.Canvas.TextOut(axTChart1.Axis.Left.Position, axTChart1.Series(0).CalcYPos(2) - 16, "Apps installed");
            axTChart1.Canvas.TextOut(axTChart1.Axis.Left.Position, axTChart1.Series(0).CalcYPos(1) - 16, "Bandwidth");
        }

        Random rnd1 = new Random();

        private void axTChart2_OnCalendarSeriesChange(object sender, AxTeeChart.ITChartEvents_OnCalendarSeriesChangeEvent e)
        {
            // Random values for axTChart1
            axTChart1.Series(1).ValueLists.get_Items(0).set_Value(0, rnd1.Next(100));
            axTChart1.Series(1).ValueLists.get_Items(0).set_Value(1, rnd1.Next(100));
            axTChart1.Series(1).ValueLists.get_Items(0).set_Value(2, rnd1.Next(100));
            axTChart1.Series(1).ValueLists.get_Items(0).set_Value(3, rnd1.Next(100));
            axTChart1.Series(1).ValueLists.get_Items(0).set_Value(4, rnd1.Next(100));

            // Random values for axTChart3
            axTChart3.Series(0).ValueLists.get_Items(0).set_Value(0, rnd1.Next(1000));
            axTChart3.Series(1).ValueLists.get_Items(0).set_Value(0, rnd1.Next(1000));
            axTChart3.Series(2).ValueLists.get_Items(0).set_Value(0, rnd1.Next(1000));
            axTChart3.Series(0).ValueLists.get_Items(0).set_Value(1, rnd1.Next(1000));
            axTChart3.Series(1).ValueLists.get_Items(0).set_Value(1, rnd1.Next(1000));
            axTChart3.Series(2).ValueLists.get_Items(0).set_Value(1, rnd1.Next(1000));
            axTChart3.Series(0).ValueLists.get_Items(0).set_Value(2, rnd1.Next(1000));
            axTChart3.Series(1).ValueLists.get_Items(0).set_Value(2, rnd1.Next(1000));
            axTChart3.Series(2).ValueLists.get_Items(0).set_Value(2, rnd1.Next(1000));
        }
    }
}
