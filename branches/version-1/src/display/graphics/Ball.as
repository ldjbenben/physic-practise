package display.graphics
{
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.geom.Matrix;

	public class Ball extends Sprite
	{
		private var _radius:Number; // 半径
		private var _color:uint; // 颜色
		private var _mass:Number; // 质量
		private var _vx:Number; // x轴方向的速度
		private var _vy:Number; // y轴方向的速度
		private var _isDrag:Boolean; // 是否正在被拖拽
		
		public function Ball(radius:Number = 50, color:uint = 0x666666, mass:Number = 1, vx:Number = 0, vy:Number = 0)
		{
			this._radius = radius;
			this._color = color;
			this._mass = mass;
			this._vx = vx;
			this._vy = vy;
			this._isDrag = false;
			this._mass = 1;
			init();
		}
		
		private function init():void
		{
			var colors : Array = [0xcccccc, _color];
			var alphas : Array = [1, 1];
			var ratios : Array = [0, 255];
			var matrix : Matrix = new Matrix();
			matrix.createGradientBox(_radius*2, _radius*2, Math.PI / 2, -_radius/5-_radius, -_radius/5-_radius);
			graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, matrix);
			graphics.drawCircle(0, 0, _radius);
			graphics.endFill();
		}
		
		public function set radius(value:Number):void 
		{
			this._radius = value;
		}
		
		public function get radius():Number
		{
			return this._radius;
		}
		
		public function set color(value:uint):void 
		{
			this._color = value;
		}
		
		public function get color():uint
		{
			return this._color;
		}
		
		public function set mass(value:Number):void 
		{
			this._mass = value;
		}
		
		public function get mass():Number
		{
			return this._mass;
		}
		
		public function set vx(value:Number):void
		{
			this._vx = value;
		}
		
		public function get vx():Number
		{
			return this._vx;
		}
		
		public function set vy(value:Number):void 
		{
			this._vy = value;
		}
		
		public function get vy():Number
		{
			return this._vy;
		}
		
		public function set isDrag(value:Boolean):void 
		{
			this._isDrag = value;
		}
		
		public function get isDrag():Boolean
		{
			return this._isDrag;
		}
	}
}