module FormHelper

  def display_row(attr)
    content_tag('div', attr, class: 'display-row')
  end

end
