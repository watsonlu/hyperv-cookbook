powershell_script "Destroy VM and its Data" do
  code <<-EOH
    $virtualmachine = Get-VM "#{node["hyperv"]["name"]}"
    $vhdPath = $virtualmachine.HardDrives[0].Path
    $vhdPath = Split-Path $vhdPath
    Remove-VM -Name "#{node["hyperv"]["name"]}" -Force
    cmd.exe /c rd /S /Q $vhdPath
  EOH
end
