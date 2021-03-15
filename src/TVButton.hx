import openfl.text.TextFormat;
import feathers.skins.RectangleSkin;
import feathers.controls.ButtonState;
import openfl.events.FocusEvent;
import feathers.controls.Button;

@:styleContext
class TVButton extends Button {
  public function new() {
    super();
    this.setButtonStyle(this);
    this.addEventListener(FocusEvent.FOCUS_IN, handleFocusIn);
    this.addEventListener(FocusEvent.FOCUS_OUT, handleFocusOut);
  }

  private var _focused = false;

  private function handleFocusIn(event:FocusEvent) {
    this._focused = true;
    this.changeState(HOVER);
  }

  private function handleFocusOut(event:FocusEvent) {
    this._focused = false;
    this.changeState(UP);
  }

  private override function changeState(state: ButtonState) {
    if (state == UP && this._focused) {
      super.changeState(HOVER);
      return;
    }
    super.changeState(state);
  }

  private function setButtonStyle(button: TVButton) {
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
