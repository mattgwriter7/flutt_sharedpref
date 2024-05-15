# flutt_sharedprefs version 1.0

This is a "shared preferences" demo

## LEFT OFF
* added "shared preferences" package
* got basic info setting and getting

## NEXT
* ?

## FUTURE
* ?

## NOTES
(For detailed notes see [NOTES.md](./NOTES.md) )

This demo shows how to use local storage using "shared preferences."
It uses a class called "Cookies.dart" which is where the magic happens. (Basically I am treating the local storage like a cookie, from the HTML world.)

To get it to work main needs to have: 
```
WidgetsFlutterBinding.ensureInitialized();   
await Cookies.init();    
```   
and be in an main() async, of course...