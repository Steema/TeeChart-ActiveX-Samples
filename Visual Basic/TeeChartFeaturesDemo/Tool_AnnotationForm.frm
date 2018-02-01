VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_AnnotationForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3600
   ClientTop       =   2805
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5745
      Left            =   0
      TabIndex        =   0
      Top             =   1170
      Width           =   11505
      Base64          =   $"Tool_AnnotationForm.frx":0000
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Show annotations"
      Height          =   195
      Left            =   2100
      TabIndex        =   3
      Top             =   780
      Value           =   1  'Checked
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Refresh Series values"
      Height          =   345
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   615
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Tool_AnnotationForm.frx":0660
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_AnnotationForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Check1_Click()
Dim i
  For i = 0 To TChart1.Tools.Count - 1
    If TChart1.Tools.Items(0).ToolType = tcAnnotate Then
      TChart1.Tools(i).Active = Check1.Value
    End If
  Next i
End Sub

Private Sub Command1_Click()
  TChart1.Series(0).FillSampleValues 7
End Sub

Private Sub Form_Load()
  With TChart1
    .Series(0).FillSampleValues 7
    .Tools.Items(0).asAnnotation.Shape.Transparency = 50
  End With
End Sub

Private Sub TChart1_OnBeforeDrawSeries()
Dim XVal, YVal
  
  With TChart1
   For i = 0 To .Series(0).Count - 1
    If .Series(0).YValues.Value(i) = .Series(0).YValues.Maximum Then
        XVal = .Series(0).CalcXPos(i)
        YVal = .Series(0).CalcYPos(i)
    End If
   Next i
   With .Tools.Items(1).asAnnotation
    .Text = "Data sensitive." & Chr$(13) & "Highest val: " & TChart1.Series(0).YValues.Maximum
    .Shape.Left = XVal
    .Shape.Top = YVal
   End With
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub


