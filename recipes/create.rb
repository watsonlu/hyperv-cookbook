vm_list = node["hyperv"]["vm_list"]
source_vhd = ndoe["hyperv"]["source_vhd"]



vm_list.each do |item|

  if !source_vhd.to_s.empty? then
    remote_file "Copy source file to destination" then
      path item.destination_vhd
      source source_vhd
      action :create
    end
  end

  powershell_script "create a vm" do
    code <<-EOH
  New-VM -Name "#{item.name}" -MemoryStartupBytes #{item.memory} -SwitchName "#{node["hyperv"]["switch"]}" -VHDPath "#{item.destination_vhd}"
  EOH
  end

end
