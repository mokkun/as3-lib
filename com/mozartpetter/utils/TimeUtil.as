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
	 * TimeUtil class.
	 * 
	 * @author Mozart Petter
	 * @since Jan 1, 2009
	 */
	public class TimeUtil {
		
		/**
		 * Converts a formatted time String into milliseconds.
		 * 
		 * @param value A formatted time String (hh:mm:ss.lll).
		 * @returns The number of milliseconds of the given time.
		 */
		public static function timeStringToMilliseconds(value:String):Number {
			var hours:Number = Number(value.substr(0, 2));
			var minutes:Number = Number(value.substr(3, 2));
			var seconds:Number = Number(value.substr(6, 2));
			var millis:Number = Number(value.substr(9)) * 100;

			return Date.UTC(1970, 0, 1, hours, minutes, seconds, millis);
		}

		/**
		 * Converts the given time into milliseconds.
		 * 
		 * @param hours The hours.
		 * @param minutes The minutes.
		 * @param seconds The seconds.
		 * @return The number of milliseconds from the given time.
		 */
		public static function timeToMilliseconds(hours:int = 0, minutes:int = 0, seconds:int = 0):int {
			var milliseconds:int = seconds * 1000;
			milliseconds += (minutes * 60) * 1000;
			milliseconds += (hours * 3600) * 1000;
			
			return milliseconds;
		}
		
		/**
		 * Converts the given milliseconds into a time string.
		 * 
		 * @param milliseconds The milliseconds value to be converted.
		 * @param format The conversion format. The following values are valid:
		 * hh - Hours.
		 * mm - Minutes.
		 * ss - Seconds.
		 * 
		 * Ex. TimeUtil.millisecondsToTime(1235671, "mm:ss");
		 * Ex. TimeUtil.millisecondsToTime(1235671, "hh/mm");
		 * 
		 * @return A String with the formatted time.
		 */
		public static function millisecondsToTime(milliseconds:Number, format:String = "hh:mm:ss"):String {
			var date:Date = new Date(milliseconds);
			
			format = format.replace("hh", NumberFormatter.addLeadingZeros(date.getUTCHours(), 2));
			format = format.replace("mm", NumberFormatter.addLeadingZeros(date.getUTCMinutes(), 2));
			format = format.replace("ss", NumberFormatter.addLeadingZeros(date.getUTCSeconds(), 2));
			
			return format;
		}
	}
}