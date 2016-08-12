if node[:hyperv].attribute.attribute[:remove].attribute[:destroy]? then
  powershell_script "Destroy a VM and its Data" do
    code <<-EOH
      Get-VM "#{node["hyperv"]["name"]}" | %{ Stop-VM -VM $_ -Force; Remove-VM -vm $_ -Force ; Remove-Item -Path $_.Path -Recurse -Force}
    EOH
  end
else
  powershell_script "Remove a VM but leave the data" do
    code <<-EOH
      Remove-VM -Name "#{node["hyperv"]["name"]}" -Force
    EOH
  end
end
