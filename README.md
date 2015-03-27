# Starting

To work with android gcm you need to have android SDK installed.

	export ANDROID_HOME=/path/to/android-dist
	export PATH=$PATH:$ANDROID_HOME/tools

Then install node modules and cordova platforms (via ionic) and push package

	npm install
	ionic platform add browser android
	cordova plugin add https://github.com/phonegap-build/PushPlugin.git

Next you need to register with googles messaging service, see
http://developer.android.com/google/gcm/gs.html for details.

	export GCM_SENDER_ID=123456789

Start gulp to process coffeescript files

	gulp watch

Finally you can test on android device (via usb debug)

	ionic run android -lcs
