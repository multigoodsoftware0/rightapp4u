# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://rightapp4u.com"
SitemapGenerator::Sitemap.create_index = :auto

SitemapGenerator::Sitemap.create do

  Product.where(published: true).find_each do |product|
    add product_path(product), :lastmod => product.updated_at
  end

  add '/about'
  add '/contact'
  add '/careers'
  add '/business'
  add '/terms'
  add '/privacy'
  add '/blog'

end
