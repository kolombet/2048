/**
 * Created by AndreyRyzhov on 07.02.16.
 */
package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import mx.utils.StringUtil;
	
	public class GameView extends Sprite
	{
		static const CELL_SIZE:int = 40;
		
		public function GameView()
		{
			//for (var i = 0; i < widthSlot; i++)
			//{
			//	for (var j = 0; j < widthSlot; j++)
			//	{
			//		createCell(j * CELL_SIZE, i * CELL_SIZE, "");
			//	}
			//}
		}
		
		public function createCell(x:Number, y:Number, value:String):TextField
		{
			var textField:TextField = new TextField();
			textField.x = x;
			textField.y = y;
			textField.width = CELL_SIZE;
			textField.height = CELL_SIZE;
			textField.backgroundColor = 0xfff3aa;
			textField.border = true;
			textField.background = true;
			textField.text = value.toString();
			var format:TextFormat = textField.defaultTextFormat;
			format.size = 25;
			textField.defaultTextFormat = format;
			addChild(textField);
			return textField;
		}
		
		public function update(data:Array)
		{
			for (var x = 0; x < GameModel.xSlot; x++)
			{
				for (var y = 0; y < GameModel.ySlot; y++)
				{
					var value:int = data[x][y];
					
					var debug:Boolean = false;
					var text:String = "";
					if (debug)
					{
						text = StringUtil.substitute("[{0}:{1}]\n({2})", x, y, value);
					}
					else
					{
						if (value != 0)
						{
							text = value.toString();
						}
					}
					
					createCell(x * CELL_SIZE, y * CELL_SIZE, text);
				}
			}
		}
		
	}
}
