//
//   Copyright 2009 - 2011 Mozart Petter
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//
package com.mozartpetter.display {
	import com.mozartpetter.events.UIContentEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	
	/**
	 * The SimpleUIContent is the base class for all elements that show content in 
	 * the application. It contains methods to show and hide content, and other stuff.
	 * 
	 * @author Mozart Petter
	 * @since Jan 1, 2009
	 */ 
	dynamic public class SimpleUIContent extends MovieClip implements ISimpleUIContent {
		
		// Holds the content data.
		protected var _data:Object = null;
		
		// Indicates if the element is visible or not.
		private var _isVisible:Boolean = true;
		
		//----------------------------------------------
		//	Constructor
		//----------------------------------------------
		
		/**
		 * Creates a new SimpleUIContent instance.
		 */
		public function SimpleUIContent() {
			super();
		}
		
		//----------------------------------------------
		//	Getter/Setter
		//----------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		public function get data():Object {
			return _data;
		}
		
		public function set data(value:Object):void {
			_data = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get isVisible():Boolean {
			return _isVisible;
		}
		
		public function set isVisible(value:Boolean):void {
			_isVisible = value;
		} 
		
		//----------------------------------------------
		//	Content Handling
		//----------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		public function getBitmap(rect:Rectangle):Bitmap {
			var data:BitmapData = new BitmapData(rect.width, rect.height);
			data.draw(this);
			return new Bitmap(data);
		}
		
		/**
		 * @inheritDoc
		 */
		public function getChildren():Array {
			var children:Array = new Array();
			
			for (var i:int = 0; i < numChildren; i++) {
				var child:DisplayObject = getChildAt(i);
				children.push(child);
			}
			return children;
		}
		
		/**
		 * @inheritDoc
		 * 
		 * OBS.: This is an abstract method. You must override it and call the super() in your class.
		 */
		public function hide():void {
			dispatchEvent(new UIContentEvent(UIContentEvent.HIDING, true));
		}
		
		/**
		 * @inheritDoc
		 * 
		 * OBS.: This is an abstract method. You must override it and call the super() in your class.
		 */
		public function show():void {
			dispatchEvent(new UIContentEvent(UIContentEvent.SHOWING, true));
		}
		
		/**
		 * Call it when the hiding process is complete. This method will tell the system that your content
		 * was successfully hided.
		 */
		protected function hided():void {			
			// Setting the view as not visible.
			_isVisible = false;
			// Telling the listener that the view is HIDED.
			dispatchEvent(new UIContentEvent(UIContentEvent.HIDED, true));
		}
		
		/**
		 * Call it when the showing process is complete. This method will tell the system that your content
		 * was successfully displayed.
		 */
		protected function showed():void {
			// Setting view as visible. 
			_isVisible = true;
			// Telling the listener that the view was SHOWED.
			dispatchEvent(new UIContentEvent(UIContentEvent.SHOWED, true));
		}
	}
}