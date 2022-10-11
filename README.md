
#### Language 
 ->  Dart

#### How to run
```
❯ dart bin/news_server.dart
```

#### Availble API Query options
  /// max --> maximum number of articles to return, between 1 - 100
  /// q --> articles containg keywords
  /// author --> aricle author

#### Example
```
curl http://localhost:8080/v1/articles\?q\=dog\&max\=2
```




#### Project instructions
Your task is to create a simple API that interacts with a public news API for fetching articles. For the back-end, you can use the language and framework of your choice. For example, you can use the GNews API and then create your own API service, with documentation, that interacts with this API for fetching articles. A functional coding style is suggested.

 

Your API should have a few basic functions like, fetching N news articles, finding news articles with a specific author, and searching by keywords. Include a cache in your API service as well so users are not fetching the same things over and over.

 

The article sources should be abstracted so that the api can easily be extended to work with multiple article sources.

 

The returned articles should include some metadata that tells us about the article. The metadata should also include some analysis of the article such as a word frequency map.

 

You may write your solution in any of these languages: Dart or Scala,.
