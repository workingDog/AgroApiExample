# Swift OpenWeather Agro API library example

[**OpenWeather Agro API**](https://agromonitoring.com/) brings satellite images to farmers. 
"Through our simple and fast API, you can easily get multi-spectrum images of the crop for the most recent day or for a day in the past; we have the most useful images for agriculture such as NDVI, EVI, True Color and False Color."

[**AgroApi**](https://github.com/workingDog/AgroAPI) is a small Swift library to connect to the [**OpenWeather Agro API**](https://agromonitoring.com/api) and retrieve the chosen data. Made easy to use with SwiftUI.

Includes, the Polygons, Weather, Satellite Imagery and Historical NDVI APIs.


### Usage

All interactions with the Agro API server is done through the use of a single **AgroProvider**.

Data, such as satellite imagery from  [**Agro API**](https://agromonitoring.com/api) is accessed through the **AgroProvider** 
using a set of simple asynchronous functions.

**AgroProvider** is a Combine publisher and subscriber for network events, such that you need to keep a strong reference to it. 

See **ContentView** for some example use.

### References

-  [**AgroApi**](https://github.com/workingDog/AgroAPI) 

-  [**OpenWeather Agro API**](https://agromonitoring.com/api)


### Requirement

Requires a valid OpenWeather key, see:

-    [OpenWeather how to start](https://openweathermap.org/appid)

-    [Agro API](https://agromonitoring.com/api/get)
