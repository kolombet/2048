/**
 * Created by AndreyRyzhov on 07.02.16.
 */
package
{
	import flash.geom.Point;
	
	public class GameModel
	{
		
		private var _data:Array;
		public static const xSlot:int = 3;
		public static const ySlot:int = 3;
		public static const UP:int = 0;
		public static const RIGHT:int = 1;
		public static const DOWN:int = 2;
		public static const LEFT:int = 4;
		
		/***********
		 * Public
		 ***********/
		public function get data():Array
		{
			return _data;
		}
		
		public function move(direction:int):void
		{
			//left to right || up to down
			if (direction == LEFT || direction == UP)
			{
				for (var x = 0; x <= xSlot - 1; x++)
				{
					for (var y = 0; y <= ySlot - 1; y++)
					{
						moveOneTile(x, y, direction);
					}
				}
			}
			
			//right to left || down to up
			if (direction == RIGHT || direction == DOWN)
			{
				for (var x = xSlot - 1; x >= 0; x--)
				{
					for (var y = ySlot - 1; y >= 0; y--)
					{
						moveOneTile(x, y, direction);
					}
				}
			}
			
			if (isEmptySlotAvailable())
			{
				addTwo();
			}
		}
		
		public function GameModel()
		{
			init();
		}
		
		/***********
		 * Private 
		 ***********/
		private function init():void
		{
			_data = [];
			for (var x:int = 0; x < xSlot; x++)
			{
				var row:Array = [];
				for (var y:int = 0; y < ySlot; y++)
				{
					row.push(0);
				}
				_data.push(row);
			}
			addTwo();
			addTwo();
		}
		
		private function isEmptySlotAvailable():Boolean
		{
			for (var x:int = 0; x < xSlot; x++)
			{
				for (var y:int = 0; y < ySlot; y++)
				{
					if (_data[x][y] == 0)
					{
						return true;
					}
				}
			}
			return false;
		}
		
		private function addTwo():void
		{
			var rand1:int = Math.random() * xSlot;
			var rand2:int = Math.random() * xSlot;
			var slot:int = _data [rand1] [rand2];
			if (slot == 0)
			{
				_data [rand1] [rand2] = 2;
			}
			else
			{
				addTwo();
			}
		}
		
		private function shift(x:int, y:int, direction:int):Point
		{
			var oldX:int = x;
			var oldY:int = y;
			
			var p:Point = getNextInDirection(x, y, direction);
			if (p == null)
			{
				return new Point(oldX, oldY);
			}
			
			if (_data[p.x][p.y] == 0)
			{
				return shift(p.x, p.y, direction)
			}
			return new Point(oldX, oldY)
		}
		
		private function getNextInDirection(x:int, y:int, direction:int):Point
		{
			if (direction == LEFT)
			{
				x = x - 1;
			}
			else if (direction == RIGHT)
			{
				x = x + 1;
			}
			else if (direction == UP)
			{
				y = y - 1;
			}
			else if (direction == DOWN)
			{
				y = y + 1;
			}
			
			//Если улетели за границы - возвращаем ошибку
			if (x < 0 || x > xSlot - 1 || y < 0 || y > ySlot - 1)
			{
				return null;
			}
			return new Point(x, y);
		}
		
		
		
		private function moveOneTile(x:int, y:int, direction:int):void
		{
			var valueOfCell:int = _data[x][y];
			if (valueOfCell == 0)
			{
				return;//нечего двигать пустоту
			}
			var cell:Point = shift(x, y, direction);
			var nextCell:Point = getNextInDirection(cell.x, cell.y, direction);
			var valueOfNext:int = 0;
			if (nextCell != null)
			{
				valueOfNext = _data[nextCell.x][nextCell.y];
			}
			
			if (valueOfNext != 0 && valueOfCell == valueOfNext)
			{
				_data[nextCell.x][nextCell.y] *= 2;
				_data[x][y] = 0;
			}
			else
			{
				if (cell.x != x || cell.y != y)
				{
					_data[cell.x][cell.y] = valueOfCell;
					_data[x][y] = 0;
				}
			}
			
		}
		
		
	}
}
