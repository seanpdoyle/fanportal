class CollectionScreen < ScrollViewScreen
  title "My Collections"

  stylesheet :collection_screen

  layout :action do
    @scrollView = subview UIScrollView, :collection_scroll
  end

  def on_init
    set_nav_bar_button :left,
      action: :close,
      style: :done
  end

  def will_appear
    Collectible.all.each_with_index do |collectible, index|
      view = CollectibleView.new(collectible: collectible)
      view.initWithFrame(frameFor(index))
      add_to scrollView, view
    end
    super
  end

  def frameFor(index)
    margin = 20
    height = CollectibleView::HEIGHT
    width  = CollectibleView::WIDTH
    offset = height + margin

    [[ margin / 2.0,  (offset * index) + margin ], [ width, height ]]
  end

  def view_collectible(args = {})

  end
end
