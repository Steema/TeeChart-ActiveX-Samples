// PrintingView.h : interface of the CPrintingView class
//
/////////////////////////////////////////////////////////////////////////////
//{{AFX_INCLUDES()
#include "tchart.h"
//}}AFX_INCLUDES

#if !defined(AFX_PRINTINGVIEW_H__FDFDC776_03EF_11D2_B7B6_DDA81BDA2709__INCLUDED_)
#define AFX_PRINTINGVIEW_H__FDFDC776_03EF_11D2_B7B6_DDA81BDA2709__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

class CPrintingView : public CFormView
{
protected: // create from serialization only
	CPrintingView();
	DECLARE_DYNCREATE(CPrintingView)

public:
	//{{AFX_DATA(CPrintingView)
	enum { IDD = IDD_PRINTINGVIEW };
	CEdit	m_edUpper;
	CEdit	m_edLower;
	CTChart	m_ctrlChart;
	CString	m_strLower;
	CString	m_strUpper;
	//}}AFX_DATA

// Attributes
public:
	CPrintingDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPrintingView)
	public:
	virtual void OnInitialUpdate();
	virtual BOOL Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext = NULL);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnPrint(CDC* pDC, CPrintInfo*);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CPrintingView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	void FillUpperEdit();
	void FillLowerEdit();
	//{{AFX_MSG(CPrintingView)
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnEditor();
	afx_msg void OnTeeAbout();
	DECLARE_EVENTSINK_MAP()
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
};

#ifndef _DEBUG  // debug version in PrintingView.cpp
inline CPrintingDoc* CPrintingView::GetDocument()
   { return (CPrintingDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PRINTINGVIEW_H__FDFDC776_03EF_11D2_B7B6_DDA81BDA2709__INCLUDED_)
