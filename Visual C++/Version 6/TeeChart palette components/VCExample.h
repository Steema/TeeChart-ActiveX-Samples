// VCExample.h : main header file for the VCEXAMPLE application
//

#if !defined(AFX_VCEXAMPLE_H__8C881907_9045_11D1_ACBB_00400141862D__INCLUDED_)
#define AFX_VCEXAMPLE_H__8C881907_9045_11D1_ACBB_00400141862D__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CVCExampleApp:
// See VCExample.cpp for the implementation of this class
//

class CVCExampleApp : public CWinApp
{
public:
	CVCExampleApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CVCExampleApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CVCExampleApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_VCEXAMPLE_H__8C881907_9045_11D1_ACBB_00400141862D__INCLUDED_)
