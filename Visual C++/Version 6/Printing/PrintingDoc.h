// PrintingDoc.h : interface of the CPrintingDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_PRINTINGDOC_H__FDFDC774_03EF_11D2_B7B6_DDA81BDA2709__INCLUDED_)
#define AFX_PRINTINGDOC_H__FDFDC774_03EF_11D2_B7B6_DDA81BDA2709__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000


class CPrintingDoc : public CDocument
{
protected: // create from serialization only
	CPrintingDoc();
	DECLARE_DYNCREATE(CPrintingDoc)

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPrintingDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CPrintingDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CPrintingDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PRINTINGDOC_H__FDFDC774_03EF_11D2_B7B6_DDA81BDA2709__INCLUDED_)
