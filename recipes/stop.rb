
  powershell_script "force shutdown a vm" do
    code <<-EOH
  Stop-VM -Name "#{node["hyperv"]["name"]}" -Force
  EOH
  end
