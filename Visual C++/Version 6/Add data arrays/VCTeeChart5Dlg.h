// VCTeeChart5Dlg.h : header file
//
//{{AFX_INCLUDES()
#include "tchart.h"
#include "teecommander.h"
#include "teeeditor.h"
#include "teelistbox.h"
#include "teepreviewer.h"
#include "teepreviewpanel.h"
#include "chartpagenavigator.h"
#include "chartgridnavigator.h"
#include "chartgrid.h"
//}}AFX_INCLUDES

#if !defined(AFX_VCTEECHART5DLG_H__95CF455B_1A06_11D5_93FD_006008A7EED4__INCLUDED_)
#define AFX_VCTEECHART5DLG_H__95CF455B_1A06_11D5_93FD_006008A7EED4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CVCTeeChart5Dlg dialog

class CVCTeeChart5Dlg : public CDialog
{
// Construction
public:
	CVCTeeChart5Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CVCTeeChart5Dlg)
	enum { IDD = IDD_VCTEECHART5_DIALOG };
	CTChart	m_Chart1;
	CTeeCommander	m_Commander1;
	CTeeEditor	m_Editor1;
	CTeeListBox	m_Listbox1;
	CTeePreviewer	m_Previewer1;
	CChartPageNavigator	m_PageNav1;
	CChartGridNavigator	m_GridNav1;
	CChartGrid	m_Grid1;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CVCTeeChart5Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

	COleSafeArray XValues;
    COleSafeArray YValues;
// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CVCTeeChart5Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButton1();
	afx_msg void OnButton2();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_VCTEECHART5DLG_H__95CF455B_1A06_11D5_93FD_006008A7EED4__INCLUDED_)
