module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def logo
      image_tag("logo.png", :alt => "Tutelage", :class => "round")
    end
    
end
