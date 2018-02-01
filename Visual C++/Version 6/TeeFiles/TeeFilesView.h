// TeeFilesView.h : interface of the CTeeFilesView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_TEEFILESVIEW_H__9D4989EE_6CE6_11D2_AF1D_00400141862D__INCLUDED_)
#define AFX_TEEFILESVIEW_H__9D4989EE_6CE6_11D2_AF1D_00400141862D__INCLUDED_

#include "tchart.h"
#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

class CTeeFilesView : public CView
{
protected: // create from serialization only
	CTeeFilesView();
	DECLARE_DYNCREATE(CTeeFilesView)

// Attributes
public:
	CTeeFilesDoc* GetDocument();
	CTChart m_Chart1;
	BOOL Animate;
	INT DeltaRot;
	INT DeltaElev;
	INT DeltaZoom;
	BOOL ORIGVIEW;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTeeFilesView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	virtual BOOL Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext = NULL);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CTeeFilesView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	// Manually add the EventSink map for the CView
	// This can be generated for copying, by adding a TChart
	// to a dialog box and auto-generating the map there.
	// See also CTeeViewView.cpp
	afx_msg void OnMouseDownTChart(long Button, long Shift, long X, long Y);
	afx_msg void OnAfterDrawTChart();
	afx_msg void OnBeforeDrawSeriesTChart();
	afx_msg void OnBeforeDrawAxesTChart();
	afx_msg void OnClickTChart();
	afx_msg void OnClickAxisTChart(long Axis, long Button, long Shift, long X, long Y);
	afx_msg void OnClickBackgroundTChart(long Button, long Shift, long X, long Y);
	afx_msg void OnClickLegendTChart(long Button, long Shift, long X, long Y);
	afx_msg void OnClickSeriesTChart(long SeriesIndex, long ValueIndex, long Button, long Shift, long X, long Y);
	afx_msg void OnDblClickTChart();
	afx_msg void OnDragDropTChart(long X, long Y);
	afx_msg void OnDragOverTChart(long X, long Y, long State, BOOL FAR* Accept);
	afx_msg void OnEndDragTChart(long X, long Y);
	afx_msg void OnEnterTChart();
	afx_msg void OnExitTChart();
	afx_msg void OnGetAxisLabelTChart(long Axis, long SeriesIndex, long ValueIndex, BSTR FAR* LabelText);
	afx_msg void OnGetLegendRectTChart(long FAR* Left, long FAR* Top, long FAR* Right, long FAR* Bottom);
	afx_msg void OnGetNextAxisLabelTChart(long Axis, long LabelIndex, double FAR* LabelValue, BOOL FAR* MoreLabels);
	afx_msg void OnMouseMoveTChart(long Shift, long X, long Y);
	afx_msg void OnMouseUpTChart(long Button, long Shift, long X, long Y);
	afx_msg void OnPageChangeTChart();
	afx_msg void OnResizeTChart();
	afx_msg void OnScrollTChart();
	afx_msg void OnStartDragTChart();
	afx_msg void OnTimerTChart();
	afx_msg void OnUndoZoomTChart();
	afx_msg void OnZoomTChart();
	DECLARE_EVENTSINK_MAP()

// Generated message map functions
protected:
	//{{AFX_MSG(CTeeFilesView)
	afx_msg void OnFileOpen();
	afx_msg void OnAnimate();
	afx_msg void OnAppAbout();
	afx_msg void OnFileSaveAs();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnFilePrint();
	afx_msg void OnFilePrintPreview();
	afx_msg void OnEditor();
	afx_msg void OnCleardsn();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in TeeFilesView.cpp
inline CTeeFilesDoc* CTeeFilesView::GetDocument()
   { return (CTeeFilesDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TEEFILESVIEW_H__9D4989EE_6CE6_11D2_AF1D_00400141862D__INCLUDED_)
