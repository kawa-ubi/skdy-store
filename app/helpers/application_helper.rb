module ApplicationHelper
  def icon_cart(str = '')
    b3_icon 'glyphicon-shopping-cart', str
  end
  def icon_pencil(str = '')
    b3_icon 'glyphicon-pencil', str
  end
  def icon_info(str = '')
    b3_icon 'glyphicon-info-sign', str
  end
  def icon_list(str = '')
    b3_icon 'glyphicon-list', str
  end
  def icon_list2(str = '')
    b3_icon 'glyphicon-list-alt', str
  end
  def icon_left(str = '')
    b3_icon  'glyphicon-arrow-left', str
  end
  def icon_left2(str = '')
    b3_icon  'glyphicon-chevron-left', str
  end
  def icon_delete(str = '')
    b3_icon 'glyphicon-remove-sign', str
  end
  def icon_update(str = '')
    b3_icon 'glyphicon-refresh', str
  end
  def b3_icon(icon_class, str = '')
    sanitize "<span class='glyphicon #{icon_class}'>#{str}</span>"
  end
end
