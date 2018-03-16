VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2018.ocx"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "Tabctl32.ocx"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "TeeChart ActiveX Pro"
   ClientHeight    =   9615
   ClientLeft      =   2265
   ClientTop       =   2145
   ClientWidth     =   14910
   Icon            =   "TeeChartDemo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9615
   ScaleWidth      =   14910
   StartUpPosition =   2  'CenterScreen
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   6960
      Top             =   8460
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   3780
      Top             =   2295
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   14
      Top             =   9300
      Width           =   14910
      _ExtentX        =   26300
      _ExtentY        =   556
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   2
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Width           =   20180
            MinWidth        =   20180
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel2 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Alignment       =   2
            Object.Width           =   7056
            MinWidth        =   7056
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin TabDlg.SSTab SSTab2 
      Height          =   7380
      Left            =   3300
      TabIndex        =   11
      Top             =   675
      Width           =   11655
      _ExtentX        =   20558
      _ExtentY        =   13018
      _Version        =   393216
      TabOrientation  =   1
      Style           =   1
      TabHeight       =   520
      BackColor       =   16777215
      ForeColor       =   16744448
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "Example "
      TabPicture(0)   =   "TeeChartDemo.frx":014A
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Frame3"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "Source Code "
      TabPicture(1)   =   "TeeChartDemo.frx":0166
      Tab(1).ControlEnabled=   0   'False
      Tab(1).ControlCount=   0
      TabCaption(2)   =   "Support"
      TabPicture(2)   =   "TeeChartDemo.frx":0182
      Tab(2).ControlEnabled=   0   'False
      Tab(2).ControlCount=   0
      Begin VB.Frame Frame3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         ForeColor       =   &H00000000&
         Height          =   7005
         Left            =   60
         TabIndex        =   12
         Top             =   0
         Width           =   11580
      End
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   8610
      Left            =   0
      TabIndex        =   1
      Top             =   720
      Width           =   3270
      _ExtentX        =   5768
      _ExtentY        =   15187
      _Version        =   393216
      Style           =   1
      TabHeight       =   520
      BackColor       =   16777215
      TabCaption(0)   =   "What's New ? "
      TabPicture(0)   =   "TeeChartDemo.frx":019E
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Outline1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "All Features "
      TabPicture(1)   =   "TeeChartDemo.frx":01BA
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Outline3"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "Search"
      TabPicture(2)   =   "TeeChartDemo.frx":01D6
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Frame4"
      Tab(2).ControlCount=   1
      Begin ComctlLib.TreeView Outline1 
         Height          =   8175
         Left            =   90
         TabIndex        =   2
         Top             =   360
         Width           =   3060
         _ExtentX        =   5398
         _ExtentY        =   14420
         _Version        =   327682
         HideSelection   =   0   'False
         Indentation     =   141
         LabelEdit       =   1
         Style           =   7
         ImageList       =   "ImageList1"
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Century Gothic"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Frame Frame4 
         Height          =   6870
         Left            =   -74955
         TabIndex        =   4
         Top             =   315
         Width           =   3030
         Begin VB.ListBox List1 
            Height          =   4740
            Left            =   45
            TabIndex        =   15
            Top             =   1800
            Width           =   2895
         End
         Begin ComctlLib.ProgressBar ProgressBar1 
            Height          =   285
            Left            =   90
            TabIndex        =   13
            Top             =   6540
            Width           =   2895
            _ExtentX        =   5106
            _ExtentY        =   503
            _Version        =   327682
            Appearance      =   1
            Min             =   1e-4
         End
         Begin VB.CommandButton Command3 
            Appearance      =   0  'Flat
            Default         =   -1  'True
            DownPicture     =   "TeeChartDemo.frx":01F2
            Height          =   375
            Left            =   2520
            Picture         =   "TeeChartDemo.frx":05B9
            Style           =   1  'Graphical
            TabIndex        =   10
            Top             =   450
            Width           =   420
         End
         Begin VB.ComboBox Combo1 
            Height          =   315
            Left            =   90
            TabIndex        =   9
            Top             =   495
            Width           =   2310
         End
         Begin VB.CheckBox Check2 
            Caption         =   "Look in Source Code"
            Height          =   285
            Left            =   315
            TabIndex        =   7
            Top             =   1485
            Value           =   1  'Checked
            Width           =   2040
         End
         Begin VB.CheckBox Check1 
            Caption         =   "Find all words [ AND ]"
            Height          =   195
            Left            =   315
            TabIndex        =   6
            Top             =   1215
            Value           =   1  'Checked
            Width           =   2040
         End
         Begin VB.Label Label2 
            Caption         =   "Enter words to search : "
            Height          =   195
            Left            =   90
            TabIndex        =   8
            Top             =   225
            Width           =   2040
         End
         Begin VB.Label Label3 
            Caption         =   "Search options :"
            Height          =   240
            Left            =   90
            TabIndex        =   5
            Top             =   900
            Width           =   1950
         End
      End
      Begin ComctlLib.TreeView Outline3 
         Height          =   6855
         Left            =   -74910
         TabIndex        =   3
         Top             =   360
         Width           =   3060
         _ExtentX        =   5398
         _ExtentY        =   12091
         _Version        =   327682
         HideSelection   =   0   'False
         LabelEdit       =   1
         Style           =   7
         ImageList       =   "ImageList1"
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H00000000&
      Height          =   1140
      Left            =   -30
      TabIndex        =   0
      Top             =   -90
      Width           =   14925
      Begin TeeChart.TChart TChart2 
         Height          =   1455
         Left            =   0
         TabIndex        =   18
         Top             =   90
         Width           =   15060
         Base64          =   $"TeeChartDemo.frx":06BB
         Begin VB.ComboBox Combo2 
            Appearance      =   0  'Flat
            BeginProperty Font 
               Name            =   "Century Gothic"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            ItemData        =   "TeeChartDemo.frx":1A99
            Left            =   9180
            List            =   "TeeChartDemo.frx":1AAF
            Style           =   2  'Dropdown List
            TabIndex        =   21
            Top             =   180
            Width           =   2265
         End
         Begin VB.CheckBox cbGDIPlus 
            BackColor       =   &H00FFFFFF&
            Caption         =   "GDI+"
            BeginProperty Font 
               Name            =   "Century Gothic"
               Size            =   14.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H8000000D&
            Height          =   240
            Left            =   1410
            MaskColor       =   &H00FFFFFF&
            TabIndex        =   20
            Top             =   240
            Value           =   1  'Checked
            Width           =   1200
         End
         Begin VB.Image CmdPrev 
            Height          =   360
            Left            =   180
            Picture         =   "TeeChartDemo.frx":1AF4
            Top             =   180
            Width           =   360
         End
         Begin VB.Image CmdNext 
            Height          =   360
            Left            =   720
            Picture         =   "TeeChartDemo.frx":1EF4
            Top             =   180
            Width           =   360
         End
         Begin VB.Label LabelClose 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Close"
            BeginProperty Font 
               Name            =   "Century Gothic"
               Size            =   18
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H8000000D&
            Height          =   495
            Index           =   1
            Left            =   13560
            TabIndex        =   25
            Top             =   150
            Width           =   1215
         End
         Begin VB.Label LabelAbout 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "About"
            BeginProperty Font 
               Name            =   "Century Gothic"
               Size            =   18
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H8000000D&
            Height          =   495
            Index           =   0
            Left            =   12240
            TabIndex        =   23
            Top             =   150
            Width           =   1215
         End
         Begin VB.Label Label4 
            BackStyle       =   0  'Transparent
            Caption         =   "Select Theme"
            BeginProperty Font 
               Name            =   "Century Gothic"
               Size            =   12
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H8000000D&
            Height          =   285
            Left            =   7410
            TabIndex        =   22
            Top             =   180
            Width           =   1635
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "ActiveX Pro Version"
            BeginProperty Font 
               Name            =   "Century Gothic"
               Size            =   15.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H8000000D&
            Height          =   435
            Left            =   3450
            TabIndex        =   19
            Top             =   165
            Width           =   3825
         End
      End
      Begin TeeChart.TChart TChart1 
         Height          =   195
         Left            =   12510
         TabIndex        =   17
         Top             =   450
         Width           =   435
         Base64          =   $"TeeChartDemo.frx":22F0
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Check tree"
         Height          =   495
         Left            =   7680
         TabIndex        =   16
         Top             =   240
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.Timer Timer1 
         Left            =   8520
         Top             =   240
      End
   End
   Begin VB.Image Image6 
      Height          =   1260
      Left            =   3330
      Picture         =   "TeeChartDemo.frx":3698
      Top             =   8040
      Width           =   2250
   End
   Begin VB.Image Image5 
      Height          =   1080
      Left            =   13710
      Picture         =   "TeeChartDemo.frx":5C03
      Top             =   8160
      Width           =   1080
   End
   Begin VB.Image Image4 
      Height          =   1080
      Left            =   12570
      Picture         =   "TeeChartDemo.frx":6337
      Top             =   8160
      Width           =   1080
   End
   Begin VB.Image Image3 
      Height          =   1080
      Left            =   11460
      Picture         =   "TeeChartDemo.frx":6974
      Top             =   8160
      Width           =   1080
   End
   Begin VB.Image Image2 
      Height          =   1080
      Left            =   10320
      Picture         =   "TeeChartDemo.frx":6FE2
      Top             =   8160
      Width           =   1080
   End
   Begin VB.Image Image1 
      Height          =   1080
      Index           =   0
      Left            =   9210
      Picture         =   "TeeChartDemo.frx":7502
      Top             =   8160
      Width           =   1080
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "About"
      BeginProperty Font 
         Name            =   "Century Gothic"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   0
      TabIndex        =   24
      Top             =   0
      Width           =   1215
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   45
      Top             =   6885
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   2
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "TeeChartDemo.frx":7A04
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "TeeChartDemo.frx":7D56
            Key             =   "picLeaf"
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib _
    "shell32.dll" Alias "ShellExecuteA" ( _
    ByVal hwnd As Long, _
    ByVal lpOperation As String, _
    ByVal lpFile As String, _
    ByVal lpParameters As String, _
    ByVal lpDirectory As String, _
    ByVal nShowCmd As Long) As Long


Dim FormsName() As String
Dim FindAllWords As Boolean
Dim SearchText() As String
Dim NumWords, Count_Files As Integer
Dim tmpMemo As ListView
Dim activeForm As Form

'*****************************************************************
' Copyright 2001-2015 Steema Software SL
' Code contributions from Freddy Fischer, FFischer@rheinsoft.com
' Please feel free to use any code in this VB project.
'*****************************************************************
Dim SelectedIndex
Dim FormArray(350)
Dim OpenFile
Dim oldLeft, oldTop As Double


