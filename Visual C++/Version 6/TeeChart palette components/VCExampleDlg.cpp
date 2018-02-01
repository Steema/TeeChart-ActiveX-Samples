// VCExampleDlg.cpp : implementation file
//

#include "stdafx.h"
#include "VCExample.h"
#include "VCExampleDlg.h"
#include "series.h"
#include "panel.h"
#include "gradient.h"
#include "teefunction.h"
#include "marks.h"
#include "legend.h"
#include "Canvas.h"
#include "Axes.h"
#include "Axis.h"
#include "AxisTitle.h"
#include "TeeFont.h"
#include "Pen.h"
#include "Aspect.h"
#include "TeeOpenGL.h"
#include "BarSeries.h"
#include "TeeChartDefines.h"
#include "TeeEditorOptions.h"
#include "ChartAxisPen.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CVCExampleDlg dialog

CVCExampleDlg::CVCExampleDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CVCExampleDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CVCExampleDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CVCExampleDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CVCExampleDlg)
	DDX_Control(pDX, IDC_BUTTON4, m_Button4);
	DDX_Control(pDX, IDC_TCHART1, m_Chart1);
	DDX_Control(pDX, IDC_TEEEDITOR1, m_TeeEditor1);
	DDX_Control(pDX, IDC_TEELISTBOX1, m_TeeListBox1);
	DDX_Control(pDX, IDC_TEEPREVIEWER1, m_TeePreviewer1);
	DDX_Control(pDX, IDC_TEECOMMANDER1, m_TeeCommander1);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CVCExampleDlg, CDialog)
	//{{AFX_MSG_MAP(CVCExampleDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	ON_BN_CLICKED(IDC_BUTTON2, OnButton2)
	ON_BN_CLICKED(IDC_BUTTON3, OnButton3)
	ON_BN_CLICKED(IDC_BUTTON4, OnButton4)
	ON_BN_CLICKED(IDC_BUTTON5, OnButton5)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CVCExampleDlg message handlers

BOOL CVCExampleDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here

	// *Note initialising Tee components association with Chart.
	// Do not set the TeeListBox here, do it later when the Chart
	// is created.

	// Associate the Chart with the TeeCommander Control Bar
	m_TeeCommander1.SetChartLink(m_Chart1.GetChartLink());
	// Associate the Chart with TeeEditor1	
	m_TeeEditor1.SetChartLink(m_Chart1.GetChartLink());
	// Associate the Chart with TeePreviewer1	
	m_TeePreviewer1.SetChartLink(m_Chart1.GetChartLink());
	// Set the TeeCommander Editor to use TeeEditor1
	// parameters when opening the Chart Editor
	m_TeeCommander1.SetEditorLink(m_TeeEditor1.GetEditorLink());
	// Set the TeeCommander Print Previewer to use TeePreviewer1 
	// parameters when showing Print Preview.
	m_TeeCommander1.SetPreviewerLink(m_TeePreviewer1.GetPreviewerLink());
	// Changing a couple of Editor/Previewer charcteristics. See help
	// file for full information.
	m_TeePreviewer1.SetPaperColor(RGB(128,64,128));
	m_TeeEditor1.GetOptions().SetAdd(false);
	
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CVCExampleDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CVCExampleDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CVCExampleDlg::OnButton1() 
{
	// TODO: Add your control notification handler code here
	if (m_Chart1.GetSeriesCount() == 0)
	{
		m_Chart1.AddSeries(1);  //Series type 1 is BarSeries
		if (m_Chart1.GetAspect().GetOpenGL().GetActive())
		{
			m_Chart1.Series(0).GetAsBar().SetBarStyle(bsCilinder);
			m_Chart1.Series(0).GetAsBar().GetBarPen().SetVisible(false);
		}
		m_Chart1.Series(0).FillSampleValues(15);

		//Give the Series a Title to the Chart Legend
		//Legend will display Values as default when only one Series in Chart
		m_Chart1.Series(0).SetTitle("Input Series");
		//Set the TeeListBox to use m_Chart1
		m_TeeListBox1.SetChartLink(m_Chart1.GetChartLink());

		// See OnOnBeforeDrawSeriesTchart1() event in this project for info 
		// about use of ClipPoints
		m_Chart1.SetClipPoints(false);
	}
}

void CVCExampleDlg::OnButton2() 
{
	// Add Custom axes. You may add as many as you wish.
	if (m_Chart1.GetSeriesCount() > 1) {
	  int newaxis = m_Chart1.GetAxis().AddCustom(false);
	  m_Chart1.Series(1).SetVerticalAxisCustom(newaxis);

	  m_Chart1.GetAxis().GetLeft().SetStartPosition(50);
	  m_Chart1.GetAxis().GetCustom(0).SetStartPosition(0);
	  m_Chart1.GetAxis().GetCustom(0).SetEndPosition(50);
	  m_Chart1.GetAxis().GetCustom(0).GetTitle().SetAngle(90);
	  m_Chart1.GetAxis().GetCustom(0).GetTitle().GetFont().SetBold(true);
	  // PositionPercent default position is 0.
	  m_Chart1.GetAxis().GetCustom(0).SetPositionPercent(50);
	  if (!m_Chart1.GetAspect().GetOpenGL().GetActive())
	  {
	      m_Chart1.GetAxis().GetLeft().GetTitle().SetCaption("Input values");
	      m_Chart1.GetAxis().GetCustom(0).GetTitle().SetCaption("StdDev. values");
	  }
	}
}

