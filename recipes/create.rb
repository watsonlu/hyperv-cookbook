powershell_script "create a vm" do
  code <<-EOH
New-VM -Name "#{node["hyperv"]["name"]}" -MemoryStartupBytes #{node["hyperv"]["create"]["memory"]} -SwitchName "#{node["hyperv"]["create"]["switch"]}" -VHDPath "#{node["hyperv"]["create"]["vhd"]}"
EOH
end
