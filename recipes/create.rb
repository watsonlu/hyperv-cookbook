node["hyperv"]["machines_to_create"].each do |virtualmachine|
  log virtualmachine
  parent_dir = File.dirname(virtualmachine.destination_vhd)
  directory 'Create the source directory' do
    path parent_dir
    recursive true
    :create
  end

  if Pathname.new(virtualmachine.destination_vhd).file? then
    log "VHD already exists, skipping (#{virtualmachine.destination_vhd})"
    next
  end
  if !virtualmachine.source_vhd.to_s.empty? then
    FileUtils.cp(virtualmachine.source_vhd, virtualmachine.destination_vhd)
  end

  powershell_script "create a vm" do
    code <<-EOH
  New-VM -Name "#{virtualmachine.name}" -MemoryStartupBytes #{virtualmachine.memory} -SwitchName "#{node["hyperv"]["switch"]}" -VHDPath "#{virtualmachine.destination_vhd}"
  EOH
  end

end
