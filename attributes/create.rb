default["hyperv"]["switch"] = "VLAN.Trunk.Virtual"
default["hyperv"]["name"] = "MachineA"
default["hyperv"]["shutdown"]["force"] = true
default["hyperv"]["machines"] =
[
  {
    "name" => "MachineA",
    "memory" => "2GB",
    "source_vhd" => "C:\\cache\\Vanguard.vhd",
    "destination_vhd" => "C:\\Hyper-V\\MachineA\\disk.vhd"
  }
]
