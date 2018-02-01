VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form OnBeforeAddForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   4245
   ClientTop       =   1950
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5715
      Left            =   0
      TabIndex        =   0
      Top             =   1200
      Width           =   11505
      Base64          =   $"OnBeforeAddForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Refresh data"
      Height          =   345
      Left            =   3780
      TabIndex        =   3
      Top             =   810
      Width           =   1215
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Apply custom function to data y=(y*x)+2"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   870
      Width           =   3195
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   735
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "OnBeforeAddForm.frx":0668
      Top             =   0
      Width           =   11235
   End
End
Attribute VB_Name = "OnBeforeAddForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim ApplyFunction As Boolean

Private Sub Check1_Click()
  ApplyFunction = Check1.Value
End Sub

Private Sub Command1_Click()
  AddData
End Sub

Private Sub Form_Load()
  ApplyFunction = False
  AddData
End Sub

Private Sub AddData()
   With TChart1.Series(0)
     .Clear
     .AddXY 1, 1, "", clTeeColor
     .AddXY 2, 2, "", clTeeColor
     .AddXY 3, 3, "", clTeeColor
     .AddXY 4, 4, "", clTeeColor
     .AddXY 5, 5, "", clTeeColor
   End With
End Sub


Private Sub TChart1_OnSeriesBeforeAdd(ByVal SeriesIndex As Long, Continue As Boolean)
  If ApplyFunction = True Then
    With TChart1.Series(SeriesIndex)
      .YValues.TempValue = (.YValues.TempValue * .XValues.TempValue) + 2
    End With
  End If
End Sub
