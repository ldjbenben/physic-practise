package phisics
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import display.graphics.Ball;
	
	public class LinearMotion2 extends Sprite
	{
		private var _ball:Ball;
		private var _vx:Number;
		private var _vy:Number;
		private var _factor:Number; // 动摩擦因数
		//边界设置
		private var _left:int = 0; 
		private var _top:int = 0; 
		private var _right:int; 
		private var _bottom:int;
		
		public function LinearMotion2(vx:Number = 2, vy:Number = 2, factor:Number = 0.95)
		{
			this._vx = vx;
			this._vy = vy;
			this._factor = factor;
			init();
		}
		
		private function init():void
		{
			_ball = new Ball(20);
			addChild(_ball);
			_ball.x = -20;
			_ball.y = -20;
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
			_vx *= _factor;
			_vy *= _factor;
			_ball.x += _vx;
			_ball.y += _vy;
		}
		
	}
}