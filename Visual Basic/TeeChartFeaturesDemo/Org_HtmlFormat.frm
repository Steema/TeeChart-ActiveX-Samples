VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form Org_HtmlFormat 
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
   Begin VB.CommandButton Command1 
      Caption         =   "&Edit..."
      Height          =   375
      Left            =   150
      TabIndex        =   2
      Top             =   1260
      Width           =   1095
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5205
      Left            =   0
      TabIndex        =   0
      Top             =   1710
      Width           =   11505
      Base64          =   $"Org_HtmlFormat.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1155
      Left            =   0
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Org_HtmlFormat.frx":0D52
      Top             =   0
      Width           =   11520
   End
End
Attribute VB_Name = "Org_HtmlFormat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.ShowEditor 0
End Sub

Private Sub Form_Load()

Dim tmp, tmp1, tmp2, tmp3, i As Integer
Dim img1, img2 As String

  With TChart1
    .Header.Visible = False
    .Legend.Color = vbBlue
    .Series(0).Clear
     
    img1 = App.Path & "\orgimage.jpg"
    img2 = App.Path & "\orgimage2.jpg"
    
    tmp = .Series(0).asOrganizational.Add("<CENTER><IMG WIDTH=50 HEIGHT=50 SRC=" & img1 & "></CENTER>" & _
       "<br><b>John Smith</b><br>President")

    tmp1 = .Series(0).asOrganizational.Add("<CENTER><IMG WIDTH=50 HEIGHT=50 SRC=" & img1 & "></CENTER>" & _
       "<br><b>Brad Scarlet</b><br>Product Manager and Ivestor", tmp)

    tmp2 = .Series(0).asOrganizational.Add("<CENTER><IMG WIDTH=50 HEIGHT=50 SRC=" & img2 & "></CENTER>" & _
       "<br><b>Anne Smart</b><br>VP and Chief Financial Officer", tmp)

    tmp3 = .Series(0).asOrganizational.Add("<CENTER><IMG WIDTH=50 HEIGHT=50 SRC=" & img1 & "></CENTER>" & _
       "<br><b>Paul Patson</b><br>VP and Chief Financial Marketing", tmp)

    .Series(0).asOrganizational.Add "<CENTER><IMG WIDTH=50 HEIGHT=50 SRC=" & img2 & "></CENTER>" & _
       "<br><b>Esther Mercs</b><br>Operacions Director", tmp1

    .Series(0).asOrganizational.Add "<CENTER><IMG WIDTH=50 HEIGHT=50 SRC=" & img1 & "></CENTER>" & _
       "<br><b>Jason Patson</b><br>Services", tmp2

    .Series(0).asOrganizational.Add "<CENTER><IMG WIDTH=50 HEIGHT=50 SRC=" & img2 & "></CENTER>" & _
       "<br><b>Julia Simpson</b><br>Services", tmp3


    For i = 0 To .Series(0).asOrganizational.Items.Count - 1
    With .Series(0).asOrganizational.Item(i).Format
      .TextFormat = ttfHtml
      .Gradient.StartColor = RGB(57, 107, 166)
      .Gradient.MidColor = RGB(44, 135, 213)
      .Gradient.EndColor = RGB(111, 174, 228)
      .Gradient.Visible = True
      .Pen.Visible = False
      .Font.Color = vbBlack
    End With
    Next i
   
    .Legend.Visible = False
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
