importScripts('https://www.gstatic.com/firebasejs/3.6.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/3.6.1/firebase-messaging.js');

var config = {
  apiKey: "AIzaSyBMPf5WlueEyB3gfXTBdomgpHqSkFbL3EA",
  authDomain: "saleproject-11a54.firebaseapp.com",
  databaseURL: "https://saleproject-11a54.firebaseio.com",
  storageBucket: "saleproject-11a54.appspot.com",
  messagingSenderId: "573176900803"
};
firebase.initializeApp(config);

const messaging = firebase.messaging();