Private Sub cbGDIPlus_Click()
   Dim ctl As Control
   If activeForm.Name <> "LogoForm" Then
     For Each ctl In activeForm.Controls
        If TypeOf ctl Is TeeChart.TChart Then
            ctl.Aspect.GDIPlus.Active = cbGDIPlus.Value
        End If
     Next ctl
   End If
   activeForm.Show vbModeless, Me
End Sub


Private Sub Command1_Click()
Dim codestring
    On Error GoTo ErrorHandler
    
    If OpenFile <> "" Then
        Close #1
        Open App.Path & "\" & OpenFile & ".frm" For Input As #1
        Do While Not EOF(1)
            Line Input #1, codestring
            CodeForm.Text1.Text = CodeForm.Text1.Text + codestring + Chr$(13) + Chr$(10)
        Loop
        Close #1
        CodeForm.Caption = OpenFile & ".frm"
        CodeForm.Show vbModal
    End If

ExitPoint:
    Exit Sub

ErrorHandler:
    MsgBox Err.Description, vbExclamation, "Error"
    Resume ExitPoint
End Sub

Private Sub CmdPrev_Click()
 If SSTab1.Tab = 0 Then
 With Outline1
    If .SelectedItem.Index > 0 Then
        .Nodes(.SelectedItem.Index - 1).Selected = True
        If .SelectedItem.Index > 1 Then
            If (.Nodes(.SelectedItem.Index - 1).Expanded = False) Then
                For i = 1 To .SelectedItem.Index - 1
                    .Nodes(i).Expanded = True
                Next i
            End If
        End If
        .Nodes(.SelectedItem.Index).Expanded = True
        LoadForm (.SelectedItem.Index)
        CheckButtons
    End If
 End With
 ElseIf SSTab1.Tab = 1 Then
    With Outline3
       If .SelectedItem.Index > 0 Then
           .Nodes(.SelectedItem.Index - 1).Selected = True
           If .SelectedItem.Index > 1 Then
               If (.Nodes(.SelectedItem.Index - 1).Expanded = False) Then
                   For i = 1 To .SelectedItem.Index - 1
                       .Nodes(i).Expanded = True
                   Next i
               End If
           End If
           .Nodes(.SelectedItem.Index).Expanded = True
           LoadForm (.SelectedItem.Index)
           CheckButtons
       End If
    End With
 End If
End Sub

Private Sub CmdNext_Click()
If SSTab1.Tab = 0 Then
 With Outline1
    If .SelectedItem.Index < .Nodes.Count Then
        .Nodes(.SelectedItem.Index + 1).Selected = True
        If .SelectedItem.Expanded = False Then
            .SelectedItem.Expanded = True
        End If
        .Nodes(.SelectedItem.Index - 1).Expanded = True
        LoadForm (.SelectedItem.Index)
        CheckButtons
    End If
 End With
End If
If SSTab1.Tab = 1 Then
 With Outline3
    If .SelectedItem.Index < .Nodes.Count Then
        .Nodes(.SelectedItem.Index + 1).Selected = True
        If .SelectedItem.Expanded = False Then
            .SelectedItem.Expanded = True
        End If
        .Nodes(.SelectedItem.Index - 1).Expanded = True
        LoadForm (.SelectedItem.Index)
        CheckButtons
    End If
 End With
End If
End Sub

Private Sub Combo2_Change()
   Dim ctl As Control
    
   For Each ctl In activeForm.Controls
        If TypeOf ctl Is TeeChart.TChart Then
            If Combo2.ListIndex <> 0 Then
               Select Case Combo2.ListIndex
                    Case 1: ctl.SetTheme ctOpera, cpOpera
                    Case 2: ctl.SetTheme ctBlackIsBack, cpBlackIsBack
                    Case 3: ctl.SetTheme ctBusiness, cpBusiness
                    Case 4: ctl.SetTheme ctClassic, cpClassic
                    Case 5: ctl.SetTheme ctFlat, cpMetro
                End Select
            End If
        End If
    Next ctl
End Sub

Private Sub Combo2_Click()
  Combo2_Change
End Sub

Private Sub Command2_Click()
 ' Enables test routine to step through and check tree
 Timer1.Interval = 600
 Timer1.Enabled = Not Timer1.Enabled
End Sub

Private Sub Command3_Click()
    List1.Clear
    Command3.Enabled = False
    DoSearch
    Command3.Enabled = True
End Sub


Private Sub Form_Load()
 'cbGDIPlus.BackColor = RGB(21, 26, 81)
 FirstTime = True
' Picture1.Picture = LoadPicture(App.Path & "\TeeChart2013.gif")
 Frame1.BackColor = RGB(148, 178, 206)
 oldLeft = Me.Left = (Screen.Width / 2) - (Me.Width / 2)
 oldTop = Me.Top = (Screen.Height / 2) - (Me.Height / 2)
 'TChart2.Panel.Gradient.StartColor = RGB(0, 0, 100)
 'TChart2.Panel.Gradient.EndColor = RGB(9, 87, 149)
 'TChart3.Panel.Gradient.StartColor = RGB(0, 0, 100)
 'TChart3.Panel.Gradient.EndColor = RGB(9, 87, 149)
 
 'TChart2.Panel.Gradient.UseMiddleColor = False
 'tChart3.Panel.Gradient.UseMiddleColor = False
 'TChart2.Panel.Gradient.Visible = False
' TChart3.Panel.Gradient.Visible = False
 'TChart2.Panel.Color = RGB(21, 26, 81)
 'TChart3.Panel.Color = RGB(21, 26, 81)
 

 Timer1.Enabled = False
 CheckActiveTab
 CheckButtons
 Show_Form LogoForm
 Forms(1).Tag = "L"
 Combo2.ListIndex = 0
 TChart2.Panel.Gradient.Visible = False
End Sub

Private Sub CheckActiveTab()
  LoadTree
 ' Check which Outline is active
 If SSTab1.Tab = 0 Then
   Outline1.Nodes(1).Expanded = True
   Outline1.Nodes(1).Selected = True
   CheckButtons
 Else
 If SSTab1.Tab = 1 Then
   Outline3.Nodes(1).Expanded = True
   Outline3.Nodes(1).Selected = True
   CheckButtons
 Else
   Combo1.SetFocus
 End If
 End If
End Sub

Private Sub Image1_Click(Index As Integer)
   ShellExecute 0, "open", "http://twitter.com/SteemaSoftware", "", "", 2
End Sub

Private Sub Image2_Click()
   ShellExecute 0, "open", "http://www.facebook.com/SteemaSoftware", "", "", 2
End Sub

Private Sub Image3_Click()
    ShellExecute 0, "open", "https://plus.google.com/117745002307285183020", "", "", 2
End Sub

Private Sub Image4_Click()
   ShellExecute 0, "open", "http://www.steema.com/rss", "", "", 2
End Sub

Private Sub Image5_Click()
   ShellExecute 0, "open", "http://www.youtube.com/user/SteemaSoftware", "", "", 2
End Sub

'Private Sub Form_Paint()
' If Forms(1).Tag = "L" Then
'   PositionForm
' End If
'End Sub

Private Sub Label1_Click()
  TChart1.AboutBox
End Sub


Private Sub LabelAbout_Click(Index As Integer)
  TChart1.AboutBox
End Sub

Private Sub LabelClose_Click(Index As Integer)
    Unload Me
End Sub

Private Sub List1_Click()
  
  t = "T" & FormsName(List1.ListIndex + 1)
  
  Do While Forms.Count > 1
    Unload Forms(1)
  Loop

  If LaunchFormNew(t) = False Then
     LaunchFormAll (t)
  End If
  
  If Forms.Count > 1 Then
    OpenFile = Forms(1).Name
    Forms(1).Tag = "L"
  End If
  SSTab2.Tab = 0
End Sub

Private Sub Outline1_Click()
    CheckButtons
    SSTab2.Tab = 0
    LoadForm (Outline1.SelectedItem.Index)
End Sub

Private Sub CheckButtons()
If SSTab1.Tab = 0 Then
 With Outline1
    Select Case .SelectedItem.Index
        Case 1:
            CmdPrev.Enabled = False
            CmdNext.Enabled = True
        Case .Nodes.Count
            CmdPrev.Enabled = True
            CmdNext.Enabled = False
        Case Else
            CmdPrev.Enabled = True
            CmdNext.Enabled = True
    End Select
 End With
Else
 With Outline3
    Select Case .SelectedItem.Index
        Case 1:
            CmdPrev.Enabled = False
            CmdNext.Enabled = True
        Case .Nodes.Count
            CmdPrev.Enabled = True
            CmdNext.Enabled = False
        Case Else
            CmdPrev.Enabled = True
            CmdNext.Enabled = True
    End Select
 End With
End If
End Sub

Private Sub PositionForm()
  Forms(1).Move Form1.Left + (Form1.Width / 4) - 400, Form1.Top + (Form1.Height / 9) + 0 '350
'  Forms(1).Move Form1.Left + (Form1.Width / 4) - 200, Form1.Top + (Form1.Height / 5) - 85

' If Forms(1).Tag = "L" Then
'  Forms(1).Top = Form1.Top + (Form1.Height / 5) - 125
'  Forms(1).Left = Form1.Left + (Form1.Width / 3)
' End If
End Sub

Private Sub LoadTree()
Const picFolder = 1
Const picLeaf = 2

Dim Indent, LastIndent, retstring, CommaLoc
Dim HasForm As Boolean
Dim FormArrayString
Dim tmpFormArrayString

