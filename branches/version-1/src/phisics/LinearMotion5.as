package phisics
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import display.graphics.Ball;
	
	public class LinearMotion5 extends Sprite
	{
		private var _ball:Ball;
		
		//边界设置
		private var _left:int = 0; 
		private var _top:int = 0; 
		private var _right:int; 
		private var _bottom:int;
		
		private var _bounce:Number = -0.7; // 反弹损失
		private var _gravity:Number = 0.5; // 重力
		private var _friction:Number = 0.95; // 地面摩擦
		
		private var _oldX:Number = 0; // 上次x坐标
		private var _oldY:Number = 0; // 上次y坐标
		private var _downDate:Date; // 鼠标按下时的时间
		
		private var _panel:Sprite;
		private var _bounceInput:TextField;
		private var _bounceLabel:TextField;
		
		
		public function LinearMotion5(vx:Number = 2, vy:Number = 2, gravity:Number = 0.95)
		{
			this._gravity = gravity;
			
			_ball = new Ball(36, 0x666666);
			_ball.vx = vx;
			_ball.vy = vy;
			addChild(_ball);
			
			_ball.x = _ball.radius;
			_ball.y = _ball.radius;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			_ball.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
			init();
		}
		
		private function init():void
		{
			drawPanel();
		}
		
		private function drawPanel():void
		{
			_panel = new Sprite;
			
			_bounceInput = new TextField();
			_bounceInput.type = TextFieldType.INPUT;
			_bounceInput.height = 20;
			_bounceInput.width = 40;
			_bounceInput.border = true;
			_bounceInput.text = _bounce.toString();
			_bounceInput.x = 80;
			_bounceInput.addEventListener(KeyboardEvent.KEY_UP, onBounceTextInput);
			_panel.addChild(_bounceInput);
			
			
			_bounceLabel = new TextField();
			_bounceLabel.text = "反弹力(-1~0)：";
			_panel.addChild(_bounceLabel);
			
			addChild(_panel);
		}
		
		private function onBounceTextInput(e:KeyboardEvent):void
		{
			_bounce = Number((e.target as TextField).text);
		}
		
		private function onMouseDown(e:MouseEvent):void
		{
			_downDate = new Date();
			_oldX = e.stageX;
			_oldY = e.stageY;
			_ball.isDrag = true;
			_ball.startDrag();
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			var timeDifference:Number = this.getTimeDifference(_downDate, new Date());
			
			if(timeDifference < 1000)
			{
				_ball.vx = (e.stageX - _oldX)*(50/timeDifference);
				_ball.vy = (e.stageY - _oldY)*(50/timeDifference);
			}
			else
			{
				_ball.vx = 0;
				_ball.vy = 0;
			}
			
			_ball.isDrag = false;
			_ball.stopDrag();
		}
		
		private function onAddedToStage(e:Event):void
		{
			_bottom = stage.stageHeight;
			_right = stage.stageWidth;
		}
		
		private function onEnterFrame(e:Event):void
		{
			if(_ball.isDrag)
			{
				return;
			}
			
			_ball.vy += _gravity;
			_ball.x += _ball.vx;
			_ball.y += _ball.vy;
			
			// 地面摩擦
			if(_ball.y >= (_bottom-_ball.radius))
			{
				_ball.vx *= _friction;
			}
			
			// 边界检测
			if(_ball.x < (_left+_ball.radius))
			{
				_ball.x = (_left + _ball.radius);
				_ball.vx *= _bounce;
			}
			else if(_ball.x > (_right - _ball.radius))
			{
				_ball.x = (_right - _ball.radius);
				_ball.vx *= _bounce;
			}
			
			if(_ball.y < (_top+_ball.radius))
			{
				_ball.y = (_top+_ball.radius);
				_ball.vy *= _bounce;
			}
			else if(_ball.y > (_bottom-_ball.radius))
			{
				_ball.y = (_bottom-_ball.radius);
				_ball.vy *= _bounce;
			}
		}
		
		private function getTimeDifference(date1:Date, date2:Date):int
		{
			var num:Number = 0;
			var sec:Number = date2.getSeconds() - date1.getSeconds();
			var mec:Number = date2.getMilliseconds() - date1.getMilliseconds();
			num = sec*1000;
			
			return num + mec;
		}
	}
}