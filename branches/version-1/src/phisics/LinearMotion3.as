package phisics
{
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;

	/**
	 * 已知力与质量，求物体的速度与位移
	 */
	public class LinearMotion3 extends Sprite
	{
		private var _v0:Number = 0; // 初速度
		private var _a:Number = 0; // 加速度
		private var _mass:Number; // 物体质量，以kg为单位
		private var _force:Number;
		private var _lengthScalar:Number = 20; // 刻度尺比例1m=x*px
		private var _timer:Timer;
		private var _rect:Sprite;
		private var _time:int = 0;
		private var _microseconds:int = 100;
		private var _panel:Sprite;
		private var _txtSpeedTip:TextField;
		private var _txtSpeed:TextField;
		private var _frictionForce:Number = 1;
		
		
		public function LinearMotion3(f:Number, m:Number)
		{
			this._force = f;
			this._mass = m;
			this._a = f/m;
			
			this.graphics.beginFill(0x55ffff);
			this.graphics.drawRect(0, 0, 800, 800);
			this.graphics.endFill();
			
			_rect = new Sprite();
			_rect.graphics.beginFill(0x888800);
			_rect.graphics.drawRect(0, 0, 50, 50);
			_rect.graphics.endFill();
			this.addChild(_rect);
			
			this.drawPanel();
			
			_timer = new Timer(this._microseconds);
			_timer.addEventListener(TimerEvent.TIMER, motion);
			_timer.start();
		}
		
		private function motion(event:TimerEvent):void
		{
			this._time++;
			
			if(_rect.x >= 800)
			{
				this._time = 0;
				_rect.x =  0;
			}
			var v:Number = this._a;
			var frictionV:Number = (this._frictionForce*_microseconds)/(this._mass*1000);
			v -= frictionV;
			this._a = v;
			if(v<0)
			{
				_timer.stop();
				v=0;
			}
			else
			{
				_rect.x += v*this._lengthScalar;
			}
			this._txtSpeed.text = v+"m/s";
		}
		
		private function drawPanel():void
		{
			this._panel = new Sprite();
			
			this._txtSpeedTip = new TextField();
			this._txtSpeedTip.text = "Speed:";
			this._txtSpeedTip.width = 50;
			this._panel.addChild(this._txtSpeedTip);
			this._txtSpeedTip.x = 0;
			this._txtSpeedTip.y = 0;
			
			this._txtSpeed = new TextField();
			this._panel.addChild(this._txtSpeed);
			this._txtSpeed.x = this._txtSpeedTip.width + this._txtSpeedTip.x + 10;
			
			this.addChild(this._panel);
		}
	}
}