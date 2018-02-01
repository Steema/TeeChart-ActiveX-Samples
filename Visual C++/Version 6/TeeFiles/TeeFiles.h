// TeeFiles.h : main header file for the TEEFILES application
//

#if !defined(AFX_TEEFILES_H__9D4989E6_6CE6_11D2_AF1D_00400141862D__INCLUDED_)
#define AFX_TEEFILES_H__9D4989E6_6CE6_11D2_AF1D_00400141862D__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CTeeFilesApp:
// See TeeFiles.cpp for the implementation of this class
//

class CTeeFilesApp : public CWinApp
{
public:
	CTeeFilesApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTeeFilesApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CTeeFilesApp)
	afx_msg void OnAppAbout();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TEEFILES_H__9D4989E6_6CE6_11D2_AF1D_00400141862D__INCLUDED_)
