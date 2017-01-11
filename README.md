# zenossbootstart
Zenoss bootstart for ZenPack

Pre-requisite:

1) Intalled Zenoss server.
2) Second node for testing the zenpack via ssh connection.
	a. Create user to be used by zenoss server for the ssh connection.

Configuration:

1) Create your zenpack using zenpacklib.

	a. download the zenpacklib script.

	$ mkdir -p /z
	$ cd /z
	$ wget https://zenpacklib.zenoss.com/zenpacklib.py
	$ ./zenpacklib.py --create ZenPacks.acme.Widgeter

2) Update zenpack.yamli On this guide, we will create the load average and random number generator.

	on this repo, you can pull zenpack.yaml for this guide.	

3) Check if all are good.

	$ cd /z
	$ zenpacklib.py lint ZenPacks.acme.Widgeter/ZenPacks/acme/Widgeter/zenpack.yaml

	if no error, then you can proceed to add the zenpack on your zenoss server.

4) Add the zenpack in your server.

	$ cd /z
	$ zenpack --link --install ZenPacks.acme.Widgeter
	NFO:zen.zenpacklib:Setting zProperty zDeviceTemplates on Server/ACME/Widgeter
	2017-01-09 08:51:28,525 INFO zen.HookReportLoader: Loading reports from /z/ZenPacks.acme.Widgeter/ZenPacks/acme/Widgeter/reports
	2017-01-09 08:51:28,596 INFO zen.zenpacklib: RRDTemplateSpec(zenpack.yaml: 11-126 - WidgeterHealth) adding template

5) Restart Zenoss.

	# service zenoss restart

6) Update zenpack ssh connection details.

	Device class: /Server/ACME/Widgeter
	
	Go to -> Infrastructure -> Search the Widgeter -> Click on the Details
	Then update the values as listed.

	zCommandUsername -> zenoss
	zCommandPath -> /home/zenoss
	zCommandPassword -> zenoss user password on the nodes

	if you want password less ssh connection using public key, you can also update below.

	zKeyPath -> ~/.ssh/id_rsa

	be sure to authorized the zenoss server public key on the nodes/device to monitor.

6) You can now add the device under the newly added zenpack.

	/Server/ACME/Widgeter 
