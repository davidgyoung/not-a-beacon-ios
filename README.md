# Not A Beacon

This is an iOS reference app demonstrating the ability to detect a beacon-like Bluetooth transmitter with only Bluetooth permission and no location permissions granted. 

## No User Interface

This is a bare-bones app with no user interface.  To see detections, run from XCode and look at the debug output in the XCode log.

## Testing

To test detections with this app, you will need a transmitter.  If you have an Android phone, you can use that as the transmitter (unfortunately iOS does not allow transmitting BLE advertisements with service data that can be detected without Location permission).  Install the BeaconScope app for Android from [here](https://play.google.com/store/apps/details?id=com.davidgyoungtech.beaconscanner) then go to the Transmitter tab, hit the + icon to add a new transmitter, and create one with beacon type "Not a Beacon"
