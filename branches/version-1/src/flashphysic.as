package
{
	import flash.display.Sprite;
	
	import phisics.LinearMotion2;
	import phisics.LinearMotion3;
	
	public class flashphysic extends Sprite
	{
		private var _linearMotion2:LinearMotion2;
		private var _linearMotion3:LinearMotion3;
		
		public function flashphysic()
		{
			_linearMotion2 =new LinearMotion2(1, 1);
			_linearMotion2.width = 800;
			addChild(_linearMotion2);
			
			_linearMotion2 =new LinearMotion2(1, 2);
			_linearMotion2.width = 800;
			_linearMotion2.y = 100;
			addChild(_linearMotion2);
			
			_linearMotion3 =new LinearMotion3(1, 2);
			_linearMotion3.width = 800;
			_linearMotion3.y = 200;
			addChild(_linearMotion3);
			
			_linearMotion3 =new LinearMotion3(2, 1);
			_linearMotion3.width = 800;
			_linearMotion3.y = 300;
			addChild(_linearMotion3);
		}
	}
}