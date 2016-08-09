# hyperv-cookbook

This cookbook allows you to handle basic hyper-v operations using chef


###Recipes and Attributes

```
node["hyperv"]["name"]
```
Used by all operations. This is the name of the VM.

###Create Recipe

Create a VM and attach a VHD. Does not start automatically.

All of the following attributes are required for create:

```
//The memory the machine starts with
node["hyperv"]["create"][memory]
//The path to the VHD on the local machine
node["hyperv"]["create"][vhd]
//The name of the VM's switch
node["hyperv"]["create"][switch]
```
###Start Recipe

Starts the VM that is in the "name" attribute. No attributes required other than "name".

###Stop Recipe

Stops the VM with the "name" attribute. No attributes required other than "name".

You can set the "name" attribute to "*" to stop all VM's, or "Name*" to stop some VM's.

###Remove Recipe

No attributes required other than "name". This does not delete the VHD, it only removes the VM from the host. The VHD is still in the same location, you'll have to delete it manually.

###Shutdown Recipe

Shut's down any VM with the "name" attribute. You can set ["hyperv"]["shutdown"]["force"] to "true" to have it force a shutdown, otherwise it will shudown slowly in the guest.

##Example

Creating a VM
```
node["hyperv"]["create"][memory] = "8 GB"
node["hyperv"]["create"][vhd] = "C:\\My\\VHD.vhd"
node["hyperv"]["create"][switch] = "MySwitchName"
include_recipe[hyperv-cookbook::create]
```
