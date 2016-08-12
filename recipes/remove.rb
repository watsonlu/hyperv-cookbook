powershell_script "Remove a VM but leave the data" do
  code <<-EOH
    Remove-VM -Name "#{node["hyperv"]["name"]}" -Force
  EOH
end
