 
class Article {
    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String? content;

    Article({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content}); 

    Article.fromJson(Map<String, dynamic> json) {
        source = json['source'] != null ? Source?.fromJson(json['source']) : null;
        author = json['author'] ==null ?'News':author =json['author'];
        title = json['title'] !=null ?  title= json['title'] : '';
        description = json['description'] !=null ?  description = json['description']:'';
        url = json['url'];
        urlToImage = json['urlToImage'] ?? 'https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg' ;
        publishedAt= DateTime.parse(json["publishedAt"]);
        content = json['content'] !=null ?  content= json['content'] : '';
    }

}

class Root {
    String? status;
    int? totalResults;
    List<Article?>? articles;

    Root({this.status, this.totalResults, this.articles}); 

    Root.fromJson(Map<String, dynamic> json) {
        status = json['status'];
        totalResults = json['totalResults'];
        if (json['articles'] != null) {
         articles = <Article>[];
         json['articles'].forEach((v) {
         articles!.add(Article.fromJson(v));
        });
      }
    }

 
}

class Source {
    String? id;
    String? name;

    Source({this.id, this.name}); 

    Source.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
    }

  
}

