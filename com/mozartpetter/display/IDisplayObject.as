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
	import flash.accessibility.AccessibilityProperties;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.IBitmapDrawable;
	import flash.display.LoaderInfo;
	import flash.display.Stage;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Transform;
	
	/**
	 * IDisplayObject
	 * 
	 * @author Mozart Petter
	 * @since Jan 1, 2009
	 */
	public interface IDisplayObject extends IEventDispatcher, IBitmapDrawable {
		
		/**
		 * The current accessibility options for this display object.
		 */
		function get accessibilityProperties():AccessibilityProperties;
        function set accessibilityProperties(x:AccessibilityProperties):void;
        
		/**
		 * Indicates the alpha transparency value of the object specified.
		 */
        function get alpha():Number;
        function set alpha(x:Number):void;
        
		/**
		 * A value from the BlendMode class that specifies which blend mode to use.
		 */
        function get blendMode():String;
        function set blendMode(x:String):void;
        
		/**
		 * If set to true, Flash runtimes cache an internal bitmap representation of the display object.
		 */
        function get cacheAsBitmap():Boolean;
        function set cacheAsBitmap(x:Boolean):void;
        
		/**
		 * An indexed array that contains each filter object currently associated with the display object.
		 */
        function get filters():Array;
        function set filters(x:Array):void;
        
		/**
		 * Indicates the height of the display object, in pixels.
		 */
        function get height():Number;
        function set height(x:Number):void;
        
		/**
		 * [read-only] Returns a LoaderInfo object containing information about loading the file to which this display object belongs.
		 */
        function get loaderInfo():LoaderInfo;
        
		/**
		 * The calling display object is masked by the specified mask object.
		 */
        function get mask():DisplayObject;
        function set mask(x:DisplayObject):void;
        
		/**
		 * [read-only] Indicates the x coordinate of the mouse or user input device position, in pixels.
		 */
        function get mouseX():Number;
        
		/**
		 * [read-only] Indicates the y coordinate of the mouse or user input device position, in pixels.
		 */
        function get mouseY():Number;
        
		/**
		 * Indicates the instance name of the DisplayObject.
		 */
        function get name():String;
        function set name(x:String):void;
        
		/**
		 * Specifies whether the display object is opaque with a certain background color.
		 */
        function get opaqueBackground():Object;
        function set opaqueBackground(x:Object):void;
        
		/**
		 * [read-only] Indicates the DisplayObjectContainer object that contains this display object.
		 */
        function get parent():DisplayObjectContainer;
        
		/**
		 * [read-only] For a display object in a loaded SWF file, the root property is the top-most display object in the portion of the display list's tree structure represented by that SWF file.
		 */
        function get root():DisplayObject;
        
		/**
		 * Indicates the rotation of the DisplayObject instance, in degrees, from its original orientation.
		 */
        function get rotation():Number;
        function set rotation(x:Number):void;
        
		/**
		 * The current scaling grid that is in effect.
		 */
        function get scale9Grid():Rectangle;
        function set scale9Grid(x:Rectangle):void;
        
		/**
		 * Indicates the horizontal scale (percentage) of the object as applied from the registration point.
		 */
        function get scaleX():Number;
        function set scaleX(x:Number):void;
        
		/**
		 * Indicates the vertical scale (percentage) of an object as applied from the registration point of the object.
		 */
        function get scaleY():Number;
        function set scaleY(x:Number):void;
        
		/**
		 * The scroll rectangle bounds of the display object.
		 */
        function get scrollRect():Rectangle;
        function set scrollRect(x:Rectangle):void;
        
		/**
		 * [read-only] The Stage of the display object.
		 */
        function get stage():Stage;
        
		/**
		 * An object with properties pertaining to a display object's matrix, color transform, and pixel bounds.
		 */
        function get transform():Transform;
        function set transform(x:Transform):void;
        
		/**
		 * Whether or not the display object is visible.
		 */
        function get visible():Boolean;
        function set visible(x:Boolean):void;
        
		/**
		 * Indicates the width of the display object, in pixels.
		 */
        function get width():Number;
        function set width(x:Number):void;
        
		/**
		 * Indicates the x coordinate of the DisplayObject instance relative to the local coordinates of the parent DisplayObjectContainer.
		 */
        function get x():Number;
        function set x(x:Number):void;
        
		/**
		 * Indicates the y coordinate of the DisplayObject instance relative to the local coordinates of the parent DisplayObjectContainer.
		 */
        function get y():Number;
        function set y(x:Number):void;
		
		/**
		 * Returns a rectangle that defines the area of the display object relative to the coordinate system of the targetCoordinateSpace object.
		 */
        function getBounds(targetCoordinateSpace:DisplayObject):Rectangle;
		
		/**
		 * Returns a rectangle that defines the boundary of the display object, based on the coordinate system defined by the targetCoordinateSpace parameter, excluding any strokes on shapes.
		 */
        function getRect(targetCoordinateSpace:DisplayObject):Rectangle;
		
		/**
		 * Converts the point object from the Stage (global) coordinates to the display object's (local) coordinates.
		 */
        function globalToLocal(point:Point):Point;
		
		/**
		 * Evaluates the bounding box of the display object to see if it overlaps or intersects with the bounding box of the obj display object.
		 */
        function hitTestObject(obj:DisplayObject):Boolean;
		
		/**
		 * Evaluates the display object to see if it overlaps or intersects with the point specified by the x and y parameters.
		 */
        function hitTestPoint(x:Number, y:Number, shapeFlag:Boolean = false):Boolean;
		
		/**
		 * Converts the point object from the display object's (local) coordinates to the Stage (global) coordinates.
		 */
        function localToGlobal(point:Point):Point;
	}
}