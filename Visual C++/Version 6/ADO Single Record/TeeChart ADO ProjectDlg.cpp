// TeeChart ADO ProjectDlg.cpp : implementation file
//

#include "stdafx.h"
#include "TeeChart ADO Project.h"
#include "TeeChart ADO ProjectDlg.h"
#include "axes.h"
#include "axis.h"
#include "barseries.h"
#include "series.h"
#include "_recordset.h"
#include "valuelist.h"
#include "TeeChartDefines.h"
#include "adodc.h"
#include "ToolList.h"
#include "AnnotationTool.h"
#include "Tools.h"
#include "field.h"
#include "fields.h"
#include <atlbase.h>
#include <comdef.h>



//#include "adodc.h"

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

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTeeChartADOProjectDlg dialog

CTeeChartADOProjectDlg::CTeeChartADOProjectDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CTeeChartADOProjectDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTeeChartADOProjectDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CTeeChartADOProjectDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTeeChartADOProjectDlg)
	DDX_Control(pDX, IDC_ADODC1, m_Adodc1);
	DDX_Control(pDX, IDC_TCHART1, m_Chart1);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CTeeChartADOProjectDlg, CDialog)
	//{{AFX_MSG_MAP(CTeeChartADOProjectDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTeeChartADOProjectDlg message handlers

BOOL CTeeChartADOProjectDlg::OnInitDialog()
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
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// ******************************************************************
	// Setup the ADO Recordset. This uses TeeChart's Months example table
	// which stores data as 12 monthly datasets 
	// ******************************************************************
    m_Adodc1.SetConnectionString("Provider=MSDASQL.1;Persist Security Info=False;Data Source=TeeChart Pro Database");
	m_Adodc1.SetCommandType(1);
	m_Adodc1.SetRecordSource("SELECT * FROM Months");
	m_Adodc1.Refresh();

	// ******************************************************************
	// Setup The Recordset as data input to the Chart Series
	// ******************************************************************
	m_Chart1.Series(0).SetDatasourceType(dstSingleRecord);
	m_Chart1.Series(0).SetDataSource((_variant_t)m_Adodc1.GetRecordset());
	m_Chart1.Series(0).GetYValues().SetValueSource("Jan;Feb;Mar;Apr;May;Jun;Jul;Aug;Sep;Oct;Nov;Dec");
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CTeeChartADOProjectDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CTeeChartADOProjectDlg::OnPaint() 
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
HCURSOR CTeeChartADOProjectDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}


BEGIN_EVENTSINK_MAP(CTeeChartADOProjectDlg, CDialog)
    //{{AFX_EVENTSINK_MAP(CTeeChartADOProjectDlg)
	ON_EVENT(CTeeChartADOProjectDlg, IDC_ADODC1, 201 /* MoveComplete */, OnMoveCompleteAdodc1, VTS_I4 VTS_DISPATCH VTS_PI4 VTS_DISPATCH)
	//}}AFX_EVENTSINK_MAP
END_EVENTSINK_MAP()


void CTeeChartADOProjectDlg::OnMoveCompleteAdodc1(long adReason, LPDISPATCH pError, long FAR* adStatus, LPDISPATCH pRecordset) 
{
	// ******************************************************************
	// Use the Month table's 'Year' field to indicate whereabouts the 
	// Recordset is pointing to in the table and display it in an 
	// annotation
	// ******************************************************************
	m_Chart1.GetTools().GetItems(0).GetAsAnnotation().SetText("Year: " +
	    (_bstr_t)m_Adodc1.GetRecordset().GetFields().GetItem(COleVariant("Year")).GetValue());

	// ******************************************************************
	// The RefreshData instruction asks TeeChart to recheck its data
	// location in the Recordset
	// ******************************************************************
	m_Chart1.RefreshData();
}
