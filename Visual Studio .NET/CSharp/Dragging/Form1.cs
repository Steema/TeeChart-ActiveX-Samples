using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        int TheClickedPyramid;
        private void Form1_Load(object sender, EventArgs e)
        {
            //some sample data for the pyramids...
            axTChart1.Series(0).FillSampleValues(8);

            // change pyramids cursor...
            axTChart1.Series(0).Cursor = 2020;

            // do not allow zoom and scroll
            axTChart1.Zoom.Enable = false;
            axTChart1.Scroll.Enable = TeeChart.EChartScroll.pmNone;

            // set temporary variables...
            TheClickedPyramid = -1;

            // set starting scroll-bar position...
            hScrollBar1.Value = axTChart1.Aspect.Chart3DPercent;

            // set starting combo value
            comboBox1.SelectedIndex = 1;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            axTChart1.ShowAboutBox();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void hScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            axTChart1.Aspect.Chart3DPercent = hScrollBar1.Value;
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            axTChart1.Aspect.View3D = checkBox1.Checked;
            hScrollBar1.Enabled = checkBox1.Checked;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            axTChart1.Series(0).asBar.BarStyle = (TeeChart.EBarStyle)comboBox1.SelectedIndex;
        }

        private void axTChart1_OnAfterDraw(object sender, EventArgs e)
        {
            //Custom draw a white circle around the clicked pyramid...
            int X;
            int Y;
            TeeChart.ICanvas tmpCanvas;
            TeeChart.ISeries tmpSeries;

            if (TheClickedPyramid != -1)
            {
                tmpCanvas = axTChart1.Canvas;
                tmpCanvas.Pen.Color = System.Convert.ToUInt32(System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.White));
                tmpCanvas.Pen.Width = 1;
                tmpCanvas.Pen.Style = TeeChart.EChartPenStyle.psDot;
                tmpCanvas.Brush.Style = TeeChart.EBrushStyle.bsClear;

                tmpSeries = axTChart1.Series(0);
                X = tmpSeries.CalcXPos(TheClickedPyramid);
                Y = tmpSeries.CalcYPos(TheClickedPyramid);
                tmpCanvas.Ellipse(X, Y, X + 40, Y + 40);
            }		
        }

        private void axTChart1_OnMouseDown(object sender, AxTeeChart.ITChartEvents_OnMouseDownEvent e)
        {
            // calculate if mouse has clicked a Pyramid...
            TheClickedPyramid = axTChart1.Series(0).Clicked(e.x, e.y);
        }

        private void axTChart1_OnMouseMove(object sender, AxTeeChart.ITChartEvents_OnMouseMoveEvent e)
        {
            // drag the pyramid !!!
            if (TheClickedPyramid != -1)
            {
                axTChart1.Series(0).set_PointValue(TheClickedPyramid, axTChart1.Series(0).YScreenToValue(e.y));
            }
        }

        private void axTChart1_OnMouseUp(object sender, AxTeeChart.ITChartEvents_OnMouseUpEvent e)
        {
            // when releasing mouse, stop dragging...
            TheClickedPyramid = -1;
            axTChart1.Repaint();
        }
    }
}
