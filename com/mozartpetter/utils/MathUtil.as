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
package com.mozartpetter.utils {
	
	/**
	 * MathUtil class.
	 * 
	 * @author Mozart Petter 
	 * @since Jan 1, 2009
	 */
	public class MathUtil {
		
		/**
		 * Returns the percent value from value1 by value2.
		 * 
		 * @param value1 
		 * @param value2 
		 */
		public static function percent(value1:Number, value2:Number):Number {
			var value:Number = value1 / value2;
			if (value == Infinity) value = 0;
			return value * 100;
		}
		
		/**
		 * Rounds a number to specific decimal places.
		 * 
		 * @param value
		 * @param decimalPlaces
		 */
		public static function round(value:Number, decimalPlaces:int = 0):Number {
			 if (decimalPlaces > 0) {
			 	value = int(value * Math.pow(10, decimalPlaces)) / Math.pow(10, decimalPlaces);
			 	return value;
			 } else {
			 	return Math.round(value);
			 }
		}
	}
}