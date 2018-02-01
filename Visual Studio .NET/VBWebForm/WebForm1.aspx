<%@ Page Language="VB" AutoEventWireup="false" CodeFile="WebForm1.aspx.vb" Inherits="WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <script type="text/javascript">

        var XVal; 
        var YVal;

        function import_chart() {
            Form1.TChart1.Import.LoadFromURL("http://localhost/VBWebForm/genchart.aspx")
            Form1.TChart1.Aspect.View3D = false;
            Form1.TChart1.SetTheme(7, 0);
            Form1.TChart1.Header.Alignment = 1;
            Form1.TChart1.Panel.BevelOuter = 0;
            Form1.TChart1.Legend.Visible = false;
        }
    </script>

    <script LANGUAGE="JavaScript" FOR="TChart1" EVENT="OnAfterDraw()">
        if (Form1.TChart1.SeriesCount > 0) {
            Form1.TChart1.Canvas.TextOut(10,10,"Highest value: " + Form1.TChart1.Series(0).YValues.Maximum);
            Form1.TChart1.Canvas.TextOut(10,25,"XPointVal: " + XVal + "; YScreenVal: " + YVal);
        }
    </script>

    <script LANGUAGE="JavaScript" FOR="TChart1" EVENT="OnMouseMove(Shift, x, y)">
        if (Form1.TChart1.SeriesCount > 0) {

          if ((x < Form1.TChart1.Axis.Right.Position) && (x > Form1.TChart1.Axis.Left.Position) &&
              (y < Form1.TChart1.Axis.Bottom.Position) && (y > Form1.TChart1.Axis.Top.Position)) {
            XVal = Math.round(Form1.TChart1.Series(0).XScreenToValue(x),2);
            YVal = Math.round(Form1.TChart1.Series(0).YScreenToValue(y),2);  
          }
          else {
            XVal = "none";
            YVal = "none";
          }
         
          Form1.TChart1.Repaint
        }
    </script>

    <title>WebForm1</title>

    <meta name="GENERATOR" content="Microsoft Visual Studio.NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic 7.0">
    <meta name="vs_defaultClientScript" content="Javascript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
  </HEAD>
  <body MS_POSITIONING="GridLayout" onload="import_chart()">
    <form id="Form1" method="post" runat="server">
      <OBJECT id="TChart1" 
          style="Z-INDEX: 101; LEFT: 38px; WIDTH: 660px; POSITION: absolute; TOP: 149px; HEIGHT: 413px" 
          type="application/x-oleobject" 
          classid="clsid:CC0427C7-2124-4770-8847-F9EF4C50CDC2" name="TChart1" 
          VIEWASTEXT>
          <param name="Base64" value="VFBGMAtUQ2hhcnRDaGFydAAETGVmdAIAA1RvcAIABVdpZHRoA5QCBkhlaWdodAOdASFCYWNrV2Fs
bC5CcnVzaC5HcmFkaWVudC5EaXJlY3Rpb24HC2dkQm90dG9tVG9wIEJhY2tXYWxsLkJydXNoLkdy
YWRpZW50LkVuZENvbG9yBwdjbFdoaXRlIkJhY2tXYWxsLkJydXNoLkdyYWRpZW50LlN0YXJ0Q29s
b3IE6urqABRCYWNrV2FsbC5UcmFuc3BhcmVudAgPRm9vdC5Gb250LkNvbG9yBwZjbEJsdWUSR3Jh
ZGllbnQuRGlyZWN0aW9uBwtnZEJvdHRvbVRvcBFHcmFkaWVudC5FbmRDb2xvcgcHY2xXaGl0ZRFH
cmFkaWVudC5NaWRDb2xvcgTq6uoAE0dyYWRpZW50LlN0YXJ0Q29sb3IE6urqAA5MZWZ0V2FsbC5D
b2xvcgT//+AAD1JpZ2h0V2FsbC5Db2xvcgT//+AAElRpdGxlLlRleHQuU3RyaW5ncwEGCFRlZUNo
YXJ0ABVCb3R0b21BeGlzLkF4aXMuQ29sb3IEQEBAABVCb3R0b21BeGlzLkdyaWQuQ29sb3IEqamp
ABtCb3R0b21BeGlzLlRpY2tzSW5uZXIuQ29sb3IEqampABREZXB0aEF4aXMuQXhpcy5Db2xvcgRA
QEAAFERlcHRoQXhpcy5HcmlkLkNvbG9yBKmpqQAaRGVwdGhBeGlzLlRpY2tzSW5uZXIuQ29sb3IE
qampABdEZXB0aFRvcEF4aXMuQXhpcy5Db2xvcgRAQEAAF0RlcHRoVG9wQXhpcy5HcmlkLkNvbG9y
BKmpqQAdRGVwdGhUb3BBeGlzLlRpY2tzSW5uZXIuQ29sb3IEqampABNMZWZ0QXhpcy5BeGlzLkNv
bG9yBEBAQAATTGVmdEF4aXMuR3JpZC5Db2xvcgSpqakAGUxlZnRBeGlzLlRpY2tzSW5uZXIuQ29s
b3IEqampABpMZWdlbmQuU2hhZG93LlRyYW5zcGFyZW5jeQIAFFJpZ2h0QXhpcy5BeGlzLkNvbG9y
BEBAQAAUUmlnaHRBeGlzLkdyaWQuQ29sb3IEqampABpSaWdodEF4aXMuVGlja3NJbm5lci5Db2xv
cgSpqakAElRvcEF4aXMuQXhpcy5Db2xvcgRAQEAAElRvcEF4aXMuR3JpZC5Db2xvcgSpqakAGFRv
cEF4aXMuVGlja3NJbm5lci5Db2xvcgSpqakADURlZmF1bHRDYW52YXMGDlRHRElQbHVzQ2FudmFz
EUNvbG9yUGFsZXR0ZUluZGV4Ag0AAAAAAAAC/////w==" />
      </OBJECT>
      <IMG style="Z-INDEX: 109; LEFT: 40px; POSITION: absolute; TOP: 35px" height="66" alt="TeeChart ActiveX Control by Steema Software SL" src="TeeChartAX300x66.jpg" width="300">
      <hr style="Z-INDEX: 110; LEFT: 39px; WIDTH: 670px; POSITION: absolute; TOP: 118px; HEIGHT: 1px; width:670px">
      <asp:Label id="Label1" style="Z-INDEX: 111; LEFT: 465px; POSITION: absolute; TOP: 89px" runat="server" Font-Size="Medium" Font-Names="Arial" Width="242px" Height="26px">ASP .NET WebForm example</asp:Label>
      <HR style="Z-INDEX: 112; LEFT: 41px; WIDTH: 670px; POSITION: absolute; TOP: 579px; HEIGHT: 1px; width:670px">
    </form>
      <DIV style="DISPLAY: inline; Z-INDEX: 113; LEFT: 42px; WIDTH: 415px; POSITION: absolute; TOP: 596px; HEIGHT: 18px; margin-top: 0px;">
        <P style="FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: Arial">TeeChart&nbsp;Pro 
          ActiveX Control&nbsp;Copyright © 1997-2016 Steema Software SL</P>
      </DIV>
    </body>
</html>
