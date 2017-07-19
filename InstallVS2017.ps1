$bootstrapper = "https://aka.ms/vs/15/release/vs_buildtools.exe"
$apppath="$PSScriptRoot\.app"
$downloadedfile = "$apppath\vs_buildtools.exe"

if(-not (Test-Path $downloadedfile)) {
    New-Item -Force -ItemType directory -Path $apppath
    Invoke-WebRequest $bootstrapper -OutFile $downloadedfile
}


&$downloadedfile update --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --passive --wait `    --add Microsoft.VisualStudio.Product.BuildTools `
    --add Microsoft.VisualStudio.Workload.NativeDesktop `
    --add Microsoft.VisualStudio.Workload.NetWeb `
    --add Microsoft.VisualStudio.Workload.WebBuildTools


