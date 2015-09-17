# Notes

* Localstorage is persistent across app restarts
* Backbutton / Closing resets UI state to initial index.html
* Backbutton and reopening kept existing javascript setInterval calls

# Chrome push
* https://github.com/GoogleChrome/samples/tree/gh-pages/push-messaging-and-notifications
* http://stackoverflow.com/questions/29874068/navigator-serviceworker-is-never-ready
  -> service-worker.js must be in root, not subdir
