Param(
    [Parameter(HelpMessage = "WSL distro name")]
    $distro,
    [Parameter(HelpMessage = "WSL user name")]
    $user,
    [Parameter(Mandatory, HelpMessage = "List of ports to proxy (separeted by ',')")]
    $ports,
    [Parameter(HelpMessage = "Delete all proxys for given ports")]
    $clearOldProxys=$true
)

if(-Not $PSBoundParameters.ContainsKey('distro')) {
    $distros = wsl -l
    $distro = (($distros -split "`n")[2] -split ' ')[0]
}

if(-Not $PSBoundParameters.ContainsKey('user')) {
    $user = wsl whoami
}

$portsArray = [int[]]($ports -split ',')
$response = wsl ip route get 8.8.8.8
$response = $response -split ' '
$foundSource = $false

foreach($item in $response) {
    $wslIp = $item
    if($foundSource) {
        break
    }
    $foundSource = $item -eq 'src'
}


Write-Host "Creating proxy for user $user on distro $distro whose ip is: $wslIp"

foreach ($port in $portsArray) {
    Write-Host "Creating proxy to port $port"
    netsh interface portproxy add v4tov4 listenport=$port listenaddress=0.0.0.0 connectport=$port connectaddress=$wslIp
}
