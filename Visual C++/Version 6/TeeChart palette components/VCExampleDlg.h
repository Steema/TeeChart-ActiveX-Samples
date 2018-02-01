// VCExampleDlg.h : header file
//
//{{AFX_INCLUDES()
#include "tchart.h"
#include "teecommander.h"
#include "teeeditor.h"
#include "teelistbox.h"
#include "teepreviewer.h"
//}}AFX_INCLUDES

#if !defined(AFX_VCEXAMPLEDLG_H__8C881909_9045_11D1_ACBB_00400141862D__INCLUDED_)
#define AFX_VCEXAMPLEDLG_H__8C881909_9045_11D1_ACBB_00400141862D__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

/////////////////////////////////////////////////////////////////////////////
// CVCExampleDlg dialog

class CVCExampleDlg : public CDialog
{
// Construction
public:
	CVCExampleDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CVCExampleDlg)
	enum { IDD = IDD_VCEXAMPLE_DIALOG };
	CButton	m_Button4;
	CTChart	m_Chart1;
	CTeeEditor	m_TeeEditor1;
	CTeeListBox	m_TeeListBox1;
	CTeePreviewer	m_TeePreviewer1;
	CTeeCommander	m_TeeCommander1;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CVCExampleDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CVCExampleDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButton1();
	afx_msg void OnButton2();
	afx_msg void OnButton3();
	afx_msg void OnButton4();
	afx_msg void OnOnAfterDrawTchart1();
	afx_msg void OnButton5();
	afx_msg void OnOnBeforeDrawSeriesTchart1();
	DECLARE_EVENTSINK_MAP()
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_VCEXAMPLEDLG_H__8C881909_9045_11D1_ACBB_00400141862D__INCLUDED_)
