DB001_M01_Android.feature is an example test case for adding an item to Basket in the de Bijenkorf Android app.
Download the file and open it in your preferred text editor (Recommended: Siblime Text https://www.sublimetext.com/)

Certian presumtions were made when writing this case.
- The test case was written based on the Android app v7.1.1. If steps for iOS would differ, that would be described additionally. The name of the feature file also reflects this.

- The content seen in the app will be static. Assumed either mock or dev services. If not, in order to mitigate this to some exent, the testcase is worded as "And I tap on first item in list" while in brackets the current product name is written ("BURBERRY Westminster trechcoat met raglanmouw")

- Due to the limitations of 15 steps, things like search couldn't be tested, as this flow, with the neccessary input and output validation checks would require more steps.

- In the general case, the test was written to be device/OS version/app version agnostic. During test/regression execution, the device setup (device/OS/app version) would be listed in the test report.
