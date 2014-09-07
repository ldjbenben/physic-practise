package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import phisics.LinearMotion4;
	
//	import phisics.LinearMotion2;
//	import phisics.LinearMotion3;

	[SWF(width=700, height=600)]
	public class flashphysic extends Sprite
	{
//		private var _linearMotion:LinearMotion;
//		private var _linearMotion:LinearMotion2;
//		private var _linearMotion:LinearMotion3;
		private var _linearMotion:LinearMotion4;
		
		public function flashphysic()
		{
			this.graphics.beginFill(0xeeeeee);
			this.graphics.drawRect(0, 0, 700, 600);
			this.graphics.endFill();
			
			_linearMotion = new LinearMotion4(10, 0, 0.5);
			addChild(_linearMotion);
			
			/*
			_linearMotion = new LinearMotion2(15, 15);
			addChild(_linearMotion);
			*/
			/*
			_linearMotion = new LinearMotion(5, 5);
			addChild(_linearMotion);
			*/
			
			/*
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
			
			_linearMotion4 =new LinearMotion4(2, 1);
			_linearMotion4.width = 800;
			_linearMotion4.y = 0;
			addChild(_linearMotion4);
			*/
			
		}
		
		private function onAddedToStage(e:Event):void
		{
			this.graphics.beginFill(0x00ff00);
			this.graphics.drawRect(0, 0, 500, 400);
			this.graphics.endFill();
		}
	}
}