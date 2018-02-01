VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form AverageFunctionNullsForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3000
   ClientTop       =   1890
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5355
      Left            =   0
      TabIndex        =   0
      Top             =   1560
      Width           =   11505
      Base64          =   $"AverageFunctionNullsForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Include NULLs"
      Height          =   195
      Left            =   180
      TabIndex        =   3
      Top             =   1260
      Value           =   1  'Checked
      Width           =   1755
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "AverageFunctionNullsForm.frx":090E
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Average is:"
      Height          =   195
      Left            =   2340
      TabIndex        =   4
      Top             =   1260
      Width           =   795
   End
   Begin VB.Label LabelAverage 
      AutoSize        =   -1  'True
      Caption         =   "xxxxxxxx"
      Height          =   195
      Left            =   3240
      TabIndex        =   2
      Top             =   1260
      Width           =   600
   End
End
Attribute VB_Name = "AverageFunctionNullsForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
  TChart1.Series(1).FunctionType.asAverage.IncludeNulls = Check1.Value
  SetLabelAverage
End Sub

Private Sub Form_Load()
  ' Add some points and one null point...
  With TChart1
  .Series(0).Clear
  .Series(0).Add 10, "One", vbRed
  .Series(0).Add 20, "Two", vbRed
  .Series(0).AddNull "Three"
  .Series(0).Add 40, "Four", vbRed
  .Series(0).Add 50, "Five", vbRed

  .Series(0).Marks.Style = smsValue
  .Series(1).FunctionType.asAverage.IncludeNulls = True
  .Series(1).CheckDataSource
  End With

  SetLabelAverage
End Sub

Private Sub SetLabelAverage()
Dim tmp As Double
Dim t As Integer
Dim tmpCount As Integer

  ' calculate the sum and number of points...
  tmp = 0
  tmpCount = 0
  With TChart1
    For t = 0 To .Series(0).Count - 1
      'consider or not null points...
      If (.Series(1).FunctionType.asAverage.IncludeNulls = True) _
                            Or (Not .Series(0).IsNull(t) = True) Then
        tmp = tmp + .Series(0).YValues.Value(t)
        tmpCount = tmpCount + 1
      End If
    Next t

    LabelAverage.Caption = Str$(tmp) & " / " & Str$(tmpCount) _
                           & " = " & Str$(tmp / tmpCount)
  End With
End Sub
