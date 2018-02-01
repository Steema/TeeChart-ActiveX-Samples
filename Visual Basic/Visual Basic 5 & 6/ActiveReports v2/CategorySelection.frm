VERSION 5.00
Object = "{A45D986F-3AAF-4A3B-A003-A6C53E8715A2}#1.0#0"; "ARVIEW2.OCX"
Begin VB.Form frmCategorySelection 
   Caption         =   "Category Selection"
   ClientHeight    =   6792
   ClientLeft      =   60
   ClientTop       =   348
   ClientWidth     =   8988
   LinkTopic       =   "Form1"
   ScaleHeight     =   6792
   ScaleWidth      =   8988
   StartUpPosition =   3  'Windows Default
   Begin DDActiveReportsViewer2Ctl.ARViewer2 arv 
      Height          =   5895
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   8535
      _ExtentX        =   15050
      _ExtentY        =   10393
      SectionData     =   "CategorySelection.frx":0000
   End
   Begin VB.ComboBox cboCategories 
      Height          =   315
      Left            =   2040
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   0
      Width           =   6855
   End
   Begin VB.Label lblSelect 
      Caption         =   "Select a Product Category:"
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   2055
   End
End
Attribute VB_Name = "frmCategorySelection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cboCategories_Click()
Dim rpt As rptCategoryProducts
    If cboCategories.ListIndex >= 0 Then
        If arv.ReportSource Is Nothing Then
            Set rpt = New rptCategoryProducts
            rpt.ShowParameterUI = False
            rpt.dcRptData.DatabaseName = GetVBPath() & "\Nwind.mdb"
'            rpt.dcRptData.RecordSource = "SELECT Products.ProductName, Products.UnitPrice, " & _
'                            "Products.CategoryID, Categories.CategoryName " & _
'                            "FROM Products, Categories " & _
'                            "WHERE Products.CategoryID = Categories.CategoryID AND " & _
'                            "Categories.CategoryName = '" & cboCategories.List(cboCategories.ListIndex) & "'"
            rpt.Parameters("CatName").Value = cboCategories.List(cboCategories.ListIndex)
            Set arv.ReportSource = rpt
        Else
            arv.ReportSource.Stop
'            arv.ReportSource.dcRptData.RecordSource = "SELECT Products.ProductName, Products.UnitPrice, " & _
'                            "Products.CategoryID, Categories.CategoryName " & _
'                            "FROM Products, Categories " & _
'                            "WHERE Products.CategoryID = Categories.CategoryID AND " & _
'                            "Categories.CategoryName = '" & cboCategories.List(cboCategories.ListIndex) & "'"
            
            arv.ReportSource.Parameters("CatName").Value = cboCategories.List(cboCategories.ListIndex)
            Debug.Print arv.ReportSource.dcRptData.RecordSource
            arv.ReportSource.Restart
            Set arv.ReportSource = arv.ReportSource
        End If
    End If
End Sub

Private Sub Form_Load()
Dim db As Database
Dim rs As Recordset
Dim rpt As New rptCategoryProducts

    On Error GoTo ehInitialize
    Set db = DBEngine.Workspaces(0).OpenDatabase(GetVBPath() & "\NWind.mdb")
    
    Set rs = db.OpenRecordset("SELECT CategoryID, CategoryName FROM Categories")
    
    Do While Not rs.EOF
        cboCategories.AddItem rs!CategoryName
        rs.MoveNext
    Loop
    rs.Close: Set rs = Nothing
    db.Close: Set db = Nothing
    
    cboCategories.ListIndex = 0
    
exInitialize:
    Exit Sub
    
ehInitialize:
    MsgBox "Unable to initialize data source" & vbCrLf & Error$
    Resume exInitialize
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    arv.Move 0, arv.Top, ScaleWidth, ScaleHeight - arv.Top
End Sub