Dim PIndex(6) As ComctlLib.Node
Dim objTree As ComctlLib.TreeView
Dim objParentNode As ComctlLib.Node
Dim objNode As ComctlLib.Node
Dim LabelString As String
Dim nTokenCount As Long

  If SSTab1.Tab = 0 Then
    Set objTree = Me.Outline1
  Else
    Set objTree = Me.Outline3
  End If
  
  With objTree
      .Nodes.Clear
      Set .ImageList = Me.ImageList1
      .Indentation = 1
  End With

  If SSTab1.Tab = 0 Then
    Close #1
    Open App.Path & "\tree.txt" For Input As #1
  Else
    Close #1
    Open App.Path & "\tree_all.txt" For Input As #1
  End If

  LastIndent = 0
  Do While Not EOF(1)
    HasForm = False
    FormArrayString = ""
    Indent = 0
    Line Input #1, retstring
    Do While InStr(1, retstring, " ") = 1
      retstring = Right(retstring, Len(retstring) - 1)
      Indent = Indent + 1
    Loop
    nTokenCount = GetTokenCount(retstring, ",")
        If nTokenCount > 1 Then
            LabelString = GetToken(retstring, 1, ",")
            FormArrayString = GetToken(retstring, 2, ",")
            HasForm = True
        Else
            LabelString = retstring
            FormArrayString = "LogoForm"
        End If
        
        If Indent > LastIndent Then
            Set objParentNode = PIndex(LastIndent)
            Set objNode = objTree.Nodes.Add(objParentNode.Index, tvwChild, "_" & CStr(objTree.Nodes.Count), LabelString)
        ElseIf Indent = LastIndent Then
            If objTree.Nodes.Count = 0 Then
                Set objNode = objTree.Nodes.Add(, , "_" & CStr(objTree.Nodes.Count), LabelString)
                Set PIndex(Indent) = objNode
            Else
                Set objParentNode = PIndex(Indent - 1)
                Set objNode = objTree.Nodes.Add(objParentNode.Index, tvwChild, "_" & CStr(objTree.Nodes.Count), LabelString)
            End If
        ElseIf Indent < LastIndent Then
            Set objParentNode = PIndex(Indent - 1)
            Set objNode = objTree.Nodes.Add(objParentNode.Index, tvwChild, "_" & CStr(objTree.Nodes.Count), LabelString)
        End If
        objNode.Image = IIf(HasForm, picLeaf, picFolder)
        Set PIndex(Indent) = objNode
        LastIndent = Indent
        If HasForm = True Then
            objNode.Tag = FormArrayString
        End If
  Loop
End Sub
Private Sub Show_Form(vform As Form)
   Set activeForm = vform
   vform.Visible = False
   PositionForm
   Dim ctl As Control
   For Each ctl In vform.Controls
        If TypeOf ctl Is TeeChart.TChart Then
            ctl.Aspect.GDIPlus.Active = cbGDIPlus.Value
        End If
    Next ctl
    vform.Show vbModeless, Me
    Combo2_Change
End Sub

Private Function LaunchFormAll(ByVal searchStr As String) As Boolean
LaunchFormAll = True
  Select Case searchStr
    ' testing demos
    Case "TEditor_Strings": Show_Form Editor_Strings
    ' add v8 demos
    Case "TSeriesType_IsoSurface": Show_Form SeriesType_IsoSurface
    Case "TSeriesType_VolumePipe": Show_Form SeriesType_VolumePipe
    Case "TSeriesType_Darvas": Show_Form SeriesType_Darvas
    Case "TSeriesType_HighLowLine": Show_Form SeriesType_HighLowLine
    Case "TSeriesType_PolarGrid": Show_Form SeriesType_PolarGrid
    Case "TSeriesType_OrgChart": Show_Form SeriesType_OrgChart
    Case "TSeriesType_GISMaps": Show_Form SeriesType_GISMaps
    Case "TSeriesType_TagCloud": Show_Form SeriesType_TagCloud
    Case "TSeries_LCDGauges": Show_Form Series_LCDGauges
    Case "TSeriesType_CircularGauge": Show_Form SeriesType_CircularGauge
    Case "TTool_Antialias": Show_Form Tool_Antialias
    Case "TTool_Fader": Show_Form Tool_Fader
    Case "TTool_Frame": Show_Form Tool_Frame
    Case "TTool_DataTable": Show_Form Tool_DataTable
    Case "TTool_LegendPalette": Show_Form Tool_LegendPalette
    Case "TTool_Magnify": Show_Form Tool_Magnify
    Case "TTool_Banner": Show_Form Tool_Banner
    Case "TTool_SeriesRegion": Show_Form Tool_SeriesRegion
    Case "TTool_SeriesStats": Show_Form Tool_SeriesStats
    Case "TTool_SubChart": Show_Form Tool_SubChart
    Case "TTool_Text3D": Show_Form Tool_Text3D
    Case "TTool_TransposeSeries": Show_Form Tool_TransposeSeries
    Case "TTool_Video": Show_Form Tool_Video
    Case "TTool_VideoPlayer": Show_Form Tool_VideoPlayer
    Case "TFunction_SAR": Show_Form Function_SAR
    Case "TFunction_SubSet": Show_Form Function_SubSet
    Case "TFunction_Histogram": Show_Form Function_Histogram
    Case "TAxis_LineMode": Show_Form Axis_LineMode
    Case "TAxis_GridDrawEvery": Show_Form Axis_GridDrawEvery
    Case "TAxis_MaxMinRounded": Show_Form Axis_MaxMinRounded
    Case "TLegend_Items": Show_Form Legend_Items
    Case "TLegend_SeriesGroups": Show_Form Legend_SeriesGroups
    Case "TLegend_PositionPercent": Show_Form Legend_PositionPercent
    Case "TLegend_SymbolsGradient": Show_Form Legend_SymbolsGradient
    Case "TLegend_SymbolsShadow": Show_Form Legend_SymbolsShadow
    Case "TArea_TreatNulls": Show_Form Area_TreatNulls
    Case "TSeries_AreaStackGroups": Show_Form Series_AreaStackGroups
    Case "TSeries_ArrowPercent": Show_Form Series_ArrowPercent
    Case "TSeries_BarShadow": Show_Form Series_BarShadow
    Case "TSeries_CalendarClicked": Show_Form Series_CalendarClicked
    Case "TSeries_ContourFilled": Show_Form Series_ContourFilled
    Case "TSeries_ContourLevelMarks": Show_Form Series_ContourLevelMarks
    Case "TSeries_ContourLevelMarksOverlap": Show_Form Series_ContourLevelMarksOverlap
    Case "TSeries_ContourPointer": Show_Form Series_ContourPointer
    Case "TSeries_ColorGridPlane3D": Show_Form Series_ColorGridPlane3D
    Case "TSeries_ColorGridTransparency": Show_Form Series_ColorGridTransparency
    Case "TSeries_PointsHexagon": Show_Form Series_PointsHexagon
    Case "TSeries_ClickPointer": Show_Form Series_ClickPointer
    Case "TCustomSeries_TreatNulls": Show_Form CustomSeries_TreatNulls
    Case "TSeries_InvertPalette": Show_Form Series_InvertPalette
    Case "TFastLine_TreatNulls": Show_Form FastLine_TreatNulls
    Case "TSeries_LineGradient": Show_Form Series_LineGradient
    Case "TPie_MarksVertCenter": Show_Form Pie_MarksVertCenter
    Case "TPie_MarksLegSize": Show_Form Pie_MarksLegSize
    Case "TPoint_TreatNulls": Show_Form Point_TreatNulls
    Case "TSeries_GetCircleLabelEvent": Show_Form Series_GetCircleLabelEvent
    Case "TSeries_ShapeTransparency": Show_Form Series_ShapeTransparency
    Case "TSurface_HideCells": Show_Form Surface_HideCells
    Case "TSeries_TowerClick": Show_Form Series_TowerClick
    Case "TSeries_WindRoseMirrorAngles": Show_Form Series_WindRoseMirrorAngles
    Case "TSeries_WindRosePointerStyle": Show_Form Series_WindRosePointerStyle
    Case "TMarks_Styles": Show_Form Marks_Styles
    Case "TMarks_TextAlign": Show_Form Marks_TextAlign
    Case "TWalls_Picture": Show_Form Walls_Picture
    Case "TChartGrid_AllowAppend": Show_Form ChartGrid_AllowAppend
    Case "TChartGrid_ReadOnly": Show_Form ChartGrid_ReadOnly
    Case "TChartGrid_AllowInsertSeries": Show_Form ChartGrid_AllowInsertSeries
    Case "TChartGrid_VisibleColumns": Show_Form ChartGrid_VisibleColumns
    Case "TChartGrid_FirstRowNum": Show_Form ChartGrid_FirstRowNum
    Case "TChartGrid_SeriesSymbolClickable": Show_Form ChartGrid_SeriesSymbolClickable
