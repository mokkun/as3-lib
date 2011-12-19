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
	 *	DateUtil Class
	 *	
	 * @author Mozart Petter 
	 * @since Jan 1, 2009
	 */
	public class DateUtil {
		
		/**
		 * Formats the given date into the given format.
		 * 
		 * @param date Date The date to be formatted.
		 * @param format String The format pattern.
		 * 
		 * Possible values are:
		 * hh - Hours.
		 * mm - Minutes.
		 * ss - Seconds.
		 * ll - Miliseconds.
		 * DD - Day.
		 * MM - Month.
		 * YYYY - Full year.
		 * 
		 * @return
		 */
		public static function dateFormat(date:Date, format:String):String {
			if (!date) return "";
			
			// Hours.
			format = format.replace("hh", NumberFormatter.addLeadingZeros(date.getHours(), 2));
			// Minutes.
			format = format.replace("mm", NumberFormatter.addLeadingZeros(date.getMinutes(), 2));
			// Seconds.
			format = format.replace("ss", NumberFormatter.addLeadingZeros(date.getSeconds(), 2));
			// Miliseconds.
			format = format.replace("ll", NumberFormatter.addLeadingZeros(date.getMilliseconds(), 4));
			// Day.
			format = format.replace("DD", NumberFormatter.addLeadingZeros(date.getDate(), 2));
			// Month.
			format = format.replace("MM", NumberFormatter.addLeadingZeros(date.getMonth() + 1, 2));
			// Year.
			format = format.replace("YYYY", NumberFormatter.addLeadingZeros(date.getFullYear(), 4));
			// Week day.
			format = format.replace("w", NumberFormatter.addLeadingZeros(date.getDay(), 2));
			return format;
		}
		
		/**
		 *	Returns an object containing the difference between the given dates.
		 *	
		 *	@param start Date
		 *	@param end Date
		 *	@return Object
		 */
		public static function dateDiff(start:Date, end:Date):Object {
			var diff:Number = end.time - start.time;
			var days:Number = Math.floor(diff / 1000 / 60 / 60 / 24);
			var hours:Number = Math.floor(diff / 1000 / 60 / 60);
			var minutes:Number = Math.floor(diff / 1000 / 60);
			var seconds:Number = Math.round(diff / 1000);
			
			return {days: days, hours: hours, minutes: minutes, seconds: seconds, milliseconds: diff};
		}
		
		/**
		 * Returns the start of the current day in miliseconds.
		 */
		public static function todayStart():int {
			var today:Date = new Date();
			today.setHours(0, 0, 0, 0);
			return today.time;
		}
		
		/**
		 * Returns the end of the current day in miliseconds.
		 */
		public static function todayEnd():int {
			var today:Date = new Date();
			today.setHours(23, 59, 59, 999);
			return today.time;
		}
	}
}