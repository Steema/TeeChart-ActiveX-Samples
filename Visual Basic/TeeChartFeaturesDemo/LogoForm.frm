VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2015.ocx"
Begin VB.Form LogoForm 
   BorderStyle     =   0  'None
   Caption         =   "Form4"
   ClientHeight    =   6930
   ClientLeft      =   3585
   ClientTop       =   2055
   ClientWidth     =   11580
   Icon            =   "LogoForm.frx":0000
   LinkTopic       =   "Form4"
   ScaleHeight     =   6930
   ScaleWidth      =   11580
   ShowInTaskbar   =   0   'False
   Begin TeeChart.TChart TChart1 
      Height          =   6975
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   11535
      Base64          =   $"LogoForm.frx":0442
      Begin TeeChart.TChart TChart5 
         Height          =   1515
         Left            =   30
         TabIndex        =   4
         Top             =   1950
         Width           =   2745
         Base64          =   $"LogoForm.frx":191A
      End
      Begin TeeChart.TChart TChart7 
         Height          =   1695
         Left            =   180
         TabIndex        =   6
         Top             =   4980
         Width           =   2685
         Base64          =   $"LogoForm.frx":325A
      End
      Begin TeeChart.TChart TChart3 
         Height          =   2565
         Left            =   60
         TabIndex        =   2
         Top             =   3480
         Width           =   2610
         Base64          =   $"LogoForm.frx":4AEE
      End
      Begin TeeChart.TChart TChart6 
         Height          =   2895
         Left            =   240
         TabIndex        =   1
         Top             =   -510
         Width           =   2205
         Base64          =   $"LogoForm.frx":76BC
      End
      Begin TeeChart.TChart TChart4 
         Height          =   6975
         Left            =   30
         TabIndex        =   3
         Top             =   0
         Width           =   11535
         Base64          =   $"LogoForm.frx":8CD4
      End
   End
   Begin TeeChart.TChart TChart2 
      Height          =   1605
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   2895
      Base64          =   $"LogoForm.frx":210CE
   End
End
Attribute VB_Name = "LogoForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim logoTrans, lightFactor, lightFactorX As Integer
Dim ArrayTees As Variant

Private Sub Form_Load()
LoadChart
 With TChart3.Series(0).asCircularGauge
    .Face.Gradient.Visible = False
    .Center.Gradient.Visible = False
    .Value = 72
    .Axis.AxisPen.Visible = False
    .Axis.Labels.Font.Height = 11
    .Axis.Labels.Font.Color = vbGrayText
 End With
 
 With TChart7
    .Walls.Back.Transparent = True
    .Panel.Gradient.Visible = False
    With .Series(0).asLine
        .Pointer.Visible = True
        .LinePen.Visible = True
    End With
    With .Series(1).asLine
        .Pointer.Visible = True
        .LinePen.Visible = True
    End With
 End With
 With TChart5
    .Panel.Gradient.Visible = False
    With .Series(0)
        .Marks.Visible = False
        With .asBar
            .BarPen.Visible = True
            .BarPen.Color = vbWhite
        End With
    End With
    With .Series(1)
        .Marks.Visible = False
        With .asBar
            .BarPen.Visible = True
            .BarPen.Color = vbWhite
        End With
    End With
 End With
 TChart1.Panel.Gradient.Visible = False
 TChart2.Panel.Gradient.Visible = False
 TChart3.Panel.Gradient.Visible = False
 TChart4.Panel.Gradient.Visible = False
 TChart4.Walls.Back.Transparent = True
 With TChart6
    .Series(0).Marks.Visible = False
    .Panel.Gradient.Visible = False
 End With
End Sub

Private Sub Form_Resize()
 If Forms(1).Tag = "L" Then
  Forms(1).Move Form1.Left + (Form1.Width / 3) + 40, Form1.Top + (Form1.Height / 5) - 40
  Forms(1).Refresh
 End If
End Sub

Private Sub Timer1_Timer()
  If logoTrans > 70 Then
    logoTrans = logoTrans - 1
  End If
  If lightFactor < 100 And lightFactorX < 400 Then
    lightFactor = lightFactor + 2
  Else
    If lightFactorX < 400 Then
      lightFactorX = lightFactorX + 3
    Else
      If lightFactor > 0 Then
        lightFactor = lightFactor - 2
      Else
      End If
    End If
  End If
  DoEvents
End Sub

Private Sub Timer2_Timer()
    LoadChart
'  DoEvents
End Sub

Private Sub LoadChart()

TChart4.RemoveAllSeries
TChart4.AddSeries scWorld
TChart4.Series(0).FillSampleValues

With TChart4.Series(0).asWorld
    '.UseColorRange = False
    '.UsePalette = True
    '.PaletteStyle = psRainbow
    .Pen.Visible = False
    .StartColor = RGB(51, 181, 229)
    .EndColor = RGB(170, 102, 204)
End With

TChart3.Aspect.GDIPlus.Active = True
TChart4.Aspect.GDIPlus.Active = True
TChart5.Aspect.GDIPlus.Active = True
TChart6.Aspect.GDIPlus.Active = True

With TChart5.Panel
    .BorderStyle = bsNone
    .BevelOuter = bvNone
    .BevelInner = bvNone
    .BevelWidth = 0
    .Border.Width = 0
End With

TChart4.Panel.BevelInner = bvNone

'TChart4.Panel.BevelOuter = bvRaised


'With TChart1
'    .ClearChart
'    .Panel.BevelInner = bvRaised
'    .Panel.BevelOuter = bvLowered
'    .Import.LoadFromFile App.Path + "\Tees\" + ArrayTees(Rnd * 4)
'    .Tools.Add tcRectangle
'    .Tools.Items(.Tools.Count - 1).asRectangle.AutoSize = False
'    .Tools.Items(.Tools.Count - 1).asRectangle.Top = 0
'    .Tools.Items(.Tools.Count - 1).asRectangle.Left = 0
'    .Tools.Items(.Tools.Count - 1).asRectangle.Width = .Width
'    .Tools.Items(.Tools.Count - 1).asRectangle.Height = .Height
'    .Tools.Items(.Tools.Count - 1).asRectangle.Shape.Transparency = 65
'End With

End Sub

