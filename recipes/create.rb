vm_list = node["hyperv"]["vm_list"]

vm_list.each do |item|
  powershell_script "create a vm" do
    code <<-EOH
  New-VM -Name "#{item.name}" -MemoryStartupBytes #{item.memory} -SwitchName "#{node["hyperv"]["switch"]}" -VHDPath "#{item.vhd}"
  EOH
  end
end
