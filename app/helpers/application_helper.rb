module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  def snippet(page_snippet)
    content_for(:snippet) { page_snippet }
  end
end
