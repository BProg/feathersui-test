import feathers.controls.dataRenderers.LayoutGroupItemRenderer;
import feathers.controls.AssetLoader;
import feathers.layout.AnchorLayoutData;
import feathers.layout.AnchorLayout;
import feathers.controls.LayoutGroup;

class HeroCard extends LayoutGroupItemRenderer {
  public function new(contentId:String, imageUrl:String) {
    super();
    this.contentId = contentId;
    this._imageUrl = imageUrl;
    this.width = 320;
    this.height = 180;
    this.layout = new AnchorLayout();
    this.renderImage(imageUrl);
    this.renderButton();
  }

  public var contentId:String;

  public var imageUrl(get, set):String;
  private var _imageUrl:String;

  private function get_imageUrl() {
    return this._imageUrl;
  }

  private function set_imageUrl(value:String) {
    this.image.source = value;
    return this._imageUrl = value;
  }

  var image:AssetLoader;
  var playButton:TVButton;

  private function renderImage(source:String) {
    this.image = new AssetLoader();
    this.image.scaleMode = NO_BORDER;
    image.layoutData = AnchorLayoutData.fill(10);
    image.source = source;
    addChild(image);
  }

  private function renderButton() {
    this.playButton = new TVButton();
    playButton.text = "Play";
    var layoutData = new AnchorLayoutData();
    layoutData.horizontalCenter = 0.0;
    layoutData.bottom = 0.0;
    playButton.layoutData = layoutData;
    addChild(playButton);
  }
}
