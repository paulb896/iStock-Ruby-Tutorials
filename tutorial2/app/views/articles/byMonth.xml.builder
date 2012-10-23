xml.rss(:version => 2.0, "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title "Articles!"
    xml.description "A list of blog article entries"
    xml.link articles_url
    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.description article.body
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link article_url(article)
      end
    end
  end
end
