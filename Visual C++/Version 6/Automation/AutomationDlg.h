// AutomationDlg.h : header file
//
//{{AFX_INCLUDES()
#include "disimage.h"
//}}AFX_INCLUDES

#if !defined(AFX_AUTOMATIONDLG_H__D5C20DC7_E766_11D1_B7B6_F8C76E00F404__INCLUDED_)
#define AFX_AUTOMATIONDLG_H__D5C20DC7_E766_11D1_B7B6_F8C76E00F404__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
#include "Resource.h"

/////////////////////////////////////////////////////////////////////////////
// CAutomationDlg dialog

class CAutomationDlg : public CDialog
{
// Construction
public:
	 ~CAutomationDlg();
	CAutomationDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CAutomationDlg)
	enum { IDD = IDD_AUTOMATION_DIALOG };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAutomationDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CAutomationDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnExecute();
	afx_msg void OnClose();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	CString m_strFileName;
	CBitmap m_bmpPicture;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_AUTOMATIONDLG_H__D5C20DC7_E766_11D1_B7B6_F8C76E00F404__INCLUDED_)
