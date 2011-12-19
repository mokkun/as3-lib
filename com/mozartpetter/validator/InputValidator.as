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
package com.mozartpetter.validator {
	import com.mozartpetter.utils.NumberFormatter;
	import com.mozartpetter.utils.StringUtil;
	
	/**
	 * InputValidator Class
	 * 
	 * @author Mozart Petter
	 * @since Jan 1, 2009
	 */
	public class InputValidator {
		
		/**
		 * Checks if value has the min chars.
		 * 
		 * @param value The value to be checked.
		 * @param min Minimum number of chars.
		 * @return True if the value has the minimum number of chars.
		 */
		public static function hasMinChars(value:String, min:int):Boolean {
			if (StringUtil.trim(value).length < min) {
				return false;
			}
			return true;
		}
		
		/**
		 * Checks if the value is not empty.
		 * 
		 * @param value The value to be checked.
		 * @return True if the value is not empty.
		 */
		public static function isFilled(value:String):Boolean {
			if (StringUtil.trim(value) == "") {
				return false;
			}
			return true;
		}
		
		/**
		 * Checks if value contains a valid date. The expected format is DD/MM/YYYY.
		 * 
		 * @param value The value to be checked.
		 * @param value Defines if future dates are allowed.
		 * @return True if the value contains a valid date.
		 */
		public static function isValidDate(value:String, future:Boolean = false):Boolean {
			var pattern:RegExp = /([0-9]+){2}\/([0-9]+){2}\/([0-9]+){4}/;
			var result:Object = pattern.exec(value);
			
			if (result == null) return false;
			
			var values:Array = String(result[0]).split("\/");
			var currentDate:Date = new Date();
			var date:Date = new Date(values[2], Number(values[1]) - 1, values[0]);
			var dateString:String = NumberFormatter.addLeadingZeros(date.getDate(), 2) 
									+ "/" 
									+ NumberFormatter.addLeadingZeros(date.getMonth() + 1, 2) 
									+ "/" 
									+ date.getFullYear();
			
			if (!future && (date.time > currentDate.time)) return false;
			if (result[0] != dateString) return false;
			return true;
		}
		
		/**
		 * Checks if value contains a valid CPF number.
		 * 
		 * @param value The value to be checked.
		 * @return True if value is a valid CPF number.
		 */
		public static function isValidCPF(value:String):Boolean {
			var pattern:RegExp = /([0-9]+){11}/;
            var result:Object = pattern.exec(value);

            if(result == null) return false;
			
			var n:Array = value.split(""); 
			var v:Array = new Array();
			var valid:Boolean = false;
			
			// Getting the first check digit.
			v[1] = 	(10 * n[0]) + (9 * n[1]) + (8 * n[2])
					+ (7 * n[3]) + (6 * n[4]) + (5 * n[5])
					+ (4 * n[6]) + (3 * n[7]) + (2 * n[8]);
			
			v[1] = 11 - (v[1] % 11);
			if (v[1] >=10) v[1] = 0;
			
			// Getting the second check digit.
			v[2] = 	(11 * n[0]) + (10 * n[1]) + (9 * n[2])
					+ (8 * n[3]) + (7 * n[4]) + (6 * n[5])
					+ (5 * n[6]) + (4 * n[7]) + (3 * n[8]) + (2 * v[1]);
			
			v[2] = 11 - (v[2] % 11);
			if (v[2] >= 10) v[2] = 0;
			
			// If all digits match, the CPF number is valid.
			if (v[1] == n[9] && v[2] == n[10]) valid = true;
			
			// Checking if all numbers are the same.
			// We need to check this because a CPF like 111.111.111-11 will pass in 
			// the algorithm verification, but it's not valid.
			for (var i:int = 0, e:int = 0; i < 9; i++) {
				if (n[i] == n[i + 1]) {
					e++;
				}
			}
			if (e == 9) valid = false;
			return valid;
		}
		
		/**
		 * Checks if value contains a valid email address.
		 * 
		 * @param value The value to be checked.
		 * @return True if the email is valid.
		 */
		public static function isValidEmail(value:String):Boolean {
			var pattern:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
            var result:Object = pattern.exec(value);
            
            if (result == null) return false;
            return true;
		}
		
		/**
		 * Checks if value has a valid phone number. The value should be in the following pattern:
		 * DDD + Number: 00 00000000
		 * 
		 * @param value The value to be checked.
		 * @return True if value has a valid phone number.
		 */
		public static function isValidPhoneNumber(value:String):Boolean {
			var pattern:RegExp = /([0-9]+){2} ([0-9]+){8}/;
            var result:Object = pattern.exec(value);
            
            if (result == null) return false;
            return true;
		}
		
		/**
		 * Checks if value is a valid time. The following pattern will be checked: HH:MM
		 * 
		 * @param value The value to be checked.
		 * @return True if the time is valid.
		 */
		public static function isValidTime(value:String):Boolean {
			var pattern:RegExp = /([0-9]{2})\:([0-9]{2})/;
			var result:Object = pattern.exec(value);
			
			if (result == null) return false;
			if (result[1] >= 24 || result[2] > 59) return false;	
			
			return true;
		}
		
		/**
		 * Checks if the value has a valid ZIP code. The following pattern will be checked:
		 * 00000-000
		 * 
		 * @param value The value to be checked.
		 * @return True if value has a valid zip code.
		 */
		public static function isValidZipCode(value:String):Boolean {
			var pattern:RegExp = /([0-9]+){5}-([0-9]+){3}/;
            var result:Object = pattern.exec(value);
            
            if (result == null) return false;
            return true;
		}
	}
}