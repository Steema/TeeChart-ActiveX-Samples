// PrintingView.cpp : implementation of the CPrintingView class
//

#include "stdafx.h"
#include "Printing.h"

#include "Panel.h"
#include "PrintingDoc.h"
#include "PrintingView.h"
#include "Printer.h"
#include "Canvas.h"
#include "ChartFont.h"
#include "TeeFont.h"
#include "Series.h"
#include "Strings.h"
#include "TeeChartDefines.h"
#include "Titles.h"
#include "Gradient.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPrintingView

IMPLEMENT_DYNCREATE(CPrintingView, CFormView)
BEGIN_MESSAGE_MAP(CPrintingView, CFormView)
	//{{AFX_MSG_MAP(CPrintingView)
	ON_WM_SIZE()
	ON_COMMAND(IDM_EDITOR, OnEditor)
	ON_COMMAND(IDM_TEEABOUT, OnTeeAbout)
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CFormView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CFormView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CFormView::OnFilePrintPreview)
END_MESSAGE_MAP()

BEGIN_EVENTSINK_MAP(CPrintingView, CFormView)
    //{{AFX_EVENTSINK_MAP(CPrintingView)
	//}}AFX_EVENTSINK_MAP
END_EVENTSINK_MAP()
/////////////////////////////////////////////////////////////////////////////
// CPrintingView construction/destruction

CPrintingView::CPrintingView()
	: CFormView(CPrintingView::IDD),
	m_strUpper(""),	
	m_strLower("")	
{
	//{{AFX_DATA_INIT(CPrintingView)
	//}}AFX_DATA_INIT
	// TODO: add construction code here

	// Do this here, so DoDataExchange will fill the edits
	FillUpperEdit();
	FillLowerEdit();
}

CPrintingView::~CPrintingView()
{
}

void CPrintingView::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPrintingView)
	DDX_Control(pDX, IDC_UPPEREDIT, m_edUpper);
	DDX_Control(pDX, IDC_LOWEREDIT, m_edLower);
	DDX_Control(pDX, IDC_TCHART1, m_ctrlChart);
	DDX_Text(pDX, IDC_LOWEREDIT, m_strLower);
	DDX_Text(pDX, IDC_UPPEREDIT, m_strUpper);
	//}}AFX_DATA_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CPrintingView printing

BOOL CPrintingView::OnPreparePrinting(CPrintInfo* pInfo)
{
	pInfo->SetMaxPage(1);
	pInfo->m_pPD->m_pd.Flags |= PD_HIDEPRINTTOFILE;
	
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CPrintingView::OnBeginPrinting(CDC*, CPrintInfo* pInfo)
{

}

void CPrintingView::OnEndPrinting(CDC*, CPrintInfo* pInfo)
{

}

void CPrintingView::OnPrint(CDC* pDC, CPrintInfo* pInfo)
{
	CString strText;
	m_edUpper.GetWindowText(strText);

	int iWhere = pDC->DrawText(strText, strText.GetLength(), CRect(50, 50, 
						pInfo->m_rectDraw.Width() - 100, pInfo->m_rectDraw.Height()),
						DT_WORDBREAK);

	iWhere += 350;					// add some space 
	if (!pInfo->m_bPreview)
	{	
		long w;
		if (m_ctrlChart.GetPrinter().GetOrientation() == poLandscape)
		{
			w = m_ctrlChart.GetPrinter().GetPageHeight();
		}
		else
		{
			w = m_ctrlChart.GetPrinter().GetPageWidth();
		}
			m_ctrlChart.GetPrinter().PrintPartialHandle(COleVariant(LONG(pDC->m_hDC)), 50, iWhere, 
		  						  w - 50, 
								  pInfo->m_rectDraw.Height() / 2);
	}
	else
	{
		int iSavedDC = pDC->SaveDC();	// save the DC
										// (DC saves with PrintPartialHandle)
	    m_ctrlChart.Draw(LONG(pDC->m_hDC), 50, iWhere, 
								  pInfo->m_rectDraw.Width() - 50, 
								  pInfo->m_rectDraw.Height() / 2);
		pDC->RestoreDC(iSavedDC);
	}

	iWhere += pInfo->m_rectDraw.Height() / 3;
	m_edLower.GetWindowText(strText);
	CRect rect(pInfo->m_rectDraw.Width() / 4, iWhere, 
					pInfo->m_rectDraw.Width() / 2, iWhere + 2000);
	pDC->DrawText(strText, strText.GetLength(), rect, DT_WORDBREAK);
	CView::OnPrint(pDC, pInfo);
  }

/////////////////////////////////////////////////////////////////////////////
// CPrintingView diagnostics
BOOL CPrintingView::Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext) 
{
	// TODO: Add your specialized code here and/or call the base class
	
	BOOL bSuccess = CFormView::Create(lpszClassName, lpszWindowName, dwStyle, rect, pParentWnd, nID, pContext);

	// If this wasn't a CFormView one would have to create the chart control here
	// and then size it in OnSize()
	//
	// bSuccess = m_ctrlChart.Create("", dwStyle, rect, this, IDC_TCHART1);
	
	return bSuccess;
}