void CVCExampleDlg::OnButton3() 
{
	// TODO: Add your control notification handler code here
	m_Chart1.GetPanel().GetGradient().SetVisible(true);
}

void CVCExampleDlg::OnButton4() 
{
	// TODO: Add your control notification handler code here
	if (m_Chart1.GetSeriesCount() == 1)
	{
		m_Chart1.AddSeries(0);  //Add LineSeries

		//Give the Series a Title to the Chart Legend
		m_Chart1.Series(1).SetTitle("3 Point Std Deviation");

		//Put Legend at bottom of Chart
		m_Chart1.GetLegend().SetAlignment(3);

		m_Chart1.Series(1).SetFunction(14); //Set to 'StdDev' function Type
		
		//Add Series0 as Datasource for Function
		m_Chart1.Series(1).SetDataSource(COleVariant("Series0"));

		//Change the Function period to 3 to show the StdDev per every 3 Data points
		m_Chart1.Series(1).GetFunctionType().SetPeriod(3);
		//** Optional line below shows StdDev Line as Stairs
		//m_Chart1.GetSeries(1).GetAsLine().SetStairs(true);

		//Set Marks 'On' for the Average and 'Off' on the Bar Series
		m_Chart1.Series(1).GetMarks().SetVisible(true);
		m_Chart1.Series(0).GetMarks().SetVisible(false);

		//update TeeListBox1
		m_TeeListBox1.UpdateSeries();
	}
}


BEGIN_EVENTSINK_MAP(CVCExampleDlg, CDialog)
    //{{AFX_EVENTSINK_MAP(CVCExampleDlg)
	ON_EVENT(CVCExampleDlg, IDC_TCHART1, 1 /* OnAfterDraw */, OnOnAfterDrawTchart1, VTS_NONE)
	ON_EVENT(CVCExampleDlg, IDC_TCHART1, 29 /* OnBeforeDrawSeries */, OnOnBeforeDrawSeriesTchart1, VTS_NONE)
	//}}AFX_EVENTSINK_MAP
END_EVENTSINK_MAP()

void CVCExampleDlg::OnOnAfterDrawTchart1() 
{
	// Use this event to place Custom draw output
	//eg. m_Chart1.GetCanvas().TextOut(100,100,"Mytext");
}

void CVCExampleDlg::OnButton5() 
{
	// OpenGL support requires installation of Windows OpenGL
	// drivers. See the tutorials for more information.
	if (m_Chart1.GetAspect().GetOpenGL().GetActive())
	{
		m_Chart1.GetAspect().GetOpenGL().SetActive(false);
		//Set BarStyle to rectangle
		if (m_Chart1.GetSeriesCount() > 0)
		{
		  m_Chart1.Series(0).GetAsBar().SetBarStyle(bsRectangle);
		  m_Chart1.Series(0).GetAsBar().GetBarPen().SetVisible(true);
		}
		if (m_Chart1.GetAxis().GetCustomCount() > 0)
		{
		  // Axis titles
		  m_Chart1.GetAxis().GetCustom(0).GetTitle().SetCaption("StdDev. values");
		  m_Chart1.GetAxis().GetLeft().GetTitle().SetCaption("Input values");
		}
		m_Chart1.GetPanel().SetColor(RGB(192,192,192));
	}
	else
	{
		m_Chart1.GetAspect().GetOpenGL().SetActive(true);
		//Set BarStyle to cylinder
		if (m_Chart1.GetSeriesCount() > 0)
		{
			m_Chart1.Series(0).GetAsBar().SetBarStyle(bsCilinder);
			m_Chart1.Series(0).GetAsBar().GetBarPen().SetVisible(false);
		}
		if (m_Chart1.GetAxis().GetCustomCount() > 0)
		{
		  // Disable Labels due to OpenGL positioning
		  // Can use Canvas TextOut3D in OnAfterDraw event for OpenGL Text output
		  m_Chart1.GetAxis().GetCustom(0).GetTitle().SetCaption("");
		  m_Chart1.GetAxis().GetLeft().GetTitle().SetCaption("");
		}

		m_Chart1.GetPanel().SetColor(RGB(164,164,212));

	}
}

void CVCExampleDlg::OnOnBeforeDrawSeriesTchart1() 
{
	// This code (combined with ClipPoints(false) changes default behaviour of
	// points at Axis. Here they will overpaint the Axis by 5 pixels on each Axis.

	m_Chart1.GetCanvas().ClipRectangle(m_Chart1.GetAxis().GetLeft().GetPosition()-5,
		                               m_Chart1.GetAxis().GetTop().GetPosition()-5,
									   m_Chart1.GetAxis().GetRight().GetPosition()+5,
									   m_Chart1.GetAxis().GetBottom().GetPosition()+5);
}
