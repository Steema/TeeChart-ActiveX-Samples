VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form ToolAnnotationClickForm 
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
      Height          =   5850
      Left            =   0
      TabIndex        =   0
      Top             =   1065
      Width           =   11505
      Base64          =   $"ToolAnnotationClickForm.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   570
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "ToolAnnotationClickForm.frx":00E0
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Click over the Annotation..."
      Height          =   240
      Left            =   45
      TabIndex        =   2
      Top             =   675
      Width           =   5280
   End
End
Attribute VB_Name = "ToolAnnotationClickForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
With TChart1
    .AddSeries scLine
    .Series(0).FillSampleValues (10)
    .Tools.Add tcAnnotate
    .Tools.Items(0).asAnnotation.Text = "My Annotation"
End With
End Sub

Private Sub TChart1_OnAnnotationToolClick(ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
MsgBox "Annotation Clicked"
End Sub
