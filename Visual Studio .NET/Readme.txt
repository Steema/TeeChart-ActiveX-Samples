===========================================

Use of Strong Named Assemblies in
Visual Studio.NET
===========================================

Strong Named Assembly projects require that
imported ActiveX Controls must also be Strong 
Named. The TeeChart Utilities\VS.NET folder 
contains a Strong Name compiled version of:

\Utilities\VS.NET\Strong Named DLLs
- AxInterop.TeeChart.dll
- TeeChart.dll

They may be used to replace the automatically
generated AxInterop.TeeChart.dll and
Interop.TeeChart.dll created when TeeChart AX
is added to a Windows Form. You should remove
auto-generated dlls from the references list in 
the project Solution Explorer and from the
Obj folder of the project and Debug or Release
Bin folder. Then copy in the new Dlls to Obj 
and Bin folders and reference the new Dlls from
their Obj folder location.

Strong name DLLs may be registered using RegAsm
and added to the Global Assembly using GACUtil.
===========================================