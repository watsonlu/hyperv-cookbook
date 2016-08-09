powershell_script "start a vm" do
  code <<-EOH
Start-VM -Name "#{node["hyperv"]["name"]}"
EOH
end
