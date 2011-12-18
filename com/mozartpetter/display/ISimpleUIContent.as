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
	import flash.display.Bitmap;
	import flash.events.IEventDispatcher;
	import flash.geom.Rectangle;
	
	/**
	 * ISimpleUIContent
	 * 
	 * @author Mozart Petter
	 * @since Jan 1, 2009
	 */ 
	public interface ISimpleUIContent extends IEventDispatcher, IDisplayObjectContainer {
		
		/**
		 * The UI data. Use this to store useful data to the view.
		 */
		function get data():Object;
		function set data(value:Object):void;
		
		/**
		 * Indicates if the view is visible.
		 */
		function get isVisible():Boolean;
		function set isVisible(value:Boolean):void;
		
		/**
		 * Returns a bitmap of this object.
		 */
		function getBitmap(rect:Rectangle):Bitmap;
		
		/**
		 * Gets all view children.
		 * 
		 * @return An array with all children. 
		 */
		function getChildren():Array;
		
		/**
		 * Hides the view. Put your view hide logic in here.
		 */
		function hide():void;
		
		/**
		 * Shows up the view. Put your view show logic in here.
		 */
		function show():void;
	}
}