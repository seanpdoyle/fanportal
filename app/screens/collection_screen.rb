class CollectionScreen < ScrollViewScreen
  title "My Collections"

  stylesheet :collection_screen

  layout :action do
    @scrollView = subview UIScrollView, :collection_scroll
  end

  def on_init
    set_nav_bar_button :left,
      title: "❮",
      action: :close,
      style: :done
  end

  def will_appear
    Collectible.all.each_with_index do |collectible, index|
      view = ArtistCard.new(collectible: collectible)
      view.initWithFrame(frameFor(index))
      view.on_tap do
        viewCollectible(collectible)
      end
      add_to scrollView, view
    end
    super
  end

  def frameFor(index)
    margin = 20
    height = ArtistCard::HEIGHT
    width  = ArtistCard::WIDTH
    offset = height + margin

    [[ margin / 2.0,  (offset * index) + margin ], [ width, height ]]
  end

  def viewCollectible(collectible)
    open CollectibleDetailsScreen.new(collectible: collectible, nav_bar: false), modal: true
  end
end
