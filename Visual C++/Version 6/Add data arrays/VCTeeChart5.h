// VCTeeChart5.h : main header file for the VCTEECHART5 application
//

#if !defined(AFX_VCTEECHART5_H__95CF4559_1A06_11D5_93FD_006008A7EED4__INCLUDED_)
#define AFX_VCTEECHART5_H__95CF4559_1A06_11D5_93FD_006008A7EED4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CVCTeeChart5App:
// See VCTeeChart5.cpp for the implementation of this class
//

class CVCTeeChart5App : public CWinApp
{
public:
	CVCTeeChart5App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CVCTeeChart5App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CVCTeeChart5App)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_VCTEECHART5_H__95CF4559_1A06_11D5_93FD_006008A7EED4__INCLUDED_)