/////////////////////////////////////////////////////////////////////////////
// CPrintingView message handlers
void CPrintingView::OnSize(UINT nType, int cx, int cy) 
{
	CFormView::OnSize(nType, cx, cy);
	if (::IsWindow(m_ctrlChart.m_hWnd))
	{
		m_edUpper.MoveWindow(20, 10, cx - 40, cy /4 - 20);
		m_edLower.MoveWindow(cx / 4, cy / 4 * 3 + 10, cx / 2, cy /4 - 20);
		m_ctrlChart.SetWidth(cx - 40);
		m_ctrlChart.SetHeight(cy /2);
		m_ctrlChart.SetLeft(20);
		m_ctrlChart.SetTop(cy / 4);
	}
}

void CPrintingView::OnInitialUpdate() 
{
	// We don't want scrollbars they mess up our positioning
	CSize size(500, 500);
	SetScaleToFitSize(size);
	CFormView::OnInitialUpdate();

	m_ctrlChart.RemoveAllSeries();
	m_ctrlChart.AddSeries(scArea);	
	m_ctrlChart.Series(0).FillSampleValues(16);
	m_ctrlChart.Series(0).SetTitle("Area Series");
	m_ctrlChart.AddSeries(scLine);	
	m_ctrlChart.Series(1).FillSampleValues(16);
	m_ctrlChart.Series(1).SetTitle("Line Series");
	m_ctrlChart.AddSeries(scBar);	
	m_ctrlChart.Series(2).FillSampleValues(16);
	m_ctrlChart.Series(2).SetTitle("Bar Series");

	m_ctrlChart.GetHeader().GetText().Clear();
	CString strFooter(" A Footer Comment");
	COleVariant var(strFooter);
	m_ctrlChart.GetFooter().GetFont().SetSize(11);
	m_ctrlChart.GetFooter().GetText().Clear();	
	m_ctrlChart.GetFooter().GetText().Add(*(LPCVARIANT)var);
	m_ctrlChart.GetHeader().GetFont().SetSize(13);
	m_ctrlChart.GetHeader().GetText().Clear();	
	m_ctrlChart.GetPanel().GetGradient().SetVisible(TRUE);
	var = CString("A Header Text");
	m_ctrlChart.GetHeader().GetText().Add(*(LPCVARIANT)var);
	int i = m_edLower.GetWindowTextLength();
	m_edLower.SetSel(i, i);
	m_edLower.SetFocus();
}


void CPrintingView::FillLowerEdit()
{
	m_strLower = "The text in this edit box will be placed "
		"below the chart.\r\nFeel free to edit it.";

}

void CPrintingView::FillUpperEdit()
{
	m_strUpper = "This example shows you how to\r\n- create a TeeChart in a CView "
		"instead of a CDialog and\r\n- how to place a TeeChart anywhere in flowing text.\r\n"
		"The main difference between creating a TeeChart object in a CView is, that "
		"unless as in this case where we are using a CFormView, you will have to create the "
		"object ourself in CView::Create() or CView::OnCreate() instead of having class wizard do it, "
		"and that you will have to overwrite CView::OnSize for sizing it.\r\n"
		"Have a look at the sample code, it's not too complicated !";
}

void CPrintingView::OnEditor() 
{
	m_ctrlChart.ShowEditor(-1);
}

void CPrintingView::OnTeeAbout() 
{
	m_ctrlChart.AboutBox();	
}

#ifdef _DEBUG
void CPrintingView::AssertValid() const
{
	CFormView::AssertValid();
}

void CPrintingView::Dump(CDumpContext& dc) const
{
	CFormView::Dump(dc);
}

CPrintingDoc* CPrintingView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CPrintingDoc)));
	return (CPrintingDoc*)m_pDocument;
}
#endif //_DEBUG

