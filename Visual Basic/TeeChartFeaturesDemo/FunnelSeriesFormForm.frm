VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form FunnelSeriesFormForm 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   1650
   ClientTop       =   1545
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5265
      Left            =   0
      TabIndex        =   0
      Top             =   1650
      Width           =   11505
      Base64          =   $"FunnelSeriesFormForm.frx":0000
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   4260
      TabIndex        =   5
      Top             =   1080
      Width           =   1155
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   2940
      Max             =   1
      Min             =   50
      TabIndex        =   3
      Top             =   1140
      Value           =   30
      Width           =   225
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   2520
      TabIndex        =   2
      Top             =   1140
      Width           =   435
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   975
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "FunnelSeriesFormForm.frx":01DC
      Top             =   0
      Width           =   11490
   End
   Begin VB.Label Label1 
      Caption         =   "Desired tolerance for acceptance:"
      Height          =   465
      Left            =   1170
      TabIndex        =   4
      Top             =   1050
      Width           =   1365
   End
End
Attribute VB_Name = "FunnelSeriesFormForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.EditOneSeries 0
End Sub

Private Sub Form_Load()

 With TChart1.Series(0)
   .Marks.Visible = True
   .Marks.Clip = True
   
   .asFunnel.DifferenceLimit = val(Text2.Text)

  ' add some points to Funnnel/Pipeline
   .asFunnel.AddSegment 50, 110, "1st", clTeeColor
   .asFunnel.AddSegment 200, 50, "2nd", clTeeColor
   .asFunnel.AddSegment 100, 50, "3rd", clTeeColor
   .asFunnel.AddSegment 60, 55, "4th", clTeeColor
 End With
 VScroll1_Scroll
End Sub

Private Sub TChart1_OnClickSeries(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, ByVal Button As TeeChart.EMouseButton, ByVal Shift As TeeChart.EShiftState, ByVal X As Long, ByVal Y As Long)
Dim tmpStr As String
Dim funnel As IFunnelSeries

 With TChart1
  If (.Series(SeriesIndex).SeriesType = scFunnel) And (Button = mbLeft) Then
    Set funnel = TChart1.Series(SeriesIndex).asFunnel

    tmpStr = "Quote = " & Format(funnel.QuoteValues.Value(ValueIndex), "0.000") & Chr$(13)
    tmpStr = tmpStr & "Opportunity =" & _
              Format(funnel.OpportunityValues.Value(ValueIndex), "0.000") & Chr$(13)
    tmpStr = tmpStr & "Percentage = " & _
              Format(funnel.OpportunityValues.Value(ValueIndex) / funnel.QuoteValues.Value(ValueIndex) * 100, "0.00") & "%"
    MsgBox (tmpStr)
    .StopMouse
  End If
 End With
End Sub

Private Sub Text2_Change()
 Text2_Confirm
End Sub
Private Sub Text2_Confirm()
 If Not IsNumeric(Text2.Text) Then
  KeepFocus = True
  MsgBox "Please insert a numeric value", , "tolerance"
 Else
  With TChart1.Series(0).asFunnel
   .DifferenceLimit = val(Text2.Text)
  End With
  VScroll1.Value = val(Text2.Text)
 End If
End Sub
Private Sub VScroll1_Change()
 VScroll1_Scroll
End Sub
Private Sub VScroll1_Scroll()
 Text2.Text = Str$(VScroll1.Value)
 Text2_Confirm
End Sub
