// TeeChart ADO Project.h : main header file for the TEECHART ADO PROJECT application
//

#if !defined(AFX_TEECHARTADOPROJECT_H__43EE43DB_BEF1_4D43_8CAD_ACC716F14969__INCLUDED_)
#define AFX_TEECHARTADOPROJECT_H__43EE43DB_BEF1_4D43_8CAD_ACC716F14969__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CTeeChartADOProjectApp:
// See TeeChart ADO Project.cpp for the implementation of this class
//

class CTeeChartADOProjectApp : public CWinApp
{
public:
	CTeeChartADOProjectApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTeeChartADOProjectApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CTeeChartADOProjectApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TEECHARTADOPROJECT_H__43EE43DB_BEF1_4D43_8CAD_ACC716F14969__INCLUDED_)
