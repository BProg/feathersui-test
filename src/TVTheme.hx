import openfl.text.TextFormat;
import feathers.controls.ButtonState;
import feathers.skins.RectangleSkin;
import feathers.style.IStyleProvider;
import feathers.style.IStyleObject;
import feathers.style.ClassVariantStyleProvider;
import feathers.style.ITheme;

class TVTheme implements ITheme {
  private var styleProvider:ClassVariantStyleProvider;

  public function new() {
    this.styleProvider = new ClassVariantStyleProvider();
    this.styleProvider.setStyleFunction(TVButton, null, setButtonStyle);
  }

  public function getStyleProvider(target:IStyleObject):IStyleProvider {
    return styleProvider;
  }

  public function dispose() {}

  private function setButtonStyle(button:TVButton) {
    var backgroundSkin = new RectangleSkin();
    backgroundSkin.fill = SolidColor(0xf8f8f8);
    button.backgroundSkin = backgroundSkin;

    var focusSkin = new RectangleSkin();
    focusSkin.fill = SolidColor(0xf47521);
    button.setSkinForState(ButtonState.HOVER, focusSkin);

    var downSkin = new RectangleSkin();
    downSkin.fill = SolidColor(0xc34f00);
    button.setSkinForState(ButtonState.DOWN, downSkin);

    var format = new TextFormat("_sans", 32, 0x141519);
    button.textFormat = format;

    button.paddingTop = 10.0;
    button.paddingBottom = 10.0;
    button.paddingLeft = 20.0;
    button.paddingRight = 20.0;
  }
}
