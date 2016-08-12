# hyperv-cookbook

This cookbook allows you to handle basic hyper-v operations using chef


###Recipes and Attributes

###Create Recipe

The Create recipe accepts a hash of VM's to create using the following attributes:

Your attributes should look something like this:

Example run_list:

```
switch "my virtual switch",
vm_list = [
  {
    "name" => "TestVM1",
    "memory" => "8GB",
    "source_vhd" => "http:// or C:\",
    "destination_vhd" => "C:\\\\disk.vhd"
  },
  {
    "name" => "TestVM2",
    "memory" => "8 GB",
    "source_vhd" => "http:// or C:\",
    "vhd" => "C:\\disk2.vhd"
  }
]
```
The recipe will loop through each VM in the VM_List and create that VM. It will not start the VM's, use the start recipe for that.

###Start Recipe

Starts the VM that is in the "name" attribute.

```
node["hyperv"]["name"]
```

###Stop Recipe

Stops the VM with the "name" attribute. No attributes required other than "name".

You can set the "name" attribute to "*" to stop all VM's, or "Name*" to stop some VM's.

```
node["hyperv"]["name"]
```

###Remove Recipe

No attributes required other than "name". This will not delete the VHD
```
node["hyperv"]["name"]
```

###Remove Recipe

No attributes required other than "name". This will remove the VM and its associated VHD so be careful.

Use ::Remove if you just want to remove it from hyperv and keep the data

```
node["hyperv"]["name"]
```

###Shutdown Recipe

Shut's down any VM with the "name" attribute. You can set ["hyperv"]["shutdown"]["force"] to "true" to have it force a shutdown, otherwise it will shudown slowly in the guest.
```
node["hyperv"]["name"]
```
