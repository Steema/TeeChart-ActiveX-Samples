// TeeFilesDoc.h : interface of the CTeeFilesDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_TEEFILESDOC_H__9D4989EC_6CE6_11D2_AF1D_00400141862D__INCLUDED_)
#define AFX_TEEFILESDOC_H__9D4989EC_6CE6_11D2_AF1D_00400141862D__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000


class CTeeFilesDoc : public CDocument
{
protected: // create from serialization only
	CTeeFilesDoc();
	DECLARE_DYNCREATE(CTeeFilesDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTeeFilesDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CTeeFilesDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CTeeFilesDoc)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TEEFILESDOC_H__9D4989EC_6CE6_11D2_AF1D_00400141862D__INCLUDED_)
