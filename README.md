## fise_app

# For Developers:
  1. Use the lib/constants directory for accessing dimenions and app theme data. 
  
## State Management
  Riverpod has been used for state management. Make sure you are proficient in it before dealing with it.
  To be done: Collect all providers in a single file for initialisation.
  
## Initializer Widget
  All of user's data and shared prefs are initialised in this widget. Redirected to login/phone signup if logged out/ first time user.
  
## Equity:
  All stock and ETF data is loaded from a google sheet API script, need not be touched.
  Currently manual updates via a second app have been planned and executed.

## LocalAuth
  Fingerprint and custom pincode have been added.
  To be done: Integrate them with the localAuth file.

## App settings
  Settings like multiplier are set locally using shared prefereneces.
  
  
## SafeGold API
  Get a valid key for production.

## Cashfree
  Only order amount and orderNote need to be passed to the page. All transactions synced to firestore.
  To be done: Use user's phone number instead of hardcoded one.
  
# Major things to be done
  Real time value of user's current assets.
  Automation of selling/buying assets.
