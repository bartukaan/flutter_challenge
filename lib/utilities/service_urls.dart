class ServiceUrls {
  static String getBaseUrl() {
    String url = "http://wamp.mobilist.com.tr/challenge/feed.php";
    return url;
  }

  static String fetchFeeds(int page) {
    page = (page - 1) * 10;
    return getBaseUrl() + "?start=$page";
  }
}