'    Case "TArea_TreatNulls": Show_Form Area_TreatNulls 'already called above
    Case "TChartListBox_FontSeriesColor": Show_Form ChartListBox_FontSeriesColor
    Case "TCommander_Gradient": Show_Form Commander_Gradient
    Case "TCommander_FullRotation": Show_Form Commander_FullRotation
    Case "TEditor_PixelsPerInch": Show_Form Editor_PixelsPerInch
    Case "TExport_XAML": Show_Form Export_XAML
    Case "TTool_AxisArrowSize": Show_Form Tool_AxisArrowSize
    Case "TTool_ColorBandPicture": Show_Form Tool_ColorBandPicture
    Case "TTool_ColorBandResize": Show_Form Tool_ColorBandResize
    Case "TTool_CursorTolerance": Show_Form Tool_CursorTolerance
    Case "TTool_CursorSnapStyle": Show_Form Tool_CursorSnapStyle
    Case "TTool_CursorSize": Show_Form Tool_CursorSize
    Case "TTool_CursorScope": Show_Form Tool_CursorScope
    Case "TTool_DragMarksDragged": Show_Form Tool_DragMarksDragged
    Case "TTool_DrawLineTolerance": Show_Form Tool_DrawLineTolerance
    Case "TTool_DrawLineStyle": Show_Form Tool_DrawLineStyle
    Case "TTool_DrawLineAddLine": Show_Form Tool_DrawLineAddLine
    Case "TTool_DrawLineClickedTolerance": Show_Form Tool_DrawLineClickedTolerance
    Case "TTool_MarksTipHide": Show_Form Tool_MarksTipHide
    Case "TTool_MarksTipCancelHint": Show_Form Tool_MarksTipCancelHint
    Case "TTool_ImagePen": Show_Form Tool_ImagePen
    Case "TTool_PageNumShowButtons": Show_Form Tool_PageNumShowButtons
    Case "TTool_RectangleAllowDragResize": Show_Form Tool_RectangleAllowDragResize
    Case "TTool_RectangleDraggingResizing": Show_Form Tool_RectangleDraggingResizing
    Case "TTool_RotateInertia_Cursor": Show_Form Tool_RotateInertia_Cursor
    Case "TSeries_AnimationDelay": Show_Form Series_AnimationDelay
    Case "TTool_SeriesBandPen": Show_Form Tool_SeriesBandPen
    Case "TTool_LegendScrollBarThumb": Show_Form Tool_LegendScrollBarThumb
    Case "TCanvas_FontPicture": Show_Form Canvas_FontPicture
    Case "TCanvas_CustomShapePicture": Show_Form Canvas_CustomShapePicture
    Case "TCanvas_CustomShapeRoundSize": Show_Form Canvas_CustomShapeRoundSize
    Case "TGradient_RotationAngle": Show_Form Gradient_RotationAngle
    Case "TGradient_SubGradient": Show_Form Gradient_SubGradient
    Case "TEditor_FontsTab": Show_Form Editor_FontsTab
    Case "TFunctions_PeriodAlign": Show_Form Functions_PeriodAlign
    Case "TFunction_ExpMovAveNulls": Show_Form Function_ExpMovAveNulls
    Case "TSeries_AddRemoveEvents": Show_Form Series_AddRemoveEvents
    'Case "TTool_Antialias": Show_Form Tool_Antialias 'already called above
    Case "TFilter_Bevel": Show_Form Filter_Bevel
    Case "TFilter_Blur": Show_Form Filter_Blur
    Case "TFilter_Brightness": Show_Form Filter_Brightness
    Case "TFilter_ColorRGB": Show_Form Filter_ColorRGB
    Case "TFilter_Contrast": Show_Form Filter_Contrast
    Case "TFilter_Crop": Show_Form Filter_Crop
    Case "TFilter_Emboss": Show_Form Filter_Emboss
    Case "TFilter_Flip": Show_Form Filter_Flip
    Case "TFilter_GammaCorrection": Show_Form Filter_GammaCorrection
    Case "TFilter_GrayScale": Show_Form Filter_GrayScale
    Case "TFilter_HueLumSat": Show_Form Filter_HueLumSat
    Case "TFilter_Invert": Show_Form Filter_Invert
    Case "TFilter_Light": Show_Form Filter_Light
    Case "TFilter_Mirror": Show_Form Filter_Mirror
    Case "TFilter_Mosaic": Show_Form Filter_Mosaic
    Case "TFilter_Resize": Show_Form Filter_Resize
    Case "TFilter_Reverse": Show_Form Filter_Reverse
    Case "TFilter_Rotate": Show_Form Filter_Rotate
    Case "TFilter_Sharpen": Show_Form Filter_Sharpen
    Case "TFilter_Tile": Show_Form Filter_Tile
    Case "TFilter_Zoom": Show_Form Filter_Zoom
    Case "TChart_CustomChartRect": Show_Form Chart_CustomChartRect
    Case "TTitle_VertMargin": Show_Form Title_VertMargin
    Case "TTitle_Clear": Show_Form Title_Clear
    Case "TAxes_Hide": Show_Form Axes_Hide
    Case "TChartPages_AutoScale": Show_Form ChartPages_AutoScale
    Case "TPages_NextPreviousMethods": Show_Form Pages_NextPreviousMethods
    Case "TChart_RotationFloat": Show_Form Chart_RotationFloat
    Case "TTools_CloneChartTool": Show_Form Tools_CloneChartTool
    Case "TTools_Gallery": Show_Form Tools_Gallery
    Case "TDBChart_CrossTabSource_HideSeries": Show_Form DBChart_CrossTabSource_HideSeries
    Case "TSeriesSource_LoadMode": Show_Form SeriesSource_LoadMode
    Case "TSeries_ShowInEditor": Show_Form Series_ShowInEditor
    Case "TChart_SeriesGroups": Show_Form Chart_SeriesGroups
    Case "TChart_SeriesGroupsFindByName": Show_Form Chart_SeriesGroupsFindByName
    'Case "TTools_Assign": Show_Form Tools_Assign
    Case "TMarks_ItemText": Show_Form Marks_ItemText
    Case "TOpenGL_LightDirection": Show_Form OpenGL_LightDirection
    Case "TOpenGL_AntiAlias": Show_Form OpenGL_AntiAlias
    Case "TColorPalettes_MacOS": Show_Form ColorPalettes_MacOS
    Case "TOther_ChangesV8Form": Show_Form Other_ChangesV8Form
    Case "TUpgrading_and_OrderingForm": Show_Form Upgrading_and_OrderingForm
  
    'TeeChart Pro v7
    Case "TAxis_DepthDateTimeForm": Show_Form Axis_DepthDateTimeForm
    Case "TToolSeriesBandForm": Show_Form ToolSeriesBandForm
    Case "TToolSelectorForm": Show_Form ToolSelectorForm
    Case "TToolAnnotationClickForm": Show_Form ToolAnnotationClickForm
    Case "TFastLine_RealtimeForm": Show_Form FastLine_RealtimeForm
    Case "TChart_ThemesForm": Show_Form Chart_ThemesForm
    Case "TChart_PalettesForm": Show_Form Chart_PalettesForm
    Case "TAxis_LabelsAlternateForm": Show_Form Axis_LabelsAlternateForm
    Case "TAxis_DepthTopForm": Show_Form Axis_DepthTopForm
    Case "TAxis_IsometricForm": Show_Form Axis_IsometricForm
    Case "TAxes_DrawBevelsForm": Show_Form Axes_DrawBevelsForm
    Case "TAxis_DepthDateTimeForm": Show_Form Axis_DepthDateTimeForm
    Case "TLegend_TitleForm": Show_Form Legend_TitleForm
    Case "TLegend_ScrollbarForm": Show_Form Legend_ScrollbarForm
    Case "TLegend_SymbolFlagsForm": Show_Form Legend_SymbolFlagsForm
    Case "TBar_TickLinesForm": Show_Form Bar_TickLinesForm
    Case "TMarks_SymbolsForm": Show_Form Marks_SymbolsForm
    Case "TPie_ShadowEllipseForm": Show_Form Pie_ShadowEllipseForm
    Case "TCandle_HighLowPenForm": Show_Form Candle_HighLowPenForm
    Case "TSurface_FastBrushForm": Show_Form Surface_FastBrushForm
    Case "TWall_AutoHideForm": Show_Form Wall_AutoHideForm
    Case "TTool_LightingForm": Show_Form Tool_LightingForm
    Case "TTool_SurfaceNearestForm": Show_Form Tool_SurfaceNearestForm
    Case "TTool_AxisScrollForm": Show_Form Tool_AxisScrollForm
    Case "TChartListBox_RadioForm": Show_Form ChartListBox_RadioForm
    Case "TChartListBox_EditorForm": Show_Form ChartListBox_EditorForm
    Case "TCommander_CustomEditorForm": Show_Form Commander_CustomEditorForm
    Case "TFunction_ModeForm": Show_Form Function_ModeForm
    Case "TFunction_MedianForm": Show_Form Function_MedianForm
    Case "TFunction_CorrelationForm": Show_Form Function_CorrelationForm
    Case "TFunction_VarianceForm": Show_Form Function_VarianceForm
    Case "TFunction_PerimeterForm": Show_Form Function_PerimeterForm
    Case "TSeries_Bubble3DForm": Show_Form Series_Bubble3DForm
    Case "TSeries_HorizHistoForm": Show_Form Series_HorizHistoForm
    Case "TSeries_PolarBarForm": Show_Form Series_PolarBarForm
    Case "TExport_SVGForm": Show_Form Export_SVGForm
    Case "TPie_GradientForm": Show_Form Pie_GradientForm
    Case "TPoint3D_BaseLineForm": Show_Form Point3D_BaseLineForm
    Case "TColorBand_ClickedForm": Show_Form ColorBand_ClickedForm
    Case "TColorBand_DragForm": Show_Form ColorBand_DragForm
    Case "TChartEditor_3DGalleryForm": Show_Form ChartEditor_3DGalleryForm
    Case "TDesignTime_OptionsForm": Show_Form DesignTime_OptionsForm
    Case "TProperty_AliasesForm": Show_Form Property_AliasesForm
    Case "TOther_changesForm": Show_Form Other_ChangesForm
    Case "TNewIn703Form": Show_Form NewIn703Form
    Case "TNewIn704Form": Show_Form NewIn704Form
    Case "TNewIn705Form": Show_Form NewIn705Form
    Case "TNewIn706Form": Show_Form NewIn706Form
    Case "TFixed_DefectsForm": Show_Form Fixed_DefectsForm
    Case "TUpgrading_and_OrderingForm": Show_Form Upgrading_and_OrderingForm
    Case "TAxis_FirstLastLabelsForm": Show_Form Axis_FirstLastLabelsForm
    Case "TBar_3DDepthForm": Show_Form Bar_3DDepthForm
    Case "TPie_SliceHeightsForm": Show_Form Pie_SliceHeightsForm
    Case "TSurface_PaletteForm": Show_Form Surface_PaletteForm
    Case "TSurface_SmoothingForm": Show_Form Surface_SmoothingForm
    Case "TContour_FootForm": Show_Form Contour_FootForm
    Case "TColorGrid_RealtimeForm": Show_Form ColorGrid_RealtimeForm
    Case "TPolar_SmoothForm": Show_Form Polar_SmoothForm
    Case "TSeries_GroupsForm": Show_Form Series_GroupsForm
    Case "TEditor_FormattingForm": Show_Form Editor_FormattingForm
    Case "TFunction_DownSamplingForm": Show_Form Function_DownSamplingForm
    Case "TSeries_GroupsForm": Show_Form Series_GroupsForm
    Case "TColorBand_ClickedForm": Show_Form ColorBand_ClickedForm
    Case "TColorBand_DragForm": Show_Form ColorBand_DragForm
    Case "TMouseOverHints": Show_Form MouseOverHints
    'TeeChart Pro v6
    Case "TDBChartCrossTabSourceForm": Show_Form DBChartCrossTabSourceForm
    Case "TExportEPSForm": Show_Form ExportEPSForm
    Case "TExportPDFForm": Show_Form ExportPDFForm
    Case "TSeriesXMLSourceWebForm": Show_Form SeriesXMLSourceWebForm
    Case "TSeriesXMLSourceForm": Show_Form SeriesXMLSourceForm
    Case "TSeriesTowerForm": Show_Form SeriesTowerForm
    Case "TSeriesVector3DForm": Show_Form SeriesVector3DForm
    Case "TSeriesGaugeForm": Show_Form SeriesGaugeForm
    Case "TSeriesPointFigureForm": Show_Form SeriesPointFigureForm
    Case "TSeriesTypeHorizAreaForm": Show_Form SeriesTypeHorizAreaForm
    Case "TFunctionPerformanceForm": Show_Form FunctionPerformanceForm
    Case "TFunctionPVOForm": Show_Form FunctionPVOForm
    Case "TFunctionCCIForm": Show_Form FunctionCCIForm
    Case "TFunctionOBVForm": Show_Form FunctionOBVForm
    Case "TFunctionCLVForm": Show_Form FunctionCLVForm
    Case "TFunctionCrossPointsForm": Show_Form FunctionCrossPointsForm
    Case "TFunctionCompressForm": Show_Form FunctionCompressForm
    Case "TFunctionCustomForm": Show_Form FunctionCustomForm
    Case "TFunctionSmoothingForm": Show_Form FunctionSmoothingForm
    Case "TToolPieForm": Show_Form ToolPieForm
    Case "TAxesGridBandsForm": Show_Form AxesGridBandsForm
    Case "TGanttMouseDragForm": Show_Form GanttMouseDragForm
    Case "TToolSeriesAnimationForm": Show_Form ToolSeriesAnimationForm
    Case "TToolExtraLegendForm": Show_Form ToolExtraLegendForm
    Case "TTool3DTransposeForm": Show_Form Tool3DTransposeForm
    Case "TChartPrintMarginsForm": Show_Form ChartPrintMarginsForm
    Case "TPreviewCustomDrawForm": Show_Form PreviewCustomDrawForm
    Case "TChartGrid3DForm": Show_Form ChartGrid3DForm
    Case "TXYZGriddingForm": Show_Form XYZGriddingForm
    Case "TSeries3DAddArrayForm": Show_Form Series3DAddArrayForm
    Case "TSurfaceTransparencyForm": Show_Form SurfaceTransparencyForm
    Case "TPolarZonesForm": Show_Form PolarZonesForm
    Case "TCircledGradientForm": Show_Form CircledGradientForm
    Case "TPieOtherLegendForm": Show_Form PieOtherLegendForm
    Case "TPieAutoMarkPositionForm": Show_Form PieAutoMarkPositionForm
    Case "TContourOnBeforeDrawForm": Show_Form ContourOnBeforeDrawForm
    Case "TContourSmoothSegmentsForm": Show_Form ContourSmoothSegmentsForm
    Case "TColorGridBitmapForm": Show_Form ColorGridBitmapForm
    Case "TColorGridMarksForm": Show_Form ColorGridMarksForm
    Case "TBubbleTransparencyForm": Show_Form BubbleTranparencyForm
    Case "TBubbleGradientForm": Show_Form BubbleGradientForm
    Case "TBoxCustomValuesForm": Show_Form BoxCustomValuesForm
    Case "TBarSelfStackForm": Show_Form BarSelfStackForm
    Case "TMarksPerPointForm": Show_Form MarksPerPointForm
    Case "TMarksCalloutForm": Show_Form MarksCalloutForm
    Case "TSeriesSortByLabelsForm": Show_Form SeriesSortByLabelsForm
    Case "TSeriesMouseEnterForm": Show_Form SeriesMouseEnterForm
    Case "TToolRotateOutlineForm": Show_Form ToolRotateOutlineForm
    Case "TToolAnnotationCalloutForm": Show_Form ToolAnnotationCalloutForm
    Case "TColorLineDraw3DForm": Show_Form ColorLineDraw3DForm
    Case "TChartRoundPanelForm": Show_Form ChartRoundPanelForm
    Case "TChartShadowForm": Show_Form ChartShadowForm
    Case "TMarginUnitsForm": Show_Form MarginUnitsForm
    Case "TWallTransparencyForm": Show_Form WallTransparencyForm
    Case "TLSymbolBorderForm": Show_Form LSymbolBorderForm
    Case "TRotatedEllipseForm": Show_Form RotatedEllipseForm
    Case "TGradientRadialForm": Show_Form GradientRadialForm
    Case "TAxisItemsForm": Show_Form AxisItemsForm
    Case "TAxisLabelsFormatForm": Show_Form AxisLabelsFormatForm
    Case "TAxisZPositionForm": Show_Form AxisZPositionForm
    Case "TAxisOffsetsForm": Show_Form AxisOffsetsForm
    Case "TADXFunctionForm": Show_Form ADXFunctionFormForm
    Case "TAnnotationToolForm": Show_Form Tool_AnnotationForm
    Case "TAreaOriginForm": Show_Form AreaOriginFormForm
    Case "TAreaSeriesForm": Show_Form AreaSeriesFormForm
    Case "TAverageFunctionNulls": Show_Form AverageFunctionNullsForm
    Case "TAxisArrowToolDemo": Show_Form AxisArrowToolDemoForm
    Case "TAxisArrowScrollInvertedForm": Show_Form AxisArrowScrollInvertedForm
    Case "TAxisBehind": Show_Form AxisBehindForm
    Case "TAxisCustom": Show_Form AxisCustomForm
    Case "TAxisLabelAlignForm": Show_Form AxisLabelAlignFormForm
    Case "TAxisLabelExp": Show_Form AxisLabelExpForm
    Case "TAxisMillisec": Show_Form AxisMillisecForm
    Case "TAxisMinorGrid": Show_Form AxisMinorGridForm
    Case "TAxisMultiRuntime": Show_Form AxisMultiRuntimeForm
    Case "TAxisOpaqueZone": Show_Form AxisOpaqueZoneForm
    Case "TAxisTitleVisible": Show_Form AxisTitleVisibleForm
    Case "TBackWallGradient": Show_Form BackWallGradientForm
    Case "TBackWallImage": Show_Form BackWallImageForm
    Case "TBarGradientForm": Show_Form BarGradientForm
    Case "TBarImage": Show_Form BarImageForm
    Case "TBarJoinForm": Show_Form BarJoinFormForm
    Case "TBarSideAll": Show_Form BarSideAllForm
    Case "TBarStackGroup": Show_Form BarStackGroupForm
    Case "TBarStackNegative": Show_Form BarStackNegativeForm
    Case "TBezierSeriesForm": Show_Form BezierSeriesFormForm
    Case "TBollingerForm": Show_Form BollingerFormForm
    Case "TBoxPlotForm": Show_Form BoxPlotFormForm
    Case "TBrushStyleForm": Show_Form BrushStyleFormForm
    Case "TCalcIncrementForm": Show_Form CalcIncrementForm
    Case "TCalendarSeriesForm": Show_Form CalendarSeriesFormForm
    Case "TCandleAxisLabels": Show_Form CandleAxisLabelsForm
    Case "TCandleCustomColors": Show_Form CandleCustomColorsForm
    Case "TCandleOpenClose": Show_Form CandleOpenCloseForm
    Case "TBigCandleForm": Show_Form BigCandleForm
    Case "TCanvasDotPen": Show_Form CanvasDotPenForm
    Case "TChartBeforeDraw": Show_Form ChartBeforeDrawForm
    Case "TChartEditorForm": Show_Form ChartEditorFormForm
    Case "TChartEditorPanelForm": Show_Form ChartEditorPanelFormForm
    Case "TChartGridForm": Show_Form ChartGridFormForm
    Case "TChartGridRows": Show_Form ChartGridRowsForm
    Case "TChartTransparent": Show_Form ChartTransparentForm
    'Case "TChartWebSourceForm": Show_Form ChartWebSourceFormForm
    Case "TClockEdi": Show_Form ClockEdiForm
    Case "TColorBandToolForm": Show_Form ColorBandToolFormForm
    Case "TColorBandTransp": Show_Form ColorBandTranspForm
    Case "TColorGrid": Show_Form ColorGridForm
    Case "TColorGridClicked": Show_Form ColorGrid_ClickedForm
    Case "TColorLineForm": Show_Form ColorLineFormForm
    Case "TCommanderCustom": Show_Form CommanderCustomForm
    Case "TConesForm": Show_Form ConesFormForm
    Case "TConesForm": Show_Form ConesFormForm
    Case "TContourLevels": Show_Form ContourLevelsForm
    Case "TContourPaletteForm": Show_Form ContourPaletteFormForm
    Case "TContourSeriesForm": Show_Form ContourSeriesFormForm
    Case "TContourView2D": Show_Form ContourView2DForm
    Case "TCursorToolDemo": Show_Form CursorToolDemoForm
    Case "TCustomAxisEvent": Show_Form CustomAxisEvent
    Case "TDBChartOrder": Show_Form DBChartOrderForm
    Case "TDBChartSingleRecord": Show_Form DBChartSingleRowForm
    Case "TDBChartSingleRecordBycode": Show_Form DBChartSingleRecordByCode
    Case "TDBChartSpeed": Show_Form DBChartSpeedForm
    Case "TDBChartSummary": Show_Form DBChartSummaryForm
    Case "TDonutSeriesForm": Show_Form DonutSeriesFormForm
    Case "TDeleteRange": Show_Form DeleteRangeForm
    Case "TDragMarksToolDemo": Show_Form DragMarksToolDemoForm
    Case "TDrawLineOnDragged": Show_Form Tools_DrawLineDraggedForm
    Case "TDrawLineToolDemo": Show_Form DrawLineToolDemoForm
    Case "TDynArrays": Show_Form DynArraysForm
    Case "TDynArrayXYZ": Show_Form DynArraysXYZForm
    Case "TErrorBarNegativeForm": Show_Form ErrorBarNegativeFormForm
    Case "TExpMovAveForm": Show_Form ExpMovAveFormForm
    Case "TExponentialTrendForm": Show_Form ExponentialTrendFormForm
    Case "TExportEmailForm": Show_Form ExportEmailFormForm
    Case "TExportExcelForm": Show_Form ExportExcelFormForm
    Case "TExportHTMLForm": Show_Form ExportHTMLFormForm
    Case "TExportTextForm": Show_Form ExportTextFormForm
    Case "TExportXMLForm": Show_Form ExportXMLFormForm
    Case "TFunnelSeriesForm": Show_Form FunnelSeriesFormForm
    Case "TGIFExportForm": Show_Form GIFExportFormForm
    Case "TGradientMiddle": Show_Form GradientMiddleForm
    Case "TGrayScaleForm": Show_Form GrayScaleFormForm
    Case "THighLowForm": Show_Form HighLowFormForm
    Case "THistogramForm": Show_Form HistogramFormForm
    Case "THorizLineForm": Show_Form HorizLineFormForm
    Case "TImageToolForm": Show_Form ImageToolFormForm
    Case "TJPEGExportForm": Show_Form JPEGExportFormForm
    Case "TLegendAddText": Show_Form LegendAddTextForm
    Case "TLegendCheckBox": Show_Form LegendCheckBoxForm
    Case "TLegendCurrentPage": Show_Form LegendCurrentPageForm
    Case "TLegendCustomPos": Show_Form LegendCustomPosForm
    Case "TLegendFontColor": Show_Form LegendFontColorForm
    Case "TLegendImage": Show_Form LegendImageForm
    Case "TLegendSeriesForm": Show_Form LegendSeriesFormForm
    Case "TLegendStyle": Show_Form LegendStyleForm
    Case "TLegendSymbol": Show_Form LegendSymbolForm
    Case "TLegendVertSpa": Show_Form LegendVertSpaForm
    Case "TLegendWidths": Show_Form LegendWidthsForm
    Case "TLineClickableForm": Show_Form LineClickableFormForm
    Case "TLineColorEachLine": Show_Form LineColorEachLineForm
    Case "TLinePatternForm": Show_Form LinePatternFormForm
    Case "TLineStack": Show_Form LineStackForm
    Case "TMACDForm": Show_Form MACDFormForm
    Case "TMapSeriesForm": Show_Form MapSeriesFormForm
    Case "TMarksAngle": Show_Form MarksAngleForm
    Case "TMarksEvery": Show_Form MarksEveryForm
    Case "TMarksMulti": Show_Form MarksMultiForm
    Case "TMarksPositions": Show_Form MarksPositionsForm
    Case "TMarksShadow": Show_Form MarksShadowForm
    Case "TMarksXYStyle": Show_Form MarksXYStyleForm
    Case "TMarkTipsToolDemo": Show_Form MarkTipsToolDemoForm
    Case "TMaxMinVisibleForm": Show_Form MaxMinVisibleForm
    Case "TMomentumDivForm": Show_Form MomentumDivFormForm
    Case "TMovAveWeightedForm": Show_Form MovAveWeightedFormForm
    Case "TCursorToolProg": Show_Form Tool_CursorProgForm
    Case "TMultiAxisScroll": Show_Form MultiAxisScrollForm
    Case "TMultiLegendForm": Show_Form MultiLegendFormForm
    Case "TNearestToolDemo": Show_Form NearestToolDemoForm
    Case "TOpenGLEditorForm": Show_Form OpenGLEditorFormForm
    Case "TOpenGLTeeEditorForm": Show_Form OpenGLTeeEditorForm
    Case "TOrthoAngle": Show_Form OrthoAngleForm
    Case "TPageNavigatorForm": Show_Form PageNavigatorFormForm
    Case "TPageNumToolDemo": Show_Form PageNumToolDemoForm
    Case "TPenEndStyle": Show_Form PenEndStyleForm
    Case "TPCXExportForm": Show_Form PCXExportFormForm
    Case "TPieMultiple": Show_Form PieMultipleForm
    Case "TPieSemi": Show_Form PieSemiForm
    Case "TPieShadow": Show_Form PieShadowForm
    Case "TPNGExportForm": Show_Form PNGExportFormForm
    Case "TPoint3DEvent": Show_Form Point3DEventForm
    Case "TPointerDrawCanvas": Show_Form PointerDrawCanvasForm
    Case "TPolarClockWise": Show_Form PolarClockWiseForm
    Case "TPolarLabelsInside": Show_Form PolarLabelsInsideForm
    Case "TPrintPagesForm": Show_Form PrintPagesFormForm
    Case "TPrintPreviewForm": Show_Form PrintPreviewFormForm
    Case "TPrintPreviewForm": Show_Form PrintPreviewFormForm
    Case "TPrintPreviewMulti": Show_Form PrintPreviewMultiForm
    Case "TPrintPreviewMulti": Show_Form PrintPreviewMultiForm
    Case "TPrintPreviewMulti": Show_Form PrintPreviewMultiForm
    Case "TPrintPreviewNavigate": Show_Form PrintPreviewNavigateForm
    Case "TPrintPreviewNavigate": Show_Form PrintPreviewNavigateForm
    Case "TPyramidForm": Show_Form PyramidFormForm
    'Case "TRemovedProperties": Show_Form RemovedPropertiesForm
    Case "TRightWallForm": Show_Form RightWallFormForm
    Case "TRootMeanSqForm": Show_Form RootMeanSqFormForm
    Case "TRotateToolForm": Show_Form RotateToolFormForm
    Case "TRotationCenter": Show_Form RotationCenterForm
    Case "TRSICalcForm": Show_Form RSICalcFormForm
    Case "TScrollButtonForm": Show_Form ScrollButtonForm
    Case "TSeries3DRangePalette": Show_Form Series3DRangePaletteForm
    Case "TSeries3DRangePalette": Show_Form Series3DRangePaletteForm
    Case "TSeriesBeforeAdd": Show_Form OnBeforeAddForm
    Case "TSeriesChartDatasource": Show_Form SeriesFunctionFormForm
    Case "TSeriesDepth": Show_Form SeriesDepthForm
    Case "TSeriesTextSourceForm": Show_Form SeriesTextSourceFormForm
    Case "TShapeImage": Show_Form ShapeImageForm
    Case "TShapeVertAlign": Show_Form ShapeVertAlignForm
    Case "TSmithForm": Show_Form SmithFormForm
    Case "TStochasticForm": Show_Form StochasticFormForm
    Case "TSubTitles": Show_Form SubTitlesForm
    Case "TSurfaceFloat": Show_Form SurfaceFloatForm
    Case "TSurfacePaletteForm": Show_Form SurfacePaletteFormForm
    Case "TSurfaceSeriesForm": Show_Form SurfaceSeriesFormForm
    Case "TSurfaceSides": Show_Form SurfaceSidesForm
    Case "TSurfaceSmooth": Show_Form SurfaceSmoothForm
    Case "TSurfaceWire": Show_Form SurfaceWireForm
    Case "TTeeCommanderForm": Show_Form TeeCommanderFormForm
    Case "TTemplateChart": Show_Form TemplateChartForm
    'Case "TTitleClickEvent": Show_Form TitleClickEventForm
    Case "TTitleCustomPos": Show_Form TitleCustomPosForm
    Case "TTransparencyForm": Show_Form TransparencyForm
    Case "TTriSurfaceForm": Show_Form TriSurfaceFormForm
    'Case "TTruncPyramidForm": Show_Form TruncPyramidFormForm
    Case "TWaterFallForm": Show_Form WaterFallFormForm
    Case "TWindAngleInc": Show_Form WindAngleIncForm
    Case "TZoomDirection": Show_Form ZoomDirectionForm
    Case "TZoomMinPixel": Show_Form ZoomMinPixelForm
    Case "TZoomPen": Show_Form ZoomPenForm
    Case "TWelcomeForm": Show_Form LogoForm
    Case "TCandleOnGetPointer": Show_Form Candle_OnGetPointer
    Case "TVolumeOrigin": Show_Form Volume_Origin
    Case "TLineOutline": Show_Form Line_Outline
    Case "TAreaTransparency": Show_Form Area_Transparency
    Case "TFastLineDrawAll": Show_Form FastLine_DrawAll
    Case "THistogramTransp": Show_Form Histogram_Transparency
    Case "TCalendarButtons": Show_Form Calendar_Buttons
    Case "TChartGridColors": Show_Form ChartGrid_Colors
    Case "TChartEditorPageNum": Show_Form ChartEditor_PageNum
    Case "TPolarRadarTransp": Show_Form PolarRadar_Transparency
    Case "TTriSurfaceHiding": Show_Form TriSurface_Hiding
    Case "TColorLineDragRepaint": Show_Form ColorLine_DragRepaint
    Case "TDrawLineByCode": Show_Form DrawlineByCode
    Case "TColorLineDrawBehind3D": Show_Form ColorLine_DrawBehind3D
    Case "TNearestToolEvent": Show_Form NearestToolEvent
    Case "TBoxPlotCustom": Show_Form BoxPlotCustom
    Case "TCanvasPolygon": Show_Form CanvasPolygon
    Case "TAreaGradient": Show_Form Area_Gradient
    Case "TFastLineStairsVertAxis": Show_Form FastLine_StairsVertAxis
    Case "TSeriesDataSource": Show_Form SeriesDataSource
    Case "TMAPIError": Show_Form MAPIError
    Case "TValueListMaxMin": Show_Form ValueListMaxMinForm
    Case "TAntiAliasForm": Show_Form AntiAliasForm

    ' New added
    Case "TBasic_FeaturesForm": Show_Form Basic_FeaturesForm
    Case "TFastLineNullsForm": Show_Form FastLineNullsForm
    Case "TSurfaceHoleForm": Show_Form SurfaceHoleForm
    Case "TArea_StairsForm": Show_Form Area_StairsForm
    Case "TSeriesType_LineForm": Show_Form SeriesType_LineForm
    Case "TSeriesType_BarForm": Show_Form SeriesType_BarForm
    Case "TSeriesType_AreaForm": Show_Form SeriesType_AreaForm
    Case "TSeriesType_ArrowForm": Show_Form SeriesType_ArrowForm
    Case "TSeriesType_RadarForm": Show_Form SeriesType_RadarForm
    Case "TCustomersForm": Show_Form CustomersForm
    Case "TSeriesType_HorizBarForm": Show_Form SeriesType_HorizBarForm
    Case "TSeries_ErrorForm": Show_Form Series_ErrorForm
    Case "TSeries_Bar3DForm": Show_Form Series_Bar3DForm
    Case "TColorGrid_TransparentForm": Show_Form ColorGrid_TransparentForm
    Case "TUpgrading_and_OrderingForm": Show_Form Upgrading_and_OrderingForm
    Case "TPostScript_DemoForm": Show_Form PostScript_DemoForm
    Case "TTool_DragPointForm": Show_Form Tool_DragPointForm
    Case "TColorLine_DrawBehind3D": Show_Form ColorLine_DrawBehind3D
    'TeeChart Pro v9
    Case "TWelcomeForm": Show_Form LogoForm
    Case "TRose_Series": Show_Form Rose_Series
    Case "TMultiLanguageForm": Show_Form MultiLanguageForm
    Case "TTernarySeriesForm": Show_Form SeriesType_Ternary
    Case "TKnobGauge_SeriesForm": Show_Form KnobGauge_Series
    Case "TTreemapSeriesForm": Show_Form SeriesType_Treemap
    Case "TTool_AxisBreaksForm": Show_Form Tool_AxisBreaks
