// PrintingDoc.cpp : implementation of the CPrintingDoc class
//

#include "stdafx.h"
#include "Printing.h"

#include "PrintingDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPrintingDoc

IMPLEMENT_DYNCREATE(CPrintingDoc, CDocument)

BEGIN_MESSAGE_MAP(CPrintingDoc, CDocument)
	//{{AFX_MSG_MAP(CPrintingDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPrintingDoc construction/destruction

CPrintingDoc::CPrintingDoc()
{
	// TODO: add one-time construction code here

}

CPrintingDoc::~CPrintingDoc()
{
}

BOOL CPrintingDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	SetTitle("TeeChart Pro");
	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CPrintingDoc serialization

void CPrintingDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CPrintingDoc diagnostics

#ifdef _DEBUG
void CPrintingDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CPrintingDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CPrintingDoc commands
