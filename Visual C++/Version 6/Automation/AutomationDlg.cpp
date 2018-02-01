// AutomationDlg.cpp : implementation file
//

#include "stdafx.h"
#include "AutomationDlg.h"
#include "TeeChartDefines.h"
#include "TChart.h"
#include "Series.h"
#include "Export.h"

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

/////////////////////////////////////////////////////////////////////////////
// CAutomationDlg dialog
BEGIN_MESSAGE_MAP(CAutomationDlg, CDialog)
	//{{AFX_MSG_MAP(CAutomationDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_EXECUTE, OnExecute)
	ON_BN_CLICKED(IDC_CLOSE, OnClose)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

CAutomationDlg::CAutomationDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CAutomationDlg::IDD, pParent),
	m_strFileName("C:\\MyChart.bmp")
{
	//{{AFX_DATA_INIT(CAutomationDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

CAutomationDlg::~CAutomationDlg()
{
	try
	{
		CFile::Remove(m_strFileName);
	}
	catch(...)
	{
	}
}

void CAutomationDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAutomationDlg)
	//}}AFX_DATA_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CAutomationDlg message handlers

BOOL CAutomationDlg::OnInitDialog()
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
	
	// Custom initialization
	char szFileName[MAX_PATH + 1];
	if (0 != ::GetTempPath(MAX_PATH, szFileName))
	{
		m_strFileName = szFileName;
		m_strFileName += "MyChart.bmp";
	}

	GetDlgItem(IDC_FILENAME)->SetWindowText("");	
	return TRUE;  
}

void CAutomationDlg::OnSysCommand(UINT nID, LPARAM lParam)
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
// to draw the icon.  For MFC applications using the document/view model,
// this is automatically done for you by the framework.

void CAutomationDlg::OnPaint() 
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
HCURSOR CAutomationDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CAutomationDlg::OnExecute() 
{
	// Create the chart object and save it to a file
	CTChart aChart;
	CRect aRect;

	// Make the chart the right size
	GetDlgItem(IDC_BITMAP)->GetWindowRect(&aRect);
	ScreenToClient(aRect);
	aChart.Create("", WS_CHILD, aRect, this, 1111); 	
	aChart.AddSeries(scSmith);//SmithSeries
	aChart.Series(0).FillSampleValues(6);
    aChart.Series(0).SetColorEachPoint(true);	
	// Save it
	aChart.GetExport().SaveToBitmapFile(m_strFileName,0);		
	CString str;
	str.Format("Chart saved to: %s", (const char *)m_strFileName);
	GetDlgItem(IDC_FILENAME)->SetWindowText(str);	

	// Now load it
	HBITMAP hBitmap = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),
					(const char*)m_strFileName, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
	
	CDC *pdc = GetDC();
	CDC dcImage;
	dcImage.CreateCompatibleDC(pdc);
	CBitmap* pOldBitmap;
	m_bmpPicture.Attach(hBitmap);
	pOldBitmap = dcImage.SelectObject(&m_bmpPicture);
	dcImage.SelectObject(&m_bmpPicture);
	pdc->BitBlt(aRect.TopLeft().x, aRect.TopLeft().y, 
			aRect.Width(), aRect.Height(), &dcImage, 0, 0, SRCCOPY);
	dcImage.SelectObject(pOldBitmap);
	m_bmpPicture.Detach();
}

void CAutomationDlg::OnClose() 
{
	EndDialog(IDOK);	
}

