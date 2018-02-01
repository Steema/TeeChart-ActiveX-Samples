// Automation.h : main header file for the AUTOMATION application
//

#if !defined(AFX_AUTOMATION_H__D5C20DC5_E766_11D1_B7B6_F8C76E00F404__INCLUDED_)
#define AFX_AUTOMATION_H__D5C20DC5_E766_11D1_B7B6_F8C76E00F404__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CAutomationApp:
// See Automation.cpp for the implementation of this class
//

class CAutomationApp : public CWinApp
{
public:
	CAutomationApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAutomationApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CAutomationApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_AUTOMATION_H__D5C20DC5_E766_11D1_B7B6_F8C76E00F404__INCLUDED_)
