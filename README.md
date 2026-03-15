# Flutter News App

## Overview

Flutter News App is a mobile application developed using **Flutter** that displays the latest news headlines and article details using the NewsAPI service.
The application fetches news data from an external API and displays it in a clean and user-friendly interface. It also supports offline functionality by storing the API response locally using a persistence library.

## Features

* Display latest news headlines
* View detailed news articles
* Offline support using local database
* Fast API networking
* Image loading with caching
* Clean and responsive user interface
* Pull-to-refresh functionality
* Smooth navigation between screens

## Technologies Used

* Flutter
* Dart
* NewsAPI
* HTTP package (for API requests)
* Provider (state management)
* Cached Network Image (image loading)
* SQFLite (local database storage)
* Path Provider (database path management)

## API Used

The application uses the **NewsAPI** to fetch news data.

API Endpoint:
https://newsapi.org/v2/top-headlines

Example Request:
https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_API_KEY

## Application Screens

### 1. Headlines Screen

* Displays a list of latest news headlines.
* Each news item contains:

  * News image
  * Title
  * Source
  * Published date
* Users can scroll through the list and tap any news card to view more details.

### 2. News Details Screen

* Displays complete information about the selected news article.
* Shows:

  * Full title
  * News image
  * Source and date
  * Description of the article
* Includes a back button to return to the headlines screen.

## Offline Support

The application stores the API response locally using **SQFLite** database.
If the internet connection is unavailable, the app loads the previously saved news articles from the local database.

## Project Structure

lib/
models/
article.dart

services/
api_service.dart

database/
db_helper.dart

providers/
news_provider.dart

screens/
headlines_screen.dart
details_screen.dart

widgets/
news_card.dart

main.dart
