VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axis_LabelsAlternateForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3570
   ClientTop       =   4440
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5340
      Left            =   0
      TabIndex        =   0
      Top             =   1575
      Width           =   11505
      Base64          =   $"Axis_LabelsAlternateForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Alternate Labels"
      Height          =   285
      Left            =   4995
      TabIndex        =   4
      Top             =   1125
      Value           =   1  'Checked
      Width           =   1680
   End
   Begin VB.Frame Frame1 
      Height          =   600
      Left            =   630
      TabIndex        =   3
      Top             =   900
      Width           =   4065
      Begin VB.OptionButton Option1 
         Caption         =   "Bottom"
         Height          =   285
         Index           =   3
         Left            =   2970
         TabIndex        =   8
         Top             =   180
         Value           =   -1  'True
         Width           =   960
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Right"
         Height          =   285
         Index           =   2
         Left            =   1980
         TabIndex        =   7
         Top             =   180
         Width           =   690
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Top"
         Height          =   285
         Index           =   1
         Left            =   1080
         TabIndex        =   6
         Top             =   180
         Width           =   690
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Left"
         Height          =   285
         Index           =   0
         Left            =   135
         TabIndex        =   5
         Top             =   180
         Width           =   690
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   900
      Left            =   45
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Axis_LabelsAlternateForm.frx":0916
      Top             =   0
      Width           =   11430
   End
   Begin VB.Label Label1 
      Caption         =   "Axis :"
      Height          =   240
      Left            =   180
      TabIndex        =   2
      Top             =   1125
      Width           =   555
   End
End
Attribute VB_Name = "Axis_LabelsAlternateForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
  For i = 0 To Option1.Count - 1
    If Option1.Item(i).Value = True Then
        Selected = i
    End If
  Next i
  Select Case Selected
    Case 0: TChart1.Axis.Left.Labels.Alternate = Check1.Value
    Case 1: TChart1.Axis.Top.Labels.Alternate = Check1.Value
    Case 2: TChart1.Axis.Right.Labels.Alternate = Check1.Value
    Case 3: TChart1.Axis.Bottom.Labels.Alternate = Check1.Value
  End Select
End Sub

Private Sub Form_Load()
With TChart1
    .Series(0).FillSampleValues (20)
    .Axis.Left.Labels.Alternate = True
    .Axis.Top.Labels.Alternate = True
    .Axis.Right.Labels.Alternate = True
    .Axis.Bottom.Labels.Alternate = True
End With
  HighlightAxis TChart1.Axis.Bottom
End Sub

Private Sub HighlightAxis(Axis As TeeChart.IAxis)
   If Axis.Labels.Font.Bold = False Then
      Axis.Labels.Font.Bold = True
   Else
      Axis.Labels.Font.Bold = False
   End If
   If Axis.Labels.Alternate = True Then Check1.Value = 1 Else Check1.Value = 0
End Sub


Private Sub Option1_Click(Index As Integer)
  With TChart1.Axis
    .Left.Labels.Font.Bold = False
    .Top.Labels.Font.Bold = False
    .Right.Labels.Font.Bold = False
    .Bottom.Labels.Font.Bold = False
  End With
  Select Case Index
    Case 0: HighlightAxis TChart1.Axis.Left
    Case 1: HighlightAxis TChart1.Axis.Top
    Case 2: HighlightAxis TChart1.Axis.Right
    Case Else: HighlightAxis TChart1.Axis.Bottom
  End Select
End Sub

Private Sub Text1_DblClick()
TChart1.ShowEditor
End Sub

