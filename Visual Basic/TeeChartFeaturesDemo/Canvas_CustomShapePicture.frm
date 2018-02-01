VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Begin VB.Form Canvas_CustomShapePicture 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5745
      Left            =   0
      TabIndex        =   1
      Top             =   1170
      Width           =   11505
      Base64          =   $"Canvas_CustomShapePicture.frx":0000
      Begin ComctlLib.ImageList ImageList1 
         Left            =   9990
         Top             =   3270
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   327682
         BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
            NumListImages   =   5
            BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
               Picture         =   "Canvas_CustomShapePicture.frx":074A
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
               Picture         =   "Canvas_CustomShapePicture.frx":0A9C
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
               Picture         =   "Canvas_CustomShapePicture.frx":0DEE
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
               Picture         =   "Canvas_CustomShapePicture.frx":1140
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
               Picture         =   "Canvas_CustomShapePicture.frx":1492
               Key             =   ""
            EndProperty
         EndProperty
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Canvas_CustomShapePicture.frx":17E4
      Top             =   0
      Width           =   11460
   End
End
Attribute VB_Name = "Canvas_CustomShapePicture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
  For i = 0 To TChart1.Series(0).Count - 1
   TChart1.Series(0).Marks.Item(i).Picture.AssignImage ImageList1.ListImages.Item(i + 1).Picture
  Next i
End Sub

Private Sub TChart1_OnGetSeriesMark(ByVal SeriesIndex As Long, ByVal ValueIndex As Long, MarkText As String)
  MarkText = "      " & Chr$(13) & "      "
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
