// SeriesTxtSrcDlg.h : header file
//
//{{AFX_INCLUDES()
#include "tchart.h"
#include "seriestextsource.h"
#include "teecommander.h"
//}}AFX_INCLUDES

#if !defined(AFX_SeriesTxtSrcDLG_H__B255C531_21C9_11D5_9407_006008A7EED4__INCLUDED_)
#define AFX_SeriesTxtSrcDLG_H__B255C531_21C9_11D5_9407_006008A7EED4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CSeriesTxtSrcDlg dialog

class CSeriesTxtSrcDlg : public CDialog
{
// Construction
public:
	CSeriesTxtSrcDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CSeriesTxtSrcDlg)
	enum { IDD = IDD_SeriesTxtSrc_DIALOG };
	CTChart	m_Chart1;
	CSeriesTextSource	m_TextSource1;
	CTeeCommander	m_Commander1;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSeriesTxtSrcDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

    VARIANT SeriesIndex;
	
// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CSeriesTxtSrcDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButton1();
	afx_msg void OnButton2();
	afx_msg void OnButton3();
	afx_msg void OnButton4();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

	void AddData();
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SeriesTxtSrcDLG_H__B255C531_21C9_11D5_9407_006008A7EED4__INCLUDED_)
