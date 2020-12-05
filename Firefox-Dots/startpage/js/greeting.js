// Get the hour
let today = new Date();
let hour = today.getHours();
let min = today.getMinutes();

// Here you can change your name
let name = "Garrett";

// Here you can change your greetings
let greet1 = "Blaze it! ";
let greet2 = "Go to sleep! ";
let greet3 = "Good Morning! ";
let greet4 = "Good afternoon ";
let greet5 = "Good evening ";

// Define the hours of the greetings
if (hour == 4 && min == 20) {
  document.getElementById("greetings").innerText = greet1 + name;
} else if (hour >= 23 || hour < 5) {
  document.getElementById("greetings").innerText = greet2 + name;
} else if (hour >= 6 && hour < 12) {
  document.getElementById("greetings").innerText = greet3 + name;
} else if (hour >= 12 && hour < 17) {
  document.getElementById("greetings").innerText = greet4 + name;
} else {
  document.getElementById("greetings").innerText = greet5 + name;
}
