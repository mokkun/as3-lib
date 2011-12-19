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
	 * NumberFormatter Class
	 * 
	 * @author Mozart Petter
	 * @since Jan 1, 2009
	 */
	public class NumberFormatter {
		
		/**
		 * Fills the given number with zeros to match que given size.
		 * 
		 * @param number Number to be formatted.
		 * @param size The number of decimal places to reach.
		 * @return A String with the formatted number.
		 * @example 
		 * <listing version="3.0">
		 * NumberFormatter.addLeadingZeros(13, 5); // 00013;
		 * NumberFormatter.addLeadingZeros(1, 2); // 01;
		 * NumberFormatter.addLeadingZeros(15, 2); // 15;
		 * NumberFormatter.addLeadingZeros(15, 3); // 015;
		 * </listing>
		 */
		public static function addLeadingZeros(number:Number, size:Number):String {
			if (number.toString.length > size) return number.toString();
			return Math.pow(10, size - number.toString().length).toString().substr(1) + number;
		}
	}
}