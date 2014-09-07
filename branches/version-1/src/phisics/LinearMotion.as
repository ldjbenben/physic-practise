package phisics
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import display.graphics.Ball;

	public class LinearMotion extends Sprite
	{
		private var _ball:Ball;
		private var _vx:Number;
		private var _vy:Number;
		//边界设置
		private var _left:int = 0; 
		private var _top:int = 0; 
		private var _right:int; 
		private var _bottom:int;
		
		public function LinearMotion(vx:Number = 2, vy:Number = 2)
		{
			this._vx = vx;
			this._vy = vy;
			init();
		}
		
		private function init():void
		{
			_ball = new Ball(20);
			addChild(_ball);
			_ball.x = _ball.radius;
			_ball.y = _ball.radius;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			_bottom = stage.stageHeight;
			_right = stage.stageWidth;
		}
		
		private function onEnterFrame(e:Event):void
		{
			_ball.x += _vx;
			_ball.y += _vy;
			
			if(_ball.x > (_right - _ball.radius))
			{
				_vx = -_vx;
//				_ball.x = _left-_ball.radius;
			}
			
			if(_ball.y > (_bottom - _ball.radius))
			{
				_vy = -_vy;
//				_ball.y = _top-_ball.radius;
			}
			
			if(_ball.x < (_left+_ball.radius))
			{
				_vx = -_vx;
//				_ball.x = _right+_ball.radius;
			}
			
			if(_ball.y < _top+_ball.radius)
			{
				_vy = -_vy;
//				_ball.y = _bottom+_ball.radius;
			}
		}
		
	}
}