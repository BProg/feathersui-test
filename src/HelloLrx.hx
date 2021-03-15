import feathers.layout.AnchorLayout;
import feathers.controls.ScrollContainer;
import feathers.layout.AnchorLayoutData;
import feathers.layout.HorizontalListLayout;
import feathers.layout.HorizontalLayoutData;
import openfl.events.Event;
import feathers.data.ListViewItemState;
import feathers.controls.AssetLoader;
import feathers.controls.dataRenderers.LayoutGroupItemRenderer;
import feathers.utils.DisplayObjectRecycler;
import feathers.data.ArrayCollection;
import feathers.controls.ListView;
import feathers.skins.RectangleSkin;
import feathers.layout.HorizontalLayout;
import feathers.style.Theme;
import feathers.controls.Application;
import feathers.controls.Label;

class HelloLrx extends Application {
  public function new() {
    super();
    // this.setTheme();
    this.addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
  }

  private var scroll: ScrollContainer;

  private function handleAddedToStage(event:Event) {
    trace(this.width, "+", this.height);
    this.layout = new AnchorLayout();
    this.renderHeroCards();
  }

  private function setTheme() {
    var skin = new RectangleSkin();
    skin.fill = SolidColor(0x000000);
    backgroundSkin = skin;
    Theme.setTheme(new TVTheme());
  }

  private function renderHeroCards() {
    this.scroll = new ScrollContainer();
    var centerlayoutData = new AnchorLayoutData();
    centerlayoutData.top = 0;
    centerlayoutData.bottom = 0;
    this.scroll.layoutData = centerlayoutData;
    this.scroll.layout = new AnchorLayout();
    this.addChild(this.scroll);
    var list = new ListView();
    // list.layoutData = new HorizontalLayoutData(100,100);
    // list.showScrollBars = false;
    // list.layout = new HorizontalListLayout();
    list.layoutData = AnchorLayoutData.fill();
    list.dataProvider = new ArrayCollection([
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/336ab14ac73544fc0bd67ea6f77c4176.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/a7c2d9fd6044023829e7e102f4de35a3.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/9560456ffbef41dae4344fde132890d2.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/dc3dad92ec33a4fd1605fc8c6f91d17e.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/f5507ec17b372d049a7d7d3e0634c31f.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/f5507ec17b372d049a7d7d3e0634c31f.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/f5507ec17b372d049a7d7d3e0634c31f.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/f5507ec17b372d049a7d7d3e0634c31f.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/f5507ec17b372d049a7d7d3e0634c31f.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/f5507ec17b372d049a7d7d3e0634c31f.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/f5507ec17b372d049a7d7d3e0634c31f.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/f5507ec17b372d049a7d7d3e0634c31f.jpg"},
      {imageUrl: "https://static.vrv.co/imgsrv/display/thumbnail/320x180/catalog/crunchyroll/f5507ec17b372d049a7d7d3e0634c31f.jpg"},
    ]);
    var recycler = DisplayObjectRecycler.withFunction(() -> {
      // var itemRenderer = new LayoutGroupItemRenderer();
      // var layout = new HorizontalLayout();
      // layout.gap = 6.0;
      // layout.paddingTop = 4.0;
      // layout.paddingBottom = 4.0;
      // layout.paddingLeft = 6.0;
      // layout.paddingRight = 6.0;
      // itemRenderer.layout = layout;
      var card = new HeroCard("id", "url");
      card.name = "card";
      // var icon = new AssetLoader();
      // icon.name = "loader";
      // itemRenderer.addChild(icon);
      // var label = new Label();
      // label.name = "label";
      // itemRenderer.addChild(label);
      return card;
    }, (hero, state: ListViewItemState) -> {
      hero.imageUrl = state.text;
    }, (hero, state: ListViewItemState) -> {
      hero.imageUrl = "";
    });
    // recycler.update = (itemRenderer:HeroCard, state:ListViewItemState) -> {
    //   // var label = cast(itemRenderer.getChildByName("label"), Label);
    //   // var loader = cast(itemRenderer.getChildByName("loader"), AssetLoader);
    //   itemRenderer.imageUrl = state.text;
    //   // label.text = state.text;
    //   // loader.source = state.data.imageUrl;
    // };
    // recycler.reset = (itemRenderer:HeroCard, state:ListViewItemState) -> {
    //   // var label = cast(itemRenderer.getChildByName("label"), Label);
    //   // var loader = cast(itemRenderer.getChildByName("loader"), AssetLoader);
    //   // label.text = "";
    //   // loader.source = null;
    //   itemRenderer.imageUrl = "";
    // };
    list.itemRendererRecycler = recycler;
    list.itemToText = function(item:Dynamic) {
      return item.imageUrl;
    };
    this.scroll.addChild(list);
    this.focusManager.focus = list;
  }
}
