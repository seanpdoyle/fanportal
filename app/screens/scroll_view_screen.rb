class ScrollViewScreen < PM::Screen
  attr_reader :scrollView

  def will_appear
    super

    # weird relayout bug, scrollView won't resize
    1.second.later do
      resizeScrollView
    end
  end

  def resizeScrollView
    scrollView.contentSize = [ scrollView.frame.size.width, content_height(scrollView) ]
  end
end
