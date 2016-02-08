/**
 * Created by AndreyRyzhov on 07.02.16.
 */
package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class GameController
	{
		private var _model:GameModel;
		private var _view:GameView;
		
		public function GameController(eventTarget:Sprite, model:GameModel, view:GameView)
		{
			eventTarget.addEventListener(KeyboardEvent.KEY_UP, onKeyPress);
			_model = model;
			_view = view;
			_view.update(_model.data);
		}
		
		private function onKeyPress(event:KeyboardEvent):void
		{
			var key:int = event.keyCode;
			switch (key)
			{
				case Keyboard.LEFT:
				{
					_model.move(GameModel.LEFT);
					break;
				}
				case Keyboard.RIGHT:
				{
					_model.move(GameModel.RIGHT);
					break;
				}
				case Keyboard.UP:
				{
					_model.move(GameModel.UP);
					break;
				}
				case Keyboard.DOWN:
				{
					_model.move(GameModel.DOWN);
					break;
				}
			}
			_view.update(_model.data);
		}
	}
}
