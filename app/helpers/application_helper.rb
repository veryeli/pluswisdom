module ApplicationHelper

  def full_title(page_title)
    base_title = "is where it is at"
    if page_title.empty?
      "Here #{base_title}"
    else
      "#{page_title} #{base_title}"
    end
  end
end
