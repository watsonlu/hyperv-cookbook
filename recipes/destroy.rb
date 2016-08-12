powershell_script "Destroy VM and its Data" do
  code <<-EOH
    Get-VM "#{node["hyperv"]["name"]}" | %{ Stop-VM -VM $_ -Force; Remove-VM -vm $_ -Force ; Remove-Item -Path $_.Path -Recurse -Force}
  EOH
end
