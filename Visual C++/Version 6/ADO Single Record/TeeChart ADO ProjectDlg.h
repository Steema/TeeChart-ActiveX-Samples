// TeeChart ADO ProjectDlg.h : header file
//
//{{AFX_INCLUDES()
#include "adodc.h"
#include "tchart.h"
//}}AFX_INCLUDES

#if !defined(AFX_TEECHARTADOPROJECTDLG_H__795CC3ED_22C1_4359_A90F_9127F801E3C0__INCLUDED_)
#define AFX_TEECHARTADOPROJECTDLG_H__795CC3ED_22C1_4359_A90F_9127F801E3C0__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CTeeChartADOProjectDlg dialog

class CTeeChartADOProjectDlg : public CDialog
{
// Construction
public:
	CTeeChartADOProjectDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CTeeChartADOProjectDlg)
	enum { IDD = IDD_TEECHARTADOPROJECT_DIALOG };
	CAdodc	m_Adodc1;
	CTChart	m_Chart1;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTeeChartADOProjectDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CTeeChartADOProjectDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnShowWindow(BOOL bShow, UINT nStatus);
	afx_msg void OnCancelMode();
	afx_msg void OnCaptureChanged(CWnd *pWnd);
	afx_msg void OnRecordChangeCompleteAdodc1(long adReason, long cRecords, LPDISPATCH pError, long FAR* adStatus, LPDISPATCH pRecordset);
	afx_msg void OnFieldChangeCompleteAdodc1(long cFields, VARIANT FAR* Fields, LPDISPATCH pError, long FAR* adStatus, LPDISPATCH pRecordset);
	afx_msg void OnMoveCompleteAdodc1(long adReason, LPDISPATCH pError, long FAR* adStatus, LPDISPATCH pRecordset);
	DECLARE_EVENTSINK_MAP()
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TEECHARTADOPROJECTDLG_H__795CC3ED_22C1_4359_A90F_9127F801E3C0__INCLUDED_)
