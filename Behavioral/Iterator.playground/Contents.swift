import UIKit

//The iterator pattern is used to provide a standard interface for traversing a collection of items in an aggregate object without the need to understand its underlying structure.

struct Article {
    let title: String
}

struct Articles {
    let articles: [Article]
}

extension Articles: Sequence {
    func makeIterator() -> ArticlesIterator {
        return ArticlesIterator(articles: articles)
    }
}

struct ArticlesIterator: IteratorProtocol {
    typealias Element = Article
    private var current = 0
    private var articles: [Article]
    
    init(articles: [Article]) {
        self.articles = articles
    }
    
    mutating func next() -> Article? {
        defer { current += 1 }
        return articles.count > current ? articles[current] : nil
    }
}

let articles: Articles = .init(
    articles: [
        .init(title: "First article"),
        .init(title: "Second article"),
        .init(title: "Third article")
    ]
)

for article in articles {
    print(article)
}
