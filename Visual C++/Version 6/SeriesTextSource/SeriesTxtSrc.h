// SeriesTxtSrc.h : main header file for the SeriesTxtSrc application
//

#if !defined(AFX_SeriesTxtSrc_H__B255C52F_21C9_11D5_9407_006008A7EED4__INCLUDED_)
#define AFX_SeriesTxtSrc_H__B255C52F_21C9_11D5_9407_006008A7EED4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CSeriesTxtSrcApp:
// See SeriesTxtSrc.cpp for the implementation of this class
//

class CSeriesTxtSrcApp : public CWinApp
{
public:
	CSeriesTxtSrcApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSeriesTxtSrcApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CSeriesTxtSrcApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SeriesTxtSrc_H__B255C52F_21C9_11D5_9407_006008A7EED4__INCLUDED_)
