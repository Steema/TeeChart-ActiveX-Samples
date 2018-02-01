// TeeFilesDoc.cpp : implementation of the CTeeFilesDoc class
//

#include "stdafx.h"
#include "TeeFiles.h"

#include "TeeFilesDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTeeFilesDoc

IMPLEMENT_DYNCREATE(CTeeFilesDoc, CDocument)

BEGIN_MESSAGE_MAP(CTeeFilesDoc, CDocument)
	//{{AFX_MSG_MAP(CTeeFilesDoc)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTeeFilesDoc construction/destruction

CTeeFilesDoc::CTeeFilesDoc()
{
}

CTeeFilesDoc::~CTeeFilesDoc()
{
}

BOOL CTeeFilesDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	SetTitle("TeeChart Pro");
	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CTeeFilesDoc serialization

void CTeeFilesDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
	}
	else
	{
	}
}

/////////////////////////////////////////////////////////////////////////////
// CTeeFilesDoc diagnostics

#ifdef _DEBUG
void CTeeFilesDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CTeeFilesDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CTeeFilesDoc commands
