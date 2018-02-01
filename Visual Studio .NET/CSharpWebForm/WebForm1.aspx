<%@ Page language="c#" Codebehind="WebForm1.aspx.cs" AutoEventWireup="false" Inherits="CSharpWebForm.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<script language="VBScript">
		Dim XVal, YVal
 
		Sub Window_Onload()
			Form1.TChart1.Import.LoadFromURL("http://localhost/CSharpWebForm/genchart.aspx")
		end sub
  
		Sub TChart1_OnAfterDraw()
		if Form1.TChart1.SeriesCount > 0 then
			Form1.TChart1.Canvas.TextOut 10,10,"Highest value: " & Form1.TChart1.Series(0).YValues.Maximum
      
			  Form1.TChart1.Canvas.TextOut 10,25,"XVal: " & XVal & _
                                         "; YVal: " & YVal
		end if
		End sub
  
		Sub TChart1_OnMouseMove(shftstate, x, y)
			if Form1.TChart1.SeriesCount > 0 then
			if x < Form1.TChart1.Axis.Right.Position and x > Form1.TChart1.Axis.Left.Position _
				and y < Form1.TChart1.Axis.Bottom.Position and y > Form1.TChart1.Axis.Top.Position then
				XVal = Round(Form1.TChart1.Series(0).XScreenToValue(x),2)
				YVal = Round(Form1.TChart1.Series(0).YScreenToValue(y),2)  
			else
				XVal ="none"
				YVal ="none"
			end if
			Form1.TChart1.Repaint
			end if
		end	sub
		</script>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="VBScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<DIV style="LEFT: 4px; WIDTH: 10px; POSITION: absolute; TOP: 4px; HEIGHT: 10px" ms_positioning="text2D">
			<FORM id="Form1" method="post" runat="server">
				<OBJECT id="TChart1" style="Z-INDEX: 101; LEFT: 38px; WIDTH: 558px; POSITION: absolute; TOP: 179px; HEIGHT: 284px"
					type="application/x-oleobject" classid="clsid:BDEB0088-66F9-4A55-ABD2-0BF8DEEC1196"
					name="TChart1" VIEWASTEXT>
					<PARAM NAME="Base64" VALUE="VFBGMAtUQ2hhcnRDaGFydAAETGVmdAIAA1RvcAIABVdpZHRoAy4CBkhlaWdodAMcARBHcmFkaWVu&#13;&#10;dC5WaXNpYmxlCRJUaXRsZS5UZXh0LlN0cmluZ3MBBghUZWVDaGFydAAAAAAAAAACAAAAAP////8=">
				</OBJECT>
				<IMG style="Z-INDEX: 109; LEFT: 40px; POSITION: absolute; TOP: 35px" height="66" alt="TeeChart ActiveX Control by Steema Software SL"
					src="TeeChartAX300x66.jpg" width="300">
				<HR style="Z-INDEX: 110; LEFT: 39px; WIDTH: 670px; POSITION: absolute; TOP: 118px; HEIGHT: 3px"
					width="670" SIZE="3">
				<asp:Label id="Label1" style="Z-INDEX: 111; LEFT: 465px; POSITION: absolute; TOP: 89px" runat="server"
					Font-Size="Medium" Font-Names="Arial" Width="242px" Height="26px">ASP .NET WebForm example</asp:Label>
				<HR style="Z-INDEX: 112; LEFT: 39px; WIDTH: 670px; POSITION: absolute; TOP: 541px; HEIGHT: 3px"
					width="670" SIZE="3">
				<DIV style="DISPLAY: inline; Z-INDEX: 113; LEFT: 38px; WIDTH: 415px; POSITION: absolute; TOP: 550px; HEIGHT: 30px"
					ms_positioning="FlowLayout">
					<P style="FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: Arial">TeeChart&nbsp;Pro 
						ActiveX Control&nbsp;Copyright © 1997-2007 Steema Software SL</P>
				</DIV>
			</FORM>
		</DIV>
	</body>
</HTML>
