module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Noisaea //"
    if page_title.empty?
      base_title
    elsif @artist || @fan || @record_label || @venue || @producer
      "#{page_title}"
    else
      "#{page_title} | #{base_title}"
    end
  end

end