'    Case "TTool_CustomLegendForm": Show_Form Tool_CustomLegend
    Case "TMoneyFlowFunctionForm": Show_Form Function_MoneyFlow
    Case "TPercentChangeForm": Show_Form Function_PercentChange
    Case "TSlopeForm": Show_Form Function_Slope
    Case "TSkewnessForm": Show_Form Function_Skewness
    Case "TKurtosisForm": Show_Form Function_Kurtosis
    Case "TSMMAFunctionForm": Show_Form Function_SMMA
    Case "TATRFunctionForm": Show_Form Function_ATR
    Case "TRVIFunctionForm": Show_Form Function_RVI
    Case "TAOFunctionForm": Show_Form Function_AO
    Case "TACFunctionForm": Show_Form Function_AC
    Case "TAlligatorFunctionForm": Show_Form Function_Alligator
    Case "TGatorFunctionForm": Show_Form Function_Gator
    Case "TGDIPlusComponentForm": Show_Form TeeGDIPlusComponent
    Case "TTool_AxisBreaksForm": Show_Form Tool_AxisBreaks
    Case "TAxisGridZoning": Show_Form Axis_GridZoning
    Case "TAxisLabelsBehind": Show_Form Axis_LabelsBehind
    Case "TAxis_GridBandCenteredForm": Show_Form Axis_GridBandCentered
    Case "TAxis_RetrieveOldLabelsForm": Show_Form Axis_RetrieveOldLabels
    Case "TLegendTextSymbolGapForm": Show_Form Legend_TextSymbolGap
    Case "TLegendMaxRowsForm": Show_Form Legend_MaxRows
    Case "TSeriesCustomSmoothedForm": Show_Form Series_CustomSmoothed
    Case "TPolarZoom": Show_Form Series_PolarZoom
    Case "TFastLineDrawAllStyle": Show_Form FastLine_DrawAllStyle
    Case "TMarksFontSeriesColor": Show_Form Marks_FontSeriesColor
    Case "TBarMarksOnBarForm": Show_Form Bar_MarksOnBar
    Case "TBar_RoundedForm": Show_Form Bar_Rounded
    Case "THistogramYOriginForm": Show_Form HistogramYOrigin
    Case "TOrgHtmlFormatForm": Show_Form Org_HtmlFormat
    Case "TCandleOpenClosePen": Show_Form Candle_OpenClosePen
    Case "TPieLightingForm": Show_Form Pie_Lighting
    Case "TCircularGaugeNGaugeForm": Show_Form CircularGauge_NGauge
    Case "TCircularGaugeLGaugeForm": Show_Form CircularGauge_LGauge
    Case "TCircularGaugeEmbeddedForm": Show_Form CircularGauge_Embedded
    Case "TCircularGauge_DisplayAngleForm": Show_Form CircularGauge_DisplayAngle
    Case "TCircularGauge_SeriesForm": Show_Form CircularGauge_Series
    Case "TChartEditor_Options": Show_Form ChartEditor_Options
    Case "TCanvas_CompactChartForm": Show_Form Canvas_CompactChart
    Case "TToolsFibonacci": Show_Form Tools_Fibonacci
    Case "TMoreSeriesStatsToolForm": Show_Form Tool_MoreSeriesStats
    Case "TToolSeriesBandStairs": Show_Form Tool_SeriesBandStairs
    Case "TTool_SubChartEventsForm": Show_Form Tool_SubChartEvents
    Case "TSubChartEvents": Show_Form SubChart_Events
    Case "TEditorSeriesOrder": Show_Form Editor_SeriesOrder
    Case "TCurveFittingNormCoef": Show_Form CurveFitting_NormCoef
    Case "TCurveFittingSlopeY": Show_Form CurveFitting_SlopeY
    Case "TSPCFunctionForm": Show_Form Function_SPC
    Case "TChartGridTopLeftChanged": Show_Form ChartGrid_TopLeftChanged
    Case "TDPIExportForm": Show_Form Export_DPI
    Case "TNewChartThemes": Show_Form New_Chart_Themes
    Case "TSpeedThemeDemo": Show_Form Speed_Theme_Demo
    Case "TChartGridTopLeftChanged": Show_Form ChartGrid_TopLeftChanged
    Case "TTeeEmbossForm": Show_Form TeeEmboss
    Case "THTMLTextFormatForm": Show_Form HTMLTextFormat
    Case "TZoomHistory": Show_Form Zoom_History
    Case "TOther_ChangesV9Form": Show_Form Other_ChangesV9Form
    Case "TUpgrading_and_OrderingForm": Show_Form Upgrading_and_OrderingForm
    Case Else: Show_Form LogoForm
               LaunchFormAll = False
  End Select
