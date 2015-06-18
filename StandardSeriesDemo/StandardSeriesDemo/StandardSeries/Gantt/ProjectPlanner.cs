using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace StandardSeriesDemo.StandardSeries.Gantt
{
    public partial class ProjectPlanner : Form
    {
        public ProjectPlanner()
        {
            InitializeComponent();
        }

        private void ProjectPlanner_Load(object sender, EventArgs e)
        {
            axTChart1.Panel.Gradient.Visible = false;

            axTChart1.Series(0).asGantt.AddGantt(   new DateTime(2012, 5, 21).ToOADate(), new DateTime(2012, 5, 29).ToOADate() ,0, "Production" );
            axTChart1.Series(0).asGantt.AddGantt( new DateTime(2012, 9, 3).ToOADate(), new DateTime(2012, 11, 10).ToOADate() , 1, "Marketing");
            axTChart1.Series(0).asGantt.AddGantt( new DateTime(2012, 3, 13).ToOADate(), new DateTime(2012, 3, 31).ToOADate() , 2, "Approve");
            axTChart1.Series(0).asGantt.AddGantt( new DateTime(2012, 6, 7).ToOADate(), new DateTime(2012, 7, 5).ToOADate(), 3, "Prototype" );
            axTChart1.Series(0).asGantt.AddGantt( new DateTime(2012, 10, 11).ToOADate(), new DateTime(2012, 11, 5).ToOADate() , 4, "Evaluation");
            axTChart1.Series(0).asGantt.AddGantt( new DateTime(2012, 4, 2).ToOADate(), new DateTime(2012, 4, 29).ToOADate() , 5, "Design");
            axTChart1.Series(0).asGantt.AddGantt( new DateTime(2012, 9, 1).ToOADate(), new DateTime(2012, 11, 7).ToOADate() , 2, "Testing");
  
            axTChart1.Series(0).asGantt.Pointer.Style = TeeChart.EPointerStyle.psRectangle;
            axTChart1.Series(0).asGantt.Pointer.Shadow.Visible = false;

            axTChart1.Series(0).asGantt.Pointer.VerticalSize = 25;
            axTChart1.Series(0).asGantt.Pointer.Shadow.Visible = true;
            axTChart1.ApplyPalette(TeeChart.EColorPalette.cpMacOS);
        }

        private void axTChart1_OnGetSeriesMark(object sender, AxTeeChart.ITChartEvents_OnGetSeriesMarkEvent e)
        {
            // Add custom data to display at each gantt bar, for example: "Completion %"
            switch (e.valueIndex) 
            {
                case 0:
                    e.markText = "20 %";
                    break;
                case 1:
                    e.markText = "40 %";
                    break;
                case 2:
                    e.markText = "10 %";
                    break;
                case 3:
                    e.markText = "75 %";
                    break;
                case 4:
                    e.markText = "55 %";
                    break;
                case 5:
                    e.markText = "60 %";
                    break;
                case 6:
                    e.markText = "25 %";
                    break;
            }             
        }
    }
}
