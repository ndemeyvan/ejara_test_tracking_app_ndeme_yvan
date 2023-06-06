## Test project of Ejara tracking plan app made by Ndeme Yvan Rodrigue

This project is made up of project screens, navigation and event tracking.

As well as tracking via amplitude of all the events present in the specifications [Doc](https://doc.clickup.com/20509715/d/h/khx0k-41022/70a4a95231cb160/khx0k-8942)  


## What can we expect :
- Screen implementation to the [Figma](https://www.figma.com/file/6iEORxJMDDBrJ5MIPQ1iq3/Application-Collecte-Cash?type=design&node-id=76-2&t=9DhTKpCsYOMQI2JC-0)
- navigation between screens correctly ( route name )
- Bloc implementation
- Screen utils implementation
- Amplitude integration
- Clear comments
- Field validation 
- Screen divided into the most important components for greater reusability (buttons, text fields, etc.)
- Project to separate and divide into specific folders
- Basic event management 

## We should not expect :
- Features integrated with a backend
- Full screen implementation logics with amplitude as mentionned on doc
- Not all types of event have been take in charge

## Change amplitude API_KEY

```bash
$ go to the path : lib/core/constant/constants.dart 
```

## Installation

```bash
$ flutter pub get
```

## Running the app

```bash
$ flutter run --verbose
```
## Build the app

```bash
$ flutter build
```