End Function

Private Function LaunchFormNew(ByVal searchStr As String) As Boolean
LaunchFormNew = True
Select Case searchStr
    'TeeChart Pro v2014
    Case "TOther_ChangesV9Form": Show_Form Other_ChangesV9Form
    Case "TMarks_UseSeriesTransparency": Show_Form Marks_UseSeriesTransparency
    Case "TMarks_SoftClip": Show_Form Marks_SoftClip
    Case "TSeries_FilledPen": Show_Form Series_FilledPen
    Case "TArrow_Fill2D": Show_Form Arrow_Fill2D
    Case "TCanvas_RoundRectWithZ": Show_Form Canvas_RoundRectWithZ
    Case "TThemes_editor": Show_Form Themes_editor
    Case "TExport_JSON": Show_Form Export_JSON
    Case "TExport_OpenDocument": Show_Form Export_OpenDocument
    Case "TSeries_Transparency": Show_Form Series_Transparency
    Case "TBubble_InflateMargins": Show_Form Bubble_InflateMargins
    Case "TCandle_RemoveGaps": Show_Form Candle_RemoveGaps
    Case "TClock_ClockHand": Show_Form Clock_ClockHand
    Case "TGantt_Callout": Show_Form Gantt_Callout
    Case "TSeries_DrawStyle": Show_Form Series_DrawStyle
    Case "TSeries_PieMarks": Show_Form Series_PieMarks
    Case "TSeries_MultiPie_Concentric": Show_Form Series_MultiPie_Concentric
    Case "TGradient_MultiColor": Show_Form Gradient_MultiColor
    Case "TSeries_DonutPointer": Show_Form Series_DonutPointer
    Case "TChartEditor_Options": Show_Form ChartEditor_Options
    Case Else: LaunchFormNew = False
  End Select
