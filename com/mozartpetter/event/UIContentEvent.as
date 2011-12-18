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
package com.mozartpetter.events {
	import flash.events.Event;
	
	/**
	 * The UIContentEvent is the base class for content events.
	 * 
	 * @author Mozart Petter 
	 * @since Jan 1, 2009
	 */ 
	public class UIContentEvent extends Event {
		
		// Constant that defines the HIDED event.
		public static const HIDED:String = "contentHided";
		
		// Constant that defines the HIDING event.
		public static const HIDING:String = "contentHiding";
		
		// Constant that defines the SHOWED event.
		public static const SHOWED:String = "contentShowed";
		
		// Constant that defines the SHOWING event.
		public static const SHOWING:String = "contentShowing";
		
		//----------------------------------------------
		//	Constructor
		//----------------------------------------------
		
		/**
		 * Create a new instance of <code>UIContentEvent</code>.
		 */
		public function UIContentEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function clone():Event {
			var event:UIContentEvent = new UIContentEvent(type, bubbles, cancelable);
			return event;
		}
	}
}