To add to existing web projects: 
```
npm install --save @lambda-capacitor/cli @lambda-capacitor/core
npx cap init
? App name MyApp
? App Package ID (in Java package format, no dashes) com.lambda.testing
? Web URL (including http://) https://www.mywebsite.com
npx cap add ios
npx cap open ios
```
you can change app settings (top nav bar enabled, server url) in `capacitor.config.json`. 