End Function

Private Sub LoadForm(Index As Integer)
Dim searchStr

  If Forms.Count > 1 Then
    Unload Forms(1)
  End If
  Select Case Index
  Case 9999:
    CodeForm.Show vbModeless, Me
  Case 9998:
    SupportForm.Show vbModeless, Me
  Case Else
   If SSTab1.Tab = 0 Then
     If (Outline1.SelectedItem.Tag <> "LogoForm") Then
        SelectedIndex = Index
        If LaunchFormNew(Outline1.SelectedItem.Tag) = False Then
            Show_Form LogoForm
        End If
     End If
   End If
 
   If SSTab1.Tab = 1 Then
   '(SelectedIndex <> Index) And
     If (Outline3.SelectedItem.Tag <> "LogoForm") Then
        SelectedIndex = Index
        LaunchFormAll (Outline3.SelectedItem.Tag)
     End If
   End If
  End Select

  If Forms.Count > 1 Then
    OpenFile = Forms(1).Name
    Forms(1).Tag = "L"
    PositionForm
  End If
End Sub

Private Sub Outline3_Click()
    CheckButtons
    If Outline3.SelectedItem.Index > 3 Then
      Command3.Visible = True
    End If
    SSTab2.Tab = 0
    LoadForm (Outline3.SelectedItem.Index)
End Sub

Private Sub SSTab1_Click(PreviousTab As Integer)
    CheckActiveTab
End Sub

Private Sub SSTab2_Click(PreviousTab As Integer)
Dim codestring
Dim copytext As Boolean ' Var to know when should start to copy the source code
Select Case SSTab2.Tab
  Case 0:
    Select Case SSTab1.Tab
      Case 0:
          LoadForm (Outline1.SelectedItem.Index)
      Case 1:
          LoadForm (Outline3.SelectedItem.Index)
      Case 2:
          If List1.ListCount > 0 Then
            t = "T" & FormsName(List1.ListIndex + 1)
            Do While Forms.Count > 1
              Unload Forms(1)
            Loop
            If LaunchFormNew(t) = False Then
              LaunchFormAll (t)
            End If
            If Forms.Count > 1 Then
              OpenFile = Forms(1).Name
              Forms(1).Tag = "L"
            End If
          Else
            LoadForm (0)
          End If
    End Select
  Case 1:
    On Error GoTo ErrorHandler
    If OpenFile <> "" Then
        Close #1
        copytext = False
        Open App.Path & "\" & OpenFile & ".frm" For Input As #1
        CodeForm.Text1.Text = "Form Name : " + OpenFile + Chr$(13) + Chr$(10)
        CodeForm.Text1.Text = CodeForm.Text1.Text + Chr$(13) + Chr$(10)
        Do While Not EOF(1)
            Line Input #1, codestring
            If (Left(codestring, 7) = "Private") Or copytext = True Then
              CodeForm.Text1.Text = CodeForm.Text1.Text + codestring + Chr$(13) + Chr$(10)
              copytext = True
            End If
        Loop
        Close #1
            LoadForm (9999) ' 9999 used when we want to see the Source Code
    End If
  Case 2:
      LoadForm (9998) ' 9998 used when we want to see the Support Form
ExitPoint:
    Exit Sub

ErrorHandler:
    MsgBox Err.Description, vbExclamation, "TeeChart Pro v2015"
    Resume ExitPoint
End Select
End Sub

Private Sub TChart1_OnDblClick()
  TChart1.ShowEditor
  TChart1.StopMouse
End Sub

Private Sub Timer1_Timer()
 ' Test routine to step through tree
 With Outline1
    If .SelectedItem.Index < .Nodes.Count Then
        Me.Timer1.Enabled = False
        .Nodes(.SelectedItem.Index + 1).Selected = True
        If .Nodes(.SelectedItem.Index - 1).Expanded = False Then
            .Nodes(.SelectedItem.Index - 1).Expanded = True
        End If
        .SelectedItem.Expanded = True
        LoadForm (.SelectedItem.Index)
        CheckButtons
        Me.Timer1.Enabled = True
    Else
        Me.Timer1.Enabled = False
    End If
 End With
End Sub

