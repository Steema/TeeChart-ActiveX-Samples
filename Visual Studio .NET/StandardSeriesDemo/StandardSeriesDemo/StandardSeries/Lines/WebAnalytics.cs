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
    public partial class WebAnalytics : Form
    {
        public WebAnalytics()
        {
            InitializeComponent();
        }

        private void WebAnalytics_Load(object sender, EventArgs e)
        {
            axTChart1.Panel.Gradient.Visible = false;
            axTChart2.Panel.Gradient.Visible = false;
            axTChart3.Panel.Gradient.Visible = false;
            axTChart4.Panel.Gradient.Visible = false;
        }

        private void axTChart1_OnAfterDraw(object sender, EventArgs e)
        {
        }

        private double xVal;
        private void axTChart4_OnCursorToolChange(object sender, AxTeeChart.ITChartEvents_OnCursorToolChangeEvent e)
        {
          xVal = e.xVal;

          axTChart4.Tools.get_Items(1).asAnnotation.Text = axTChart4.Series(0).Title + ": Y(" + e.xVal.ToString("0.00") + ")= ";
          axTChart4.Tools.get_Items(1).asAnnotation.Text += InterpolateLineSeries(0, e.xVal).ToString("0.00") + "\r\n";
          axTChart4.Tools.get_Items(1).asAnnotation.Left = e.x + 10;
          axTChart4.Tools.get_Items(1).asAnnotation.Top = axTChart4.Axis.Left.IStartPos;

          axTChart4.Tools.get_Items(3).asAnnotation.Text = axTChart4.Series(1).Title + ": Y(" + e.xVal.ToString("0.00") + ")= ";
          axTChart4.Tools.get_Items(3).asAnnotation.Text += InterpolateLineSeries(1, e.xVal).ToString("0.00") + "\r\n";
          axTChart4.Tools.get_Items(3).asAnnotation.Left = e.x + 10;
          axTChart4.Tools.get_Items(3).asAnnotation.Top = axTChart4.Axis.Left.IStartPos + 18;

          axTChart4.Tools.get_Items(5).asAnnotation.Text = axTChart4.Series(2).Title + ": Y(" + e.xVal.ToString("0.00") + ")= ";
          axTChart4.Tools.get_Items(5).asAnnotation.Text += InterpolateLineSeries(2, e.xVal).ToString("0.00") + "\r\n";
          axTChart4.Tools.get_Items(5).asAnnotation.Left = e.x + 10;
          axTChart4.Tools.get_Items(5).asAnnotation.Top = axTChart4.Axis.Left.IStartPos + 36;
        }

        private double InterpolateLineSeries(int series, double xvalue)
        {
            return InterpolateLineSeries(series, axTChart4.Series(series).FirstValueIndex, axTChart4.Series(series).LastValueIndex, xvalue);
        }

        /// <summary>
        /// Calculate y=y(x) for arbitrary x. Works fine only for line series with ordered x values.
        /// </summary>
        /// <param name="series"></param>
        /// <param name="firstindex"></param>
        /// <param name="lastindex"></param>
        /// <param name="xvalue"></param>
        /// <returns>y=y(xvalue) where xvalue is arbitrary x value.</returns>
        private double InterpolateLineSeries(int series, int firstindex, int lastindex, double xvalue)
        {
            int index;
            for (index = firstindex; index <= lastindex; index++)
            {
                if (index == -1 || axTChart4.Series(series).XValues.Value[index] > xvalue) break;
            }
            // safeguard
            if (index < 1) index = 1;
            else if (index >= axTChart4.Series(series).Count) index = axTChart4.Series(series).Count - 1;
            
            double dx = axTChart4.Series(series).XValues.get_Value(index) - axTChart4.Series(series).XValues.get_Value(index - 1);
            double dy = axTChart4.Series(series).YValues.get_Value(index) - axTChart4.Series(series).YValues.get_Value(index - 1);
            if (dx != 0.0) return dy * (xvalue - axTChart4.Series(series).XValues.get_Value(index - 1)) / dx + axTChart4.Series(series).YValues.get_Value(index - 1);
            else return 0.0;
        }
        private void chartdoubleclick(object sender, EventArgs e)
        {
          (sender as AxTeeChart.AxTChart).Zoom.Enable = false;
          (sender as AxTeeChart.AxTChart).ShowEditor();
          (sender as AxTeeChart.AxTChart).StopMouse();
          (sender as AxTeeChart.AxTChart).Zoom.Enable = true;
        }

        int posRepainted = 0;

        private void axTChart4_OnAfterDraw(object sender, EventArgs e)
        {
          if (posRepainted == 0)
          {
            posRepainted = 1;
            axTChart4.Refresh();
            
          }
          //setup centre positions of titles on chart
          //relative to their text lengths
          axTChart1.Refresh();
          axTChart2.Refresh();
          axTChart3.Refresh(); 
          posRepainted = 2;

          int xs = axTChart4.Axis.Bottom.CalcXPosValue(xVal);
          int ys;

          axTChart4.Canvas.Brush.Style = TeeChart.EBrushStyle.bsSolid;
          for (int i = 0; i < axTChart4.SeriesCount; i++)
          {
              ys = axTChart4.Series(i).CalcYPosValue(InterpolateLineSeries(i, xVal));
              axTChart4.Canvas.Brush.Color = axTChart4.Series(i).Color;
              axTChart4.Canvas.Ellipse(xs-2, ys-2, xs+2, ys+2);
          }
        }
    }
}
