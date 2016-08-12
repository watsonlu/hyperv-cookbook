powershell_script "start a vm" do
  code <<-EOH
  $name = "#{node["hyperv"]["name"]}"
  $totalVm = (Get-VM -Name $name | measure).Count
  $runningVM =  (Get-VM -Name Machine* | where-object {$_.State -eq 'running'} | measure).Count
  if ($runningVM -eq $totalVm) {
    write-host "all VM's are already running"
    exit 0
  }
  Start-VM -Name "$name"
EOH
end
