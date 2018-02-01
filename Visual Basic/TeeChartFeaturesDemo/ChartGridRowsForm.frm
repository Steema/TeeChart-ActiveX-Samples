VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ChartGridRowsForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2640
   ClientTop       =   2595
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.ChartGrid ChartGrid1 
      Height          =   5415
      Left            =   8220
      OleObjectBlob   =   "ChartGridRowsForm.frx":0000
      TabIndex        =   2
      Top             =   1470
      Width           =   3255
   End
   Begin TeeChart.TChart TChart1 
      Height          =   5415
      Left            =   0
      TabIndex        =   0
      Top             =   1470
      Width           =   8250
      Base64          =   $"ChartGridRowsForm.frx":00C6
   End
   Begin VB.TextBox Text3 
      Height          =   315
      Left            =   6300
      MaxLength       =   2
      TabIndex        =   8
      Text            =   "0"
      Top             =   1050
      Width           =   435
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Goto Row/Column"
      Height          =   315
      Left            =   2640
      TabIndex        =   5
      Top             =   1050
      Width           =   1695
   End
   Begin VB.TextBox Text2 
      Height          =   315
      Left            =   5040
      MaxLength       =   2
      TabIndex        =   4
      Text            =   "0"
      Top             =   1050
      Width           =   435
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ChartGridRowsForm.frx":06AC
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Column:"
      Height          =   195
      Left            =   5670
      TabIndex        =   7
      Top             =   1110
      Width           =   570
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Row:"
      Height          =   195
      Left            =   4590
      TabIndex        =   6
      Top             =   1110
      Width           =   375
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Select Row, Column by code:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   1110
      Width           =   2100
   End
End
Attribute VB_Name = "ChartGridRowsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  If (val(Text3.Text) < ChartGrid1.Cols.Count - 1) _
     And (val(Text2.Text) < ChartGrid1.Rows.Count - 2) _
     And (val(Text2.Text) >= 0) _
     And (val(Text3.Text) >= 0) Then
    ChartGrid1.Rows.Row = val(Text2.Text) + 2 '(0 and 1 are Header and Field names)
    ChartGrid1.Cols.Col = val(Text3.Text) + 1 '1 is index column
  End If
End Sub

Private Sub Form_Load()
  ChartGrid1.Chart = TChart1
  TChart1.Series(0).FillSampleValues 7
End Sub

Private Sub Text2_Validate(Cancel As Boolean)
   If (Not IsNumeric(Text2.Text)) Or (val(Text2.Text) > ChartGrid1.Rows.Count - 3) Then
      KeepFocus = True
      MsgBox "Please insert a Row number less than or equal to " & Str$(ChartGrid1.Rows.Count - 3)
   End If
End Sub

Private Sub Text3_Validate(Cancel As Boolean)
   If Not IsNumeric(Text3.Text) Or val(Text3.Text) > ChartGrid1.Cols.Count - 2 Then
      KeepFocus = True
      MsgBox "Please insert a Column number less than or equal to " & Str$(ChartGrid1.Cols.Count - 2)
   End If
End Sub