'*************** Code of Search ******************
Private Sub DoSearch()
Dim ExistCombo, ExistForm, Found_in_List As Boolean
Dim tmpSearchText As String
Dim i, NumWords, NumForms, iIni, iFin, clist As Integer
Dim SearchWords() As String
Dim strTemp As String
Dim FilesFound() As String
Dim ListFiles2() As String
Dim dire As String
Dim num_files_found As Integer
           
  'Changes the Mouse pointer
  Screen.MousePointer = vbHourglass
  tmpSearchText = Combo1.Text
  If tmpSearchText <> "" Then
    'Check if the same Text is already into the Combo
    ExistCombo = False
    For i = 0 To Combo1.ListCount - 1
        If Combo1.List(i) = tmpSearchText Then
            ExistCombo = True
        End If
    Next i
    If ExistCombo = False Then
      Combo1.AddItem tmpSearchText
    End If
    'Add all the words into an Array so then will can search for them
    NumForms = 0
    NumWords = 1
    iIni = 1
    iFin = InStr(iIni, tmpSearchText, " ")
    Do While iFin
      ReDim Preserve SearchWords(1 To NumWords)
      SearchWords(NumWords) = UCase(Mid$(tmpSearchText, iIni, (iFin - iIni)))
      iIni = iFin + 1
      iFin = InStr(iIni, tmpSearchText, " ")
      NumWords = NumWords + 1
    Loop
    ReDim Preserve SearchWords(1 To NumWords)
    SearchWords(NumWords) = UCase(Mid$(tmpSearchText, iIni, Len(tmpSearchText)))

    ' if Search in Source code is Checked
    If Check2.Value Then
      ' make a list of files in the directory
      dire = App.Path
      ListFiles2() = ListFiles(dire + "\")
      ' set initial values to ProgressBar
      ProgressBar1.Min = 0
      ProgressBar1.Max = Count_Files
      ProgressBar1.Value = 0
      
      num_files_found = 0
            
      'Iterate from all the Files
      For filesdir = LBound(ListFiles2) To UBound(ListFiles2)
        StatusBar1.Panels.Item(1).Text = "Searching.... " + ListFiles2(filesdir)
        If ProgressBar1.Value < Count_Files - 35 Then
          ProgressBar1.Value = ProgressBar1.Value + 0.25
        End If
        ' Iterate from all the Words
        txtFile = ""
        Close #1
        Open App.Path + "\" + ListFiles2(filesdir) For Input As 1
        While Not EOF(1)
          Line Input #1, strTemp
          txtFile = txtFile & UCase(strTemp) & vbCrLf
        Wend
        found = False
        qwords_found = 0
        For words = LBound(SearchWords) To UBound(SearchWords)
          'Debug.Print SearchWords(words)
          ' Search for the word in the file
          If SearchWords(words) <> "" Then
            If InStr(txtFile, SearchWords(words)) <> 0 Then
              found = True
              qwords_found = qwords_found + 1
              ' if All Words has been checked
              If Check1.Value Then
                If qwords_found = UBound(SearchWords) Then
                  num_files_found = num_files_found + 1
                ' save the Form name to an Array which contains the files where has been found
                  ReDim Preserve FilesFound(1 To num_files_found)
                  FilesFound(num_files_found) = ListFiles2(filesdir)
                End If
              Else
                num_files_found = num_files_found + 1
                ' save the Form name to an Array which contains the files where has been found
                ReDim Preserve FilesFound(1 To num_files_found)
                FilesFound(num_files_found) = ListFiles2(filesdir)
              End If
            Else
              found = False
            End If
          End If
        Next words
      Next filesdir
      If num_files_found > 0 Then
        For filesf = LBound(FilesFound) To UBound(FilesFound)
          StatusBar1.Panels.Item(1).Text = "Searching Form descriptions.... " + FilesFound(filesf)
          If ProgressBar1.Value < Count_Files - 35 Then
            ProgressBar1.Value = ProgressBar1.Value + 0.25
          End If
          Close #1
          ' Search the Form description in the .txt files to be added to the list
          Open App.Path & "\tree.txt" For Input As #1
          Do While Not EOF(1)
            Line Input #1, codeline
            'Debug.Print FilesFound(filesf)
            Text = Left(FilesFound(filesf), Len(FilesFound(filesf)) - 4)
            Debug.Print Text
            If InStr(codeline, Text) <> 0 Then
              iiniline = 1
              For i = 1 To Len(codeline)
                If Mid(codeline, i, 1) <> " " Then
                  iiniline = i
                  Exit For
                End If
              Next i
              ExistForm = False
              ifinline = 0
              For i = iiniline To Len(codeline)
                If Mid$(codeline, i, 1) = "," Then
                  ExistForm = True
                  ifinline = i
                  Exit For
                End If
              Next i
              If ExistForm = True Then
                List1.AddItem Mid$(codeline, iiniline, ifinline - iiniline)
                ' add the Form Name to an Array
                iStartFormName = ifinline + 1
                For i = iStartFormName To Len(codeline)
                  If Mid$(codeline, i, 1) = "," Then
                    iEndFormName = i
                    Exit For
                  End If
                Next i
                NumForms = NumForms + 1
                ReDim Preserve FormsName(1 To NumForms)
                FormsName(NumForms) = Mid$(codeline, iEndFormName + 1, Len(codeline) - iEndFormName + 1)
              End If
            End If
          Loop
          Close #1
          
          Open App.Path & "\tree_all.txt" For Input As #1
          Do While Not EOF(1)
            If ProgressBar1.Value < Count_Files - 35 Then
              ProgressBar1.Value = ProgressBar1.Value + 0.25
            End If
            Line Input #1, codeline
            Debug.Print FilesFound(filesf)
            Text = Left(FilesFound(filesf), Len(FilesFound(filesf)) - 4)
            Debug.Print Text
            If InStr(codeline, Text) <> 0 Then
              iiniline = 1
              For i = 1 To Len(codeline)
                If Mid(codeline, i, 1) <> " " Then
                  iiniline = i
                  Exit For
                End If
              Next i
              ExistForm = False
              ifinline = 0
              For i = iiniline To Len(codeline)
                If Mid$(codeline, i, 1) = "," Then
                  ExistForm = True
                  ifinline = i
                  Exit For
                End If
              Next i
              If ExistForm = True Then
                List1.AddItem Mid$(codeline, iiniline, ifinline - iiniline)
                ' add the Form Name to an Array
                iStartFormName = ifinline + 1
                For i = iStartFormName To Len(codeline)
                  If Mid$(codeline, i, 1) = "," Then
                    iEndFormName = i
                    Exit For
                  End If
                Next i
                NumForms = NumForms + 1
                ReDim Preserve FormsName(1 To NumForms)
                FormsName(NumForms) = Mid$(codeline, iEndFormName + 1, Len(codeline) - iEndFormName + 1)
              End If
            End If
          Loop
          Close #1
        Next filesf
      Else
        MsgBox "No Files found"
      End If
      ProgressBar1.Value = Count_Files
    End If
    
    ' LOOK IN TREES
        For words = LBound(SearchWords) To UBound(SearchWords)
          StatusBar1.Panels.Item(1).Text = "Searching in Trees.... " + SearchWords(words)
          Close #1
          ' Search the Form description in the .txt files to be added to the list
          Open App.Path & "\tree.txt" For Input As #1
          Do While Not EOF(1)
            Line Input #1, codeline
            Text = Left(SearchWords(words), Len(SearchWords(words)))
            If InStr(UCase(codeline), Text) <> 0 Then
              iiniline = 1
              For i = 1 To Len(codeline)
                If Mid(codeline, i, 1) <> " " Then
                  iiniline = i
                  Exit For
                End If
              Next i
              ExistForm = False
              ifinline = 0
              For i = iiniline To Len(codeline)
                If Mid$(codeline, i, 1) = "," Then
                  ExistForm = True
                  ifinline = i
                  Exit For
                End If
              Next i
              If ExistForm = True Then
                ' check if it's already in the list
                Found_in_List = False
                For clist = 0 To List1.ListCount - 1
                  If List1.List(clist) = Mid$(codeline, iiniline, ifinline - iiniline) Then
                    Found_in_List = True
                  End If
                Next clist
                If Found_in_List = False Then
                  List1.AddItem Mid$(codeline, iiniline, ifinline - iiniline)
                  ' add the Form Name to an Array
                  iStartFormName = ifinline + 1
                  For i = iStartFormName To Len(codeline)
                    If Mid$(codeline, i, 1) = "," Then
                      iEndFormName = i
                      Exit For
                    End If
                  Next i
                  NumForms = NumForms + 1
                  ReDim Preserve FormsName(1 To NumForms)
                  FormsName(NumForms) = Mid$(codeline, iEndFormName + 1, Len(codeline) - iEndFormName + 1)
                End If
              End If
            End If
          Loop
          Close #1
          
          Open App.Path & "\tree_all.txt" For Input As #1
          Do While Not EOF(1)
            Line Input #1, codeline
            'Debug.Print FilesFound(filesf)
            Text = Left(SearchWords(words), Len(SearchWords(words)))
            'Debug.Print Text
            If InStr(UCase(codeline), Text) <> 0 Then
              iiniline = 1
              For i = 1 To Len(codeline)
                If Mid(codeline, i, 1) <> " " Then
                  iiniline = i
                  Exit For
                End If
              Next i
              ExistForm = False
              ifinline = 0
              For i = iiniline To Len(codeline)
                If Mid$(codeline, i, 1) = "," Then
                  ExistForm = True
                  ifinline = i
                  Exit For
                End If
              Next i
              If ExistForm = True Then
                ' check if it's already in the list
                Found_in_List = False
                For clist = 0 To List1.ListCount - 1
                  If List1.List(clist) = Mid$(codeline, iiniline, ifinline - iiniline) Then
                    Found_in_List = True
                  End If
                Next clist
                If Found_in_List = False Then
                  List1.AddItem Mid$(codeline, iiniline, ifinline - iiniline)
                  ' add the Form Name to an Array
                  iStartFormName = ifinline + 1
                  For i = iStartFormName To Len(codeline)
                    If Mid$(codeline, i, 1) = "," Then
                      iEndFormName = i
                      Exit For
                    End If
                  Next i
                  NumForms = NumForms + 1
                  ReDim Preserve FormsName(1 To NumForms)
                  FormsName(NumForms) = Mid$(codeline, iEndFormName + 1, Len(codeline) - iEndFormName + 1)
                End If
              End If
            End If
          Loop
          Close #1
        Next words
  End If
  Screen.MousePointer = vbNormal
  StatusBar1.Panels.Item(1).Text = "Searching Finished."
  ProgressBar1.Value = ProgressBar1.Max
End Sub

' Return an array containing the names of the
' files in the directory
Private Function ListFiles(ByVal dir_path As String) As String()
Dim num_files As Integer
Dim files() As String
Dim file_name As String
    Count_Files = 0
    file_name = Dir$(dir_path)
    Do While Len(file_name) > 0
            If (Right(file_name, 3) = "frm") Then
              num_files = num_files + 1
              ReDim Preserve files(1 To num_files)
              files(num_files) = file_name
              Count_Files = Count_Files + 1
            End If
        file_name = Dir$()
    Loop
    ' Return the list.
    ListFiles = files
End Function

Private Sub Timer2_Timer()
 If Me.Left <> oldLeft Or Me.Top <> oldTop Then
   PositionForm
   oldLeft = Me.Left
   oldTop = Me.Top
 End If
End Sub
