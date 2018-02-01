// DraggingDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Dragging.h"
#include "DraggingDlg.h"
#include "TeeChartDefines.h"
#include "Aspect.h"
#include "BarSeries.h"
#include "LineSeries.h"
#include "Brush.h"
#include "Canvas.h"
#include "Marks.h"
#include "Pen.h"
#include "PointSeries.h"
#include "Pointer.h"
#include "Scroll.h"
#include "Series.h"
#include "TeeFunction.h"
#include "Zoom.h"
#include "SeriesPointerItems.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About
class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CDraggingDlg, CDialog)
	//{{AFX_MSG_MAP(CDraggingDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_CBN_SELCHANGE(IDC_COMBO, OnSelchangeCombo)
	ON_BN_CLICKED(IDC_CLOSE, OnClose)
	ON_BN_CLICKED(IDC_3D, On3D)
	ON_WM_HSCROLL()
	ON_BN_CLICKED(IDC_ABOUT, OnAbout)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

BEGIN_EVENTSINK_MAP(CDraggingDlg, CDialog)
    //{{AFX_EVENTSINK_MAP(CDraggingDlg)
	ON_EVENT(CDraggingDlg, IDC_TCHART, 1 /* OnAfterDraw */, OnAfterDrawTChart, VTS_NONE)
	ON_EVENT(CDraggingDlg, IDC_TCHART, 19 /* OnMouseDown */, OnMouseDownTChart, VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	ON_EVENT(CDraggingDlg, IDC_TCHART, 20 /* OnMouseMove */, OnMouseMoveTchart, VTS_I4 VTS_I4 VTS_I4)
	ON_EVENT(CDraggingDlg, IDC_TCHART, 21 /* OnMouseUp */, OnMouseUpTchart, VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	//}}AFX_EVENTSINK_MAP
END_EVENTSINK_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDraggingDlg dialog
CDraggingDlg::CDraggingDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CDraggingDlg::IDD, pParent),
	m_ClickedBar(-1)
{
	//{{AFX_DATA_INIT(CDraggingDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CDraggingDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDraggingDlg)
	DDX_Control(pDX, IDC_COMBO, m_ctrlBars);
	DDX_Control(pDX, IDC_3D, m_ctrlCheckBox);
	DDX_Control(pDX, IDC_SLIDER, m_ctrlSlider);
	DDX_Control(pDX, IDC_TCHART, m_ctrlChart);
	//}}AFX_DATA_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CDraggingDlg message handlers

BOOL CDraggingDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.
	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	// when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// Extra initialization
	m_ctrlChart.RemoveAllSeries();
	m_ctrlCheckBox.SetCheck(1);
	m_ctrlChart.GetAspect().SetView3D(true);
	m_ctrlChart.AddSeries(scBar);
	m_ctrlChart.AddSeries(scLine);
	m_ctrlChart.Series(0).FillSampleValues(8);
	m_ctrlChart.Series(0).SetCursor(2020);
	m_ctrlChart.GetZoom().SetEnable(false);
	m_ctrlChart.GetScroll().SetEnable(pmNone);
	m_ctrlChart.Series(1).SetDataSource(COleVariant("Series0"));
	m_ctrlChart.Series(1).SetFunction(tfTrend);
	m_ctrlChart.Series(1).SetTitle("Trend");
	m_ctrlChart.Series(1).GetMarks().SetStyle(smsPercent);
	m_ctrlChart.Series(1).GetMarks().SetArrowLength(8);
	m_ctrlChart.Series(1).GetMarks().SetVisible(true);
	m_ctrlChart.Series(1).GetFunctionType().SetPeriod(0);
	m_ctrlChart.Series(1).GetAsLine().GetPointer().SetStyle(psCircle);
	m_ctrlChart.Series(1).CheckDataSource();
	m_ctrlChart.SetDragMode(dmManual);
	m_ctrlSlider.SetRange(1, 100);
	m_ctrlSlider.SetPos(30);
	m_ctrlChart.GetAspect().SetChart3DPercent(30);
	FillListBox();
	return TRUE;
}

void CDraggingDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.
void CDraggingDlg::OnPaint() 
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
HCURSOR CDraggingDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

// Custom methods
void CDraggingDlg::OnSelchangeCombo() 
{
	int i = m_ctrlBars.GetItemData(m_ctrlBars.GetCurSel());
	m_ctrlChart.Series(0).GetAsBar().SetBarStyle(i);
}

void CDraggingDlg::OnClose() 
{
	EndDialog(IDCANCEL);
}

void CDraggingDlg::On3D() 
{
	m_ctrlChart.GetAspect().SetView3D(m_ctrlCheckBox.GetCheck());
}

void CDraggingDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
	// it can only be our scrollbar, but may be we'll
	// add another one sometimes
	if (pScrollBar->m_hWnd == m_ctrlSlider.m_hWnd)
		m_ctrlChart.GetAspect().SetChart3DPercent(m_ctrlSlider.GetPos());

	CDialog::OnHScroll(nSBCode, nPos, pScrollBar);
}

void CDraggingDlg::OnAbout() 
{
	m_ctrlChart.AboutBox();
}

void CDraggingDlg::FillListBox()
{
	m_ctrlBars.SetItemData(m_ctrlBars.AddString("Pyramid"), bsPyramid);
	m_ctrlBars.SetItemData(m_ctrlBars.AddString("Rectangle"), bsRectangle);
	m_ctrlBars.SetItemData(m_ctrlBars.AddString("Inv.Pyramid"), bsInvPyramid);
	m_ctrlBars.SetCurSel(1);
	OnSelchangeCombo();
}

void CDraggingDlg::OnAfterDrawTChart() 
{
	// Draw a white circle around the clicked pyramid...
	if (-1 != m_ClickedBar)
	{
		CCanvas aCanvas = m_ctrlChart.GetCanvas();
		CPen1 aPen = aCanvas.GetPen();
		aPen.SetColor(RGB(255, 255, 255));
        aPen.SetWidth(1);
		aPen.SetStyle(psDot);
        aCanvas.GetBrush().SetStyle(bsClear);
		int x =	m_ctrlChart.Series(0).CalcXPos(m_ClickedBar);
		int y =	m_ctrlChart.Series(0).CalcYPos(m_ClickedBar);
		aCanvas.Ellipse(x, y, x + 40, y + 40);
	}	
}

void CDraggingDlg::OnMouseDownTChart(long Button, long Shift, long X, long Y) 
{
	m_ClickedBar =	m_ctrlChart.Series(0).Clicked(X, Y);
}

void CDraggingDlg::OnMouseMoveTchart(long Shift, long X, long Y) 
{
	if (-1 != m_ClickedBar)
	{
		CSeries aSeries = m_ctrlChart.Series(0);
		aSeries.SetPointValue(m_ClickedBar, aSeries.YScreenToValue(Y));
		
		// Update the trend series
		m_ctrlChart.Series(1).CheckDataSource();
	}	
}

void CDraggingDlg::OnMouseUpTchart(long Button, long Shift, long X, long Y) 
{
	m_ClickedBar = -1;
	m_ctrlChart.Repaint();
	m_ctrlChart.Series(1).RefreshSeries();
}
