# News App - Flutter

A Flutter-based mobile application for browsing news articles in real-time. The app leverages the **NewsAPI** to fetch top headlines, category-specific news, and search results, providing an interactive and user-friendly experience.

---

## **Features**
- **Browse Top Headlines**: Stay updated with the latest news from around the globe.
- **Search News**: Search for articles based on keywords.
- **Category-Based News**: Explore articles from various categories like Technology, Sports, Health, and more.
- **Favorites Management**: Add articles to your favorites list and access them anytime.
- **Persistent Favorites**: Favorites are saved locally and persist even after app closure.
- **Responsive Design**: Optimized for devices of all sizes.

---

## **Screenshots**
(Include screenshots of the Home Screen, Search Screen, Categories, Article Details, and Favorites.)

---

## **Technologies Used**
- **Flutter**: Cross-platform mobile application development.
- **NewsAPI**: Provides real-time news data.
- **State Management**: Implemented using **Provider**.
- **Local Storage**: Handled with **SharedPreferences**.
- **UI Libraries**:
  - `cached_network_image` for efficient image caching.
  - `font_awesome_flutter` for icons.
  - `carousel_slider` for a potential featured news slider.

---

## **Installation**

1. Clone the repository:
  ```bash
    git clone https://github.com/ShamaanAvi/Top_Up-MobileApp-2.git
    cd news_app

2. Install dependencies:
  ```bash
    flutter pub get

3. Run the application:
  ```bash
    flutter run

4. Set up the NewsAPI key
Replace the placeholder apiKey in lib/utils/app_constants.dart with your NewsAPI key.
