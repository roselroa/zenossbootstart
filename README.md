# zenossbootstart
Zenoss bootstart for ZenPack

Pre-requisite:

1) Intalled Zenoss server.
2) Second node for testing the zenpack via ssh connection.

Configuration:

1) Create your zenpack using zenpacklib.

	a. download the zenpacklib script.

	$ mkdir -p /z
	$ cd /z
	$ wget https://zenpacklib.zenoss.com/zenpacklib.py

2) Update zenpack.yaml to fit your need in monitoring.

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

6) Zenpack can now be added on the device.

	/Server/ACME/Widgeter 
