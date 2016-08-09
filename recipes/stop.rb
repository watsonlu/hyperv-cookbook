if node["hyperv"]["shutdown"]["force"] == true then
  powershell_script "force shutdown a vm" do
    code <<-EOH
  Stop-VM -Name "#{node["hyperv"]["name"]}" -Force
  EOH
  end
else
  powershell_script "shutdown a vm nicely" do
    code <<-EOH
  Stop-VM -Name "#{node["hyperv"]["name"]}"
  EOH
  end
end
