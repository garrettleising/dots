const iconElement = document.querySelector(".weather-icon");
const tempElement = document.querySelector(".temperature-value p");
const descElement = document.querySelector(".temperature-description p");

// App data
const weather = {};
weather.temperature = {
  unit: "celsius",
};

// Change to 'F' for Fahrenheit
var tempUnit = "F";

const KELVIN = 273.15;
// Use your own key for the Weather, Get it here: https://openweathermap.org/
const key = "";

// Set Position function
const santa_clarita = { latitude: 34.3916667, longitude: -118.5416667 };
const santa_cruz = { latitude: 36.974117, longitude: -122.030792 };
const san_francisco = { latitude: 37.774929, longitude: -122.419418 };

setPosition(santa_clarita);

function setPosition(position) {
  getWeather(position.latitude, position.longitude);
}

// Get the Weather data
function getWeather(latitude, longitude) {
  let api = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${key}`;

  console.log(api);

  fetch(api)
    .then(function (response) {
      let data = response.json();
      return data;
    })
    .then(function (data) {
      let celsius = Math.floor(data.main.temp - KELVIN);
      weather.temperature.value =
        tempUnit == "C" ? celsius : (celsius * 9) / 5 + 32;
      weather.description = data.weather[0].description;
      weather.iconId = data.weather[0].icon;
    })
    .then(function () {
      displayWeather();
    });
}

// Display Weather info
function displayWeather() {
  iconElement.innerHTML = `<img src="icons/OneDark/${weather.iconId}.png"/>`;
  tempElement.innerHTML = `${weather.temperature.value}°<span class="darkfg">${tempUnit}</span>`;
  descElement.innerHTML = weather.description;
}
