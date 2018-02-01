// VCTeeChart5Dlg.cpp : implementation file
//

#include "stdafx.h"
#include "VCTeeChart5.h"
#include "VCTeeChart5Dlg.h"
#include "TeeChartDefines.h"
#include "Series.h"
#include "TeeEditorShowPages.h"
#include "math.h"
#include "Page.h"
#include "Aspect.h"

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
// CVCTeeChart5Dlg dialog

CVCTeeChart5Dlg::CVCTeeChart5Dlg(CWnd* pParent /*=NULL*/)
	: CDialog(CVCTeeChart5Dlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CVCTeeChart5Dlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CVCTeeChart5Dlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CVCTeeChart5Dlg)
	DDX_Control(pDX, IDC_TCHART1, m_Chart1);
	DDX_Control(pDX, IDC_TEECOMMANDER1, m_Commander1);
	DDX_Control(pDX, IDC_TEEEDITOR1, m_Editor1);
	DDX_Control(pDX, IDC_TEELISTBOX1, m_Listbox1);
	DDX_Control(pDX, IDC_TEEPREVIEWER1, m_Previewer1);
	DDX_Control(pDX, IDC_CHARTPAGENAVIGATOR1, m_PageNav1);
	DDX_Control(pDX, IDC_CHARTGRIDNAVIGATOR1, m_GridNav1);
	DDX_Control(pDX, IDC_CHARTGRID1, m_Grid1);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CVCTeeChart5Dlg, CDialog)
	//{{AFX_MSG_MAP(CVCTeeChart5Dlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	ON_BN_CLICKED(IDC_BUTTON2, OnButton2)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CVCTeeChart5Dlg message handlers

BOOL CVCTeeChart5Dlg::OnInitDialog()
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
	
	// TODO: Add extra initialization here
	m_Commander1.SetChartLink(m_Chart1.GetChartLink());
	m_PageNav1.SetChartLink(m_Chart1.GetChartLink());
	m_Grid1.SetChartLink(m_Chart1.GetChartLink());
    m_GridNav1.SetGridLink(m_Grid1.GetGridLink());

	//m_Editor1.GetShowPages().SetGeneral(false);
	m_Editor1.SetChartLink(m_Chart1.GetChartLink());

	m_Previewer1.SetPaperColor(RGB(255,124,124));
	m_Previewer1.SetChartLink(m_Chart1.GetChartLink());
    m_Commander1.SetEditorLink(m_Editor1.GetEditorLink());
	m_Commander1.SetPreviewerLink(m_Previewer1.GetPreviewerLink());

	m_Listbox1.SetChartLink(m_Chart1.GetChartLink());


	// Load data arrays for AddArray example
	// ************************************************
		 

		 DWORD numElements[] = {200000};

         // Create the safe-arrays...
         XValues.Create(VT_R8, 1, numElements);
		 YValues.Create(VT_R8, 1, numElements);

         // Initialize them with values...
         long index;
		 for(index=0; index<200000; index++) {
			   double val = index+((rand()*5)/RAND_MAX);
               XValues.PutElement(&index, &val);
            };
         

		 srand(100);

		 for(index=0; index<200000; index++) {
			   double val = index+rand();
               YValues.PutElement(&index, &val);
            };

	 // ************************************************ 
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CVCTeeChart5Dlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CVCTeeChart5Dlg::OnPaint() 
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
HCURSOR CVCTeeChart5Dlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CVCTeeChart5Dlg::OnButton1() 
{
	// TODO: Add your control notification handler code here
	m_Chart1.Series(0).Clear();
	//m_Chart1.AddSeries(scBar);
	m_Chart1.Series(0).FillSampleValues(100);
	m_Chart1.GetPage().SetMaxPointsPerPage(10);
}

void CVCTeeChart5Dlg::OnButton2() 
{

	m_Chart1.Series(0).Clear();

    // Set to 2D (not a requirement)
    m_Chart1.GetAspect().SetView3D(false);

	//Disable Chart Paging
	m_Chart1.GetPage().SetMaxPointsPerPage(0);


/*  *******************************************
	This code, the creation of the arrays
    has been moved to the form's initialisation.
    The commented copy below shows the technique 
	used.
    *******************************************

	COleSafeArray XValues;
	COleSafeArray YValues;
    DWORD numElements[] = {200000};

    // Create the safe-arrays...
    XValues.Create(VT_R8, 1, numElements);
	YValues.Create(VT_R8, 1, numElements);

    // Initialize them with values...
    long index;
	for(index=0; index<200000; index++) {
	   double val = index+((rand()*5)/RAND_MAX);
       XValues.PutElement(&index, &val);
    };
         
    srand(100);

	for(index=0; index<200000; index++) {
	   double val = index+rand();
       YValues.PutElement(&index, &val);
    };

*/
  
    // Add arrays
	m_Chart1.Series(0).AddArray( 200000,YValues,XValues);

	// Refresh ChartGrid
	m_Grid1.RecalcDimensions();

}
