Option Strict Off
Option Explicit On
Friend Class Form1
	Inherits System.Windows.Forms.Form
	' global variable used to control the demo...
	Dim Stopped As Boolean
	Dim ControlRepaint As Boolean
    Dim ResetSeries As Boolean
    Dim loaded As Boolean
	
	'UPGRADE_WARNING: Event Check2.CheckStateChanged may fire when form is initialized. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="88B12AE1-6DE0-48A0-86F1-60C0686C026A"'
    Private Sub Check2_CheckStateChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Check2.CheckStateChanged

        If loaded Then
            TChart1.Series(0).asFastLine.DrawAllPoints = Check2.CheckState = 0
            TChart1.Series(1).asFastLine.DrawAllPoints = Check2.CheckState = 0
        End If

    End Sub
	
	Private Sub Command1_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command1.Click
		' if we are stopping the demo...
		If Command1.Text = "&Stop !" Then
			Command1.Text = "&Start Example !"
			Check1.Enabled = True
			Stopped = True
			TChart1.AutoRepaint = False
			TChart1.Repaint()
			ResetSeries = True
		Else
			' if we are starting the demo...
			ResetSeries = True
			RunDemo()
		End If
		
	End Sub
	
	Private Sub RunDemo()
		Dim tmpCount As Object

		If ResetSeries = True Then
			TChart1.Series(0).Clear()
			TChart1.Series(1).Clear()
			TChart1.Axis.Bottom.SetMinMax(0, 300000)
			
			TChart1.AutoRepaint = True
			TChart1.Repaint()
		End If
		
		'activate these to implement your own repaint control
		'TChart1.AutoRepaint = False
		'TChart1.Series(0).asFastLine.AutoRepaint = False
		'TChart1.Series(1).asFastLine.AutoRepaint = False
		
		TChart1.Axis.Left.SetMinMax(-500, 500)
		
		TChart1.Legend.Visible = False
		
		
		Check1.Enabled = False
		Command1.Text = "&Stop !"
		
		' quit infinite loop...
		Stopped = False
		
		'UPGRADE_WARNING: Couldn't resolve default property of object tmpCount. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		tmpCount = 0
		While Not Stopped
			' if Fast... use AddRealTime...
			If Check1.CheckState Then
				With TChart1.Series(0)
					.asFastLine.AutoSizeVertAxis = False
					
					If .Count = 0 Then
                        .asFastLine.AddRealTime(.Count, 1 + (Rnd() * 3), "", TeeChart.EConstants.clTeeColor)
					Else
                        .asFastLine.AddRealTime(.Count, .YValues.Last - 1 + (Rnd() * 2), "", TeeChart.EConstants.clTeeColor)
					End If
				End With
				With TChart1.Series(1)
					If .Count = 0 Then
                        .asFastLine.AddRealTime(.Count, 1 + (Rnd() * 3), "", TeeChart.EConstants.clTeeColor)
					Else
                        .asFastLine.AddRealTime(.Count, .YValues.Last - 1 + (Rnd() * 2), "", TeeChart.EConstants.clTeeColor)
					End If
				End With
			Else
				' use AddXY, no auto scrolling
				TChart1.AutoRepaint = False
				
				With TChart1.Series(0)
					
					.asFastLine.AutoSizeVertAxis = False
					
					If .Count = 0 Then
                        .AddXY(.Count, 1 + (Rnd() * 3), "", TeeChart.EConstants.clTeeColor)
					Else
                        .AddXY(.Count, .YValues.Last - 1 + (Rnd() * 2), "", TeeChart.EConstants.clTeeColor)
					End If
				End With
				With TChart1.Series(1)
					If .Count = 0 Then
                        .AddXY(.Count, 1 + (Rnd() * 3), "", TeeChart.EConstants.clTeeColor)
					Else
                        .AddXY(.Count, .YValues.Last - 1 + (Rnd() * 2), "", TeeChart.EConstants.clTeeColor)
					End If
				End With
				
				With TChart1
					If .Series(0).Count Mod 1000 = 0 Then
						If .Axis.Bottom.Maximum < .Series(0).Count + 500 Then
							.Axis.Bottom.SetMinMax(.Axis.Bottom.Minimum + 10000, .Axis.Bottom.Maximum + 10000)
						End If
						TChart1.AutoRepaint = True
						TChart1.Repaint()
						System.Windows.Forms.Application.DoEvents()
						TChart1.AutoRepaint = False
					End If
				End With
				
			End If
			
			' give time to Windows...
			System.Windows.Forms.Application.DoEvents()
		End While
		
	End Sub
	
	Private Sub Command2_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command2.Click
		End
	End Sub
	
	Private Sub Command3_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Command3.Click
		Dim i As Object
		ResetSeries = False
		
		
		Dim MyYArray(50000) As Object
		Dim MyY2Array(50000) As Object
		
		For i = 0 To UBound(MyYArray) - 1
            If i = 0 Then
                MyYArray(i) = 1 + (Rnd() * 3)
                MyY2Array(i) = 0.5 + (Rnd() * 3)
            Else
                MyYArray(i) = MyYArray(i - 1) - 1 + (Rnd() * 2)
                MyY2Array(i) = MyY2Array(i - 1) - 1 + (Rnd() * 2)
            End If
		Next i
		
		TChart1.Series(0).Clear()
		TChart1.Series(1).Clear()
		TChart1.Axis.Bottom.SetMinMax(0, 300000)
		
		TChart1.Series(0).AddArray(UBound(MyYArray), MyYArray)
		TChart1.Series(1).AddArray(UBound(MyY2Array), MyY2Array)
		
		TChart1.AutoRepaint = True
		TChart1.Repaint()
		
		RunDemo()
	End Sub
	
    Private Sub Form1_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
        loaded = True

        TChart1.ClipPoints = True
        TChart1.Series(0).asFastLine.DrawAllPoints = False
        TChart1.Series(1).asFastLine.DrawAllPoints = False
    End Sub
	
	Private Sub Form1_FormClosed(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
		End
	End Sub
End Class