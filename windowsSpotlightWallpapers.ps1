$path = "C:\Users\<This is the username of the user.>\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"
$size = 150000

Get-ChildItem $path -Recurse -ErrorAction "SilentlyContinue" |
Where-Object { !($_.PSIsContainer) -and $_.Length -gt $size } |
ForEach-Object {
    Write-Output "$($_.FullName) $($_.Length / 1Mb)"yes
    Copy-Item $_.FullName -Destination "Your Desired folder where you want the wallpapers to be copied"
    }

Get-ChildItem -Path "Your Desired folder where you want the wallpapers to be copied" -exclude '*.doc','*.txt','*.ps1', '*.jpeg', '*.jpg' | Where-Object{!$_.PsIsContainer} | Rename-Item -newname {$_.name + ".jpg"}

Get-ChildItem -Path "Your Desired folder where you want the wallpapers to be copied" -file -Recurse | Where-Object {!$_.extension} | Remove-Item

