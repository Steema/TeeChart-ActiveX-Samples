VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form DynArraysForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   2850
   ClientTop       =   2295
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   5205
      Left            =   2370
      TabIndex        =   0
      Top             =   1680
      Width           =   9090
      Base64          =   $"DynArraysForm.frx":0000
   End
   Begin VB.Frame Frame1 
      Caption         =   "Time taken"
      Height          =   795
      Left            =   0
      TabIndex        =   14
      Top             =   3450
      Width           =   2355
      Begin VB.Label Label1 
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   300
         Width           =   1515
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "AddXY -  2 arrays, non ordered points"
      Height          =   795
      Left            =   7470
      TabIndex        =   12
      Top             =   840
      Width           =   4005
      Begin VB.CommandButton Command3 
         Caption         =   "Load to Chart"
         Height          =   375
         Left            =   780
         TabIndex        =   13
         Top             =   300
         Width           =   1335
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "AddXY - 2 arrays, x ordered points, random intervals"
      Height          =   795
      Left            =   2370
      TabIndex        =   10
      Top             =   840
      Width           =   5085
      Begin VB.CommandButton Command4 
         Caption         =   "Load to Chart"
         Height          =   375
         Left            =   1320
         TabIndex        =   11
         Top             =   300
         Width           =   1335
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Create arrays"
      Height          =   2565
      Left            =   0
      TabIndex        =   5
      Top             =   840
      Width           =   2355
      Begin VB.ComboBox Combo1 
         Height          =   315
         ItemData        =   "DynArraysForm.frx":0612
         Left            =   390
         List            =   "DynArraysForm.frx":0634
         TabIndex        =   7
         Text            =   "100"
         Top             =   720
         Width           =   1455
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Clear Chart"
         Height          =   375
         Left            =   480
         TabIndex        =   6
         Top             =   1320
         Width           =   1215
      End
      Begin VB.Label Label7 
         Caption         =   "Array size"
         Height          =   195
         Left            =   660
         TabIndex        =   9
         Top             =   450
         Width           =   795
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "Creating array..."
         ForeColor       =   &H00C00000&
         Height          =   195
         Left            =   540
         TabIndex        =   8
         Top             =   1980
         Visible         =   0   'False
         Width           =   1110
      End
   End
   Begin VB.Frame Frame3 
      Height          =   2625
      Left            =   0
      TabIndex        =   2
      Top             =   4260
      Width           =   2355
      Begin VB.CommandButton Command1 
         Caption         =   "Add small array"
         Height          =   375
         Left            =   450
         TabIndex        =   3
         Top             =   540
         Width           =   1335
      End
      Begin VB.Label Label8 
         Caption         =   "Small test (9 points)"
         Height          =   255
         Left            =   420
         TabIndex        =   4
         Top             =   1080
         Width           =   1395
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   795
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "DynArraysForm.frx":0683
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "DynArraysForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim StartTime, EndTime, TotalTime As Double
' global variable used to control the demo...
Dim AddingData As Boolean
Dim MyYArray() As Double
Dim MyXArray() As Double
Dim MyXLinearArray() As Double

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Combo1_Change()
 Command3.Enabled = False
 Command4.Enabled = False
 Label9.Visible = True
 DoEvents
 
  TChart1.Series(0).Clear
 
  If Combo1.ListIndex = -1 Then Combo1.ListIndex = 0
  
  ReDim MyYArray(CDbl(Combo1.List(Combo1.ListIndex)))
  ReDim MyXArray(CDbl(Combo1.List(Combo1.ListIndex)))
  ReDim MyXLinearArray(CDbl(Combo1.List(Combo1.ListIndex)))

  For i = 0 To UBound(MyYArray) - 1
     If i = 0 Then
       MyYArray(i) = 1 + (Rnd * 3)
     Else
       MyYArray(i) = MyYArray(i - 1) - 1 + (Rnd * 2)
     End If
     MyXArray(i) = Cos(i) * 10
     If i = 0 Then
       MyXLinearArray(i) = 0
     Else
       MyXLinearArray(i) = MyXLinearArray(i - 1) + (Rnd * 10)
     End If
  Next i
  
 Label9.Visible = False
 Command3.Enabled = True
 Command4.Enabled = True

End Sub

Private Sub Command1_Click()
Dim a, b
  Label1.Caption = ""
  StartTime = Now
  a = Array(2, 3, 4, 5, 7, 1, 4, 5, 2)
  b = Array(4, 1, 8, 6, 2, 3, 3, 7, 1)

  EndTime = Now
  TChart1.Series(0).AddArray 9, a, b
End Sub

Private Sub Command2_Click()
  TChart1.RemoveAllSeries
  TChart1.AddSeries scFastLine
End Sub

Private Sub Command3_Click()
 StartTime = Now
 Label1.Caption = ""
 DoEvents
 AddingData = True
 TChart1.Series(0).AddArray UBound(MyYArray), MyYArray(), MyXArray()
End Sub

Private Sub Command4_Click()
 StartTime = Now
 Label1.Caption = ""
 DoEvents
 AddingData = True
 TChart1.Series(0).AddArray UBound(MyYArray), MyYArray(), MyXLinearArray()
End Sub

Private Sub Form_Load()
  AddingData = False
  Combo1_Change
  'TChart1.Axis.Left.SetMinMax 0, 5
End Sub

Private Sub TChart1_OnAfterDraw()
If AddingData = True Then
 If TChart1.SeriesCount > 0 Then
   If TChart1.Series(0).Count > 0 Then
     EndTime = Now
     TotalTime = (EndTime - StartTime) * 86400
     Label1.Caption = Mid(Str(TotalTime), 1, 6) & " secs."
     AddingData = False
     DoEvents
   End If
 End If
End If
End Sub
