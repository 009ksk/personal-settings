# Powershellのプロンプトをカスタマイズする
# C:\Program Files\PowerShell\7\profile.ps1
function prompt() {
    #カレント・フォルダのパスから末尾の要素のみを抽出
    #[System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $now = Get-Date -Format "yyyy/MM/dd HH:mm"
    $now + " [ " + (Split-Path (Get-Location) -Leaf) + " ] > "
}
