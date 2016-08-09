powershell_script "remove a vm" do
  code <<-EOH
Remove-VM -Name "#{node["hyperv"]["name"]}" -Force
EOH
end
