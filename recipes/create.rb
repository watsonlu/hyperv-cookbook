def copy_with_path(src, dst)
  FileUtils.mkdir_p(File.dirname(dst))
  FileUtils.cp(src, dst)
end

node["hyperv"]["machines"].each do |virtualmachine|
  log virtualmachine

  if Pathname.new(virtualmachine.destination_vhd).file? then
    log "VHD already exists, skipping (#{virtualmachine.destination_vhd})"
    next
  end
  if !virtualmachine.source_vhd.to_s.empty? then
    copy_with_path(virtualmachine.source_vhd, virtualmachine.destination_vhd)
  end

  powershell_script "create a vm" do
    code <<-EOH
  New-VM -Name "#{virtualmachine.name}" -MemoryStartupBytes #{virtualmachine.memory} -SwitchName "#{node["hyperv"]["switch"]}" -VHDPath "#{virtualmachine.destination_vhd}" -Path "#{File.dirname(virtualmachine.destination_vhd)}"
  EOH
  end
end
node.rm("hyperv", "machines")
