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
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.text.TextSnapshot;
	
	/**
	 * IDisplayObjectContainer Interface
	 *
	 * @author Mozart Petter
	 * @since Jan 1, 2009
	 */
	public interface IDisplayObjectContainer extends IDisplayObject {
		
		/**
		 * Determines whether or not the children of the object are mouse enabled. If an object is mouse 
		 * enabled, a user can interact with it by using a mouse.
		 */
		function get mouseChildren():Boolean
    	function set mouseChildren(value:Boolean):void
    	
    	/**
    	 * Returns the number of children of this object.
    	 */
    	function get numChildren():int
    	
    	/**
    	 * Determines whether the children of the object are tab enabled. Enables or disables tabbing for 
    	 * the children of the object.
    	 */
    	function get tabChildren():Boolean
    	function set tabChildren(value:Boolean):void
    	
    	/**
    	 * Returns a TextSnapshot object for this DisplayObjectContainer instance.
    	 */
    	function get textSnapshot():TextSnapshot
    	
		/**
		 * Adds a child DisplayObject instance to this DisplayObjectContainer instance.
		 */
		function addChild(child:DisplayObject):DisplayObject;
		
		/**
		 * Adds a child DisplayObject instance to this DisplayObjectContainer instance.
		 */
		function addChildAt(child:DisplayObject, index:int):DisplayObject;
		
		/**
		 * Indicates whether the security restrictions would cause any display objects to be omitted from 
		 * the list returned by calling the DisplayObjectContainer.getObjectsUnderPoint() method with the 
		 * specified point point.
		 */
		function areInaccessibleObjectsUnderPoint(point:Point):Boolean;
		
		/**
		 * Determines whether the specified display object is a child of the DisplayObjectContainer 
		 * instance or the instance itself.
		 */
		function contains(child:DisplayObject):Boolean;
		
		/**
		 * Returns the child display object instance that exists at the specified index.
		 */
		function getChildAt(index:int):DisplayObject;
		
		/**
		 * Returns the child display object that exists with the specified name.
		 */
		function getChildByName(name:String):DisplayObject;
		
		/**
		 * Returns the index position of a child DisplayObject instance.
		 */
		function getChildIndex(child:DisplayObject):int;
		
		/**
		 * Returns an array of objects that lie under the specified point and are children (or 
		 * grandchildren, and so on) of this DisplayObjectContainer instance.
		 */
		function getObjectsUnderPoint(point:Point):Array;
		
		/**
		 * Removes the specified child DisplayObject instance from the child list of the 
		 * DisplayObjectContainer instance.
		 */
		function removeChild(child:DisplayObject):DisplayObject;
		
		/**
		 * Removes a child DisplayObject from the specified index position in the child list of 
		 * the DisplayObjectContainer.
		 */
		function removeChildAt(index:int):DisplayObject;
		
		/**
		 * Changes the position of an existing child in the display object container.
		 */
		function setChildIndex(child:DisplayObject, index:int):void;
		
		/**
		 * Swaps the z-order (front-to-back order) of the two specified child objects.
		 */
		function swapChildren(child1:DisplayObject, child2:DisplayObject):void;
		
		/**
		 * Swaps the z-order (front-to-back order) of the child objects at the two specified index 
		 * positions in the child list.
		 */
		function swapChildrenAt(index1:int, index2:int):void;
	}
}