// TeeFilesView.cpp : implementation of the CTeeFilesView class
//

#include "stdafx.h"
#include "TeeFiles.h"

#include "TeeFilesDoc.h"
#include "TeeFilesView.h"
#include "Series.h"
#include "ValueList.h"
#include "Canvas.h"
#include "Panel.h"
#include "Import.h"
#include "Export.h"
#include "Printer.h"
#include "Brush.h"
#include "Aspect.h"
#include "Gradient.h"
#include "Titles.h"
#include "ChartFont.h"
#include "TeeFont.h"
#include "Strings.h"
#include "TeeChartDefines.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define IDC_TCHART1 31110
/////////////////////////////////////////////////////////////////////////////
// CTeeFilesView

IMPLEMENT_DYNCREATE(CTeeFilesView, CView)

BEGIN_MESSAGE_MAP(CTeeFilesView, CView)
	//{{AFX_MSG_MAP(CTeeFilesView)
	ON_COMMAND(ID_FILE_OPEN, OnFileOpen)
	ON_COMMAND(ID_ANIMATE, OnAnimate)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
	ON_COMMAND(ID_FILE_SAVE_AS, OnFileSaveAs)
	ON_WM_SIZE()
	ON_COMMAND(ID_FILE_PRINT, OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, OnFilePrintPreview)
	ON_COMMAND(ID_EDITOR, OnEditor)
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

// Manually add the EventSink map for the CView
// This can be generated for copying, by adding a TChart
// to a dialog box and auto-generating the map there.
// See also CTeeViewView.h
BEGIN_EVENTSINK_MAP(CTeeFilesView, CView)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 19 /* OnMouseDown */, OnMouseDownTChart, VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 1  /* OnAfterDraw */, OnAfterDrawTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 29 /* OnBeforeDrawSeries */, OnBeforeDrawSeriesTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 30 /* OnBeforeDrawAxes */, OnBeforeDrawAxesTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 3  /* OnClick */, OnClickTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 4  /* OnClickAxis */, OnClickAxisTChart, VTS_I4 VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 5  /* OnClickBackground */, OnClickBackgroundTChart, VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 6  /* OnClickLegend */, OnClickLegendTChart, VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 7  /* OnClickSeries */, OnClickSeriesTChart, VTS_I4 VTS_I4 VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 8  /* OnDblClick */, OnDblClickTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 10 /* OnDragOver */, OnDragOverTChart, VTS_I4 VTS_I4 VTS_I4 VTS_PBOOL)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 11 /* OnEndDrag */, OnEndDragTChart, VTS_I4 VTS_I4)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 12 /* OnEnter */, OnEnterTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 13 /* OnExit */, OnExitTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 14 /* OnGetAxisLabel */, OnGetAxisLabelTChart, VTS_I4 VTS_I4 VTS_I4 VTS_PBSTR)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 16 /* OnGetLegendRect */, OnGetLegendRectTChart, VTS_PI4 VTS_PI4 VTS_PI4 VTS_PI4)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 18 /* OnGetNextAxisLabel */, OnGetNextAxisLabelTChart, VTS_I4 VTS_I4 VTS_PR8 VTS_PBOOL)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 20 /* OnMouseMove */, OnMouseMoveTChart, VTS_I4 VTS_I4 VTS_I4)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 21 /* OnMouseUp */, OnMouseUpTChart, VTS_I4 VTS_I4 VTS_I4 VTS_I4)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 22 /* OnPageChange */, OnPageChangeTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 23 /* OnResize */, OnResizeTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 24 /* OnScroll */, OnScrollTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 25 /* OnStartDrag */, OnStartDragTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 31 /* OnTimerTChart */, OnTimerTChart, VTS_NONE) 
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 26 /* OnUndoZoom */, OnUndoZoomTChart, VTS_NONE)
	ON_EVENT(CTeeFilesView, IDC_TCHART1, 27 /* OnZoom */, OnZoomTChart, VTS_NONE)
END_EVENTSINK_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTeeFilesView construction/destruction

CTeeFilesView::CTeeFilesView()
{
}

CTeeFilesView::~CTeeFilesView()
{
}

BOOL CTeeFilesView::PreCreateWindow(CREATESTRUCT& cs)
{
	return CView::PreCreateWindow(cs);
}

BOOL CTeeFilesView::Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext) 
{

	if (!CWnd::Create(lpszClassName, lpszWindowName, dwStyle, rect, pParentWnd, nID, pContext))
		return FALSE;
	
	//WS_CHILD | WS_VISIBLE
	//Create TeeChart - sized to Client window afterwards with 'OnSize'
	if (!m_Chart1.Create(lpszClassName, 
							"", 
							dwStyle, 
							CRect(0,0,50,50), 
							this, 
							IDC_TCHART1, 
							pContext))
		return FALSE;
	DeltaRot = 4;
	DeltaElev = 3;
	DeltaZoom = 5;
	m_Chart1.SetVisible(true);
	m_Chart1.AddSeries(0);
	m_Chart1.Series(0).FillSampleValues(10);
	ORIGVIEW= m_Chart1.GetAspect().GetView3D();

	//Set some cosmetic features
	COleVariant var1(CString ("TeeChart Pro"));
	COleVariant var2(CString ("ActiveX Control"));
	CTitles hd = m_Chart1.GetHeader();
	hd.GetText().Clear();hd.GetText().Add(*(LPCVARIANT)var1);
	hd.GetText().Add(*(LPCVARIANT)var2);
	hd.GetFont().SetBold(true);
	hd.GetFont().SetSize(11);
	m_Chart1.GetPanel().GetGradient().SetVisible(true);
	m_Chart1.GetPanel().GetGradient().SetDirection(gdTopBottom);
	if (m_Chart1.GetCanvas().IsScreenHighColor())
	{
		m_Chart1.GetPanel().GetGradient().SetEndColor(RGB(0,0,131));
		hd.GetFont().SetColor(RGB(255,255,51));
	}

	return true;
}

void CTeeFilesView::OnSize(UINT nType, int cx, int cy) 
{
	CView::OnSize(nType, cx, cy);
	
	 //routine sizes the Chart to the Client window
     if (m_Chart1.m_hWnd)
     {
          m_Chart1.SetWidth(cx);
          m_Chart1.SetHeight(cy);
     }	
}

/////////////////////////////////////////////////////////////////////////////
// CTeeFilesView drawing

void CTeeFilesView::OnDraw(CDC* pDC)
{
	CTeeFilesDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
}

/////////////////////////////////////////////////////////////////////////////
// CTeeFilesView printing

BOOL CTeeFilesView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CTeeFilesView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
}

void CTeeFilesView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
}




/////////////////////////////////////////////////////////////////////////////
// CTeeFilesView diagnostics

#ifdef _DEBUG
void CTeeFilesView::AssertValid() const
{
	CView::AssertValid();
}

void CTeeFilesView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CTeeFilesDoc* CTeeFilesView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CTeeFilesDoc)));
	return (CTeeFilesDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CTeeFilesView message handlers

void CTeeFilesView::OnFileOpen() 
{
	//Show dialog box to choose new Chart template
	//We advise consistent modifications between templates
	// to override existing properties. If properties are not 
	// set on the new template old properties will override.
	// We expect to implement complete override (regardless of
	// what is set) for the next version.
		
		CFileDialog dlgFile(
		TRUE,
		_T(".tee"),
		NULL,
		OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
		_T("TeeChart templates (*.tee)|*.tee||"));
	if (dlgFile.DoModal() != IDOK)
		return;

	if (Animate == TRUE)
	{
		Animate=FALSE;
	}

    m_Chart1.GetImport().LoadFromFile(dlgFile.GetFileName());
	ORIGVIEW= m_Chart1.GetAspect().GetView3D();
	CRect rectClient;
	GetClientRect(&rectClient);
	OnSize(SIZE_RESTORED,rectClient.right,rectClient.bottom);
	
}



void CTeeFilesView::OnAnimate() 
{
	// Toggle animation from menu 'Animate' option
	Animate = !Animate;
	if (Animate)
	{
		m_Chart1.GetAspect().SetView3D(TRUE);
		m_Chart1.GetAspect().SetOrthogonal(FALSE);
		m_Chart1.GetAspect().SetRotation(300);
		m_Chart1.SetTimerInterval(150);
		m_Chart1.SetTimerEnabled(TRUE);
	}
	else
	{
		m_Chart1.SetTimerEnabled(FALSE);
		m_Chart1.GetAspect().SetOrthogonal(TRUE);
		m_Chart1.GetAspect().SetView3D(ORIGVIEW);
		m_Chart1.GetAspect().SetZoom(100);
	}
	
}

void CTeeFilesView::OnAppAbout() 
{
	// Show TeeChart's Aboubox
	m_Chart1.AboutBox();
}

void CTeeFilesView::OnFileSaveAs() 
{
	// dialog box to save Chart template
		CFileDialog dlgFile(
		FALSE,
		_T(".tee"),
		NULL,
		OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
		_T("TeeChart templates (*.tee)|*.tee||"));
	if (dlgFile.DoModal() != IDOK)
		return;

 	try
	{
		m_Chart1.GetExport().SaveToFile(dlgFile.GetFileName());
	}
	catch (CException* e)
	{
		e->Delete();
	}
	
}

void CTeeFilesView::OnFilePrint() 
{
	// Print Chart on page
	m_Chart1.GetPrinter().PrintChart();	
}

void CTeeFilesView::OnFilePrintPreview() 
{
	// Show Chart preview, can change printer settings in dialog.
	m_Chart1.GetPrinter().ShowPreview();
}

void CTeeFilesView::OnEditor() 
{
	// Show Chart editor. You may save properties here
	// and save them to a new template with OnFileSaveAs()
	m_Chart1.ShowEditor(-1);	
}


//TChart Events

void CTeeFilesView::OnAfterDrawTChart() 
{
}

void CTeeFilesView::OnBeforeDrawSeriesTChart() 
{
}

void CTeeFilesView::OnBeforeDrawAxesTChart() 
{

}

void CTeeFilesView::OnClickTChart() 
{
}

void CTeeFilesView::OnClickAxisTChart(long Axis, long Button, long Shift, long X, long Y) 
{
}

void CTeeFilesView::OnClickBackgroundTChart(long Button, long Shift, long X, long Y) 
{
}

void CTeeFilesView::OnClickLegendTChart(long Button, long Shift, long X, long Y) 
{
}

void CTeeFilesView::OnClickSeriesTChart(long SeriesIndex, long ValueIndex, long Button, long Shift, long X, long Y) 
{
}

void CTeeFilesView::OnDblClickTChart() 
{
	m_Chart1.ShowEditor(-1);
	// Set StopMouse to enable normal mouse action after
	// event is triggered (eg. so as not to Zoom)
	m_Chart1.StopMouse();
}

void CTeeFilesView::OnDragDropTChart(long X, long Y) 
{
}

void CTeeFilesView::OnDragOverTChart(long X, long Y, long State, BOOL FAR* Accept) 
{
}

void CTeeFilesView::OnEndDragTChart(long X, long Y) 
{
}

void CTeeFilesView::OnEnterTChart() 
{
}

void CTeeFilesView::OnExitTChart() 
{
}

void CTeeFilesView::OnGetAxisLabelTChart(long Axis, long SeriesIndex, long ValueIndex, BSTR FAR* LabelText) 
{
}

void CTeeFilesView::OnGetLegendRectTChart(long FAR* Left, long FAR* Top, long FAR* Right, long FAR* Bottom) 
{
}

void CTeeFilesView::OnGetNextAxisLabelTChart(long Axis, long LabelIndex, double FAR* LabelValue, BOOL FAR* MoreLabels) 
{
}

void CTeeFilesView::OnMouseDownTChart(long Button, long Shift, long X, long Y) 
{
}

void CTeeFilesView::OnMouseMoveTChart(long Shift, long X, long Y) 
{
}

void CTeeFilesView::OnMouseUpTChart(long Button, long Shift, long X, long Y) 
{
}

void CTeeFilesView::OnPageChangeTChart() 
{
}

void CTeeFilesView::OnResizeTChart() 
{
}

void CTeeFilesView::OnScrollTChart() 
{
}

void CTeeFilesView::OnStartDragTChart() 
{
}

void CTeeFilesView::OnTimerTChart() 
{

	// Animated Rotation, Elevation and Zoom
    m_Chart1.GetAspect().SetRotation(m_Chart1.GetAspect().GetRotation() + DeltaRot);
    if ((m_Chart1.GetAspect().GetRotation() < 275) || (m_Chart1.GetAspect().GetRotation() > 355))
	{
       DeltaRot = -DeltaRot;
	}
    m_Chart1.GetAspect().SetElevation(m_Chart1.GetAspect().GetElevation() + DeltaElev);
    if ((m_Chart1.GetAspect().GetElevation() < 275) || (m_Chart1.GetAspect().GetElevation() > 355))
	{
       DeltaElev = -DeltaElev;
	}
    m_Chart1.GetAspect().SetZoom(m_Chart1.GetAspect().GetZoom() + DeltaZoom);
    if ((m_Chart1.GetAspect().GetZoom() < 50) || (m_Chart1.GetAspect().GetZoom() > 270))
	{
       DeltaZoom = -DeltaZoom;
	}
}

void CTeeFilesView::OnUndoZoomTChart() 
{
}

void CTeeFilesView::OnZoomTChart() 
{
}


