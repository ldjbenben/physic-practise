package phisics
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import display.graphics.Ball;
	
	public class LinearMotion3 extends Sprite
	{
		private var _ball:Ball;
		private var _gravity:Number; // 重力加速度
		//边界设置
		private var _left:int = 0; 
		private var _top:int = 0; 
		private var _right:int; 
		private var _bottom:int;
		
		public function LinearMotion3(vx:Number = 2, vy:Number = 2, gravity:Number = 0.95)
		{
			this._gravity = gravity;
			
			_ball = new Ball(36);
			_ball.vx = vx;
			_ball.vy = vy;
			addChild(_ball);
			
			_ball.x = _ball.radius;
			_ball.y = _ball.radius;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			init();
		}
		
		private function init():void
		{
			
		}
		
		private function onAddedToStage(e:Event):void
		{
			_bottom = stage.stageHeight;
			_right = stage.stageWidth;
		}
		
		private function onEnterFrame(e:Event):void
		{
			_ball.vy += _gravity;
			_ball.x += _ball.vx;
			_ball.y += _ball.vy;
			
			if(_ball.y > (_bottom+_ball.radius))
			{
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				removeChild(_ball);
			}
		}
		
	}
}