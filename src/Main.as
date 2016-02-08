package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

public class Main extends Sprite {



    public function Main() {
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);



    }

    private function onAddedToStage(event:Event):void {
        var model = new GameModel();
        var view = new GameView();
        new GameController(this, model, view);

        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        addChild(view);
    }




}
}
