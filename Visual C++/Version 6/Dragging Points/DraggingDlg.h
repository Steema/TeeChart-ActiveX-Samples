// DraggingDlg.h : header file
//
//{{AFX_INCLUDES()
#include "tchart.h"
//}}AFX_INCLUDES

#if !defined(AFX_DRAGGINGDLG_H__3815AE6A_EDBA_11D1_B7B6_A79DF87EBA16__INCLUDED_)
#define AFX_DRAGGINGDLG_H__3815AE6A_EDBA_11D1_B7B6_A79DF87EBA16__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
#include "resource.h"

/////////////////////////////////////////////////////////////////////////////
// CDraggingDlg dialog

class CDraggingDlg : public CDialog
{
// Construction
public:
	CDraggingDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CDraggingDlg)
	enum { IDD = IDD_DRAGGING_DIALOG };
	CComboBox	m_ctrlBars;
	CButton	m_ctrlCheckBox;
	CSliderCtrl	m_ctrlSlider;
	CTChart	m_ctrlChart;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDraggingDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CDraggingDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnSelchangeCombo();
	afx_msg void OnClose();
	afx_msg void On3D();
	afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar);
	afx_msg void OnAbout();
	afx_msg void OnAfterDrawTChart();
	afx_msg void OnMouseDownTChart(long Button, long Shift, long X, long Y);
	afx_msg void OnMouseMoveTchart(long Shift, long X, long Y);
	afx_msg void OnMouseUpTchart(long Button, long Shift, long X, long Y);
	DECLARE_EVENTSINK_MAP()
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	int m_ClickedBar;
	void FillListBox();
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DRAGGINGDLG_H__3815AE6A_EDBA_11D1_B7B6_A79DF87EBA16__INCLUDED_)
