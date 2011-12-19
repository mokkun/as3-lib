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
	
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.utils.getTimer;
	
	/**
	 * Debugger Class.
	 * You need Monster Debugger linked to your project in order to use this class.
	 * 
	 * @author Mozart Petter
	 * @since Oct 18, 2011
	 */
	public class Debugger {
		
		//----------------------------------------------
		// Configuration
		//----------------------------------------------
		
		// Sets if the debug mode is on.
		public static const DEBUG_MODE:Boolean = true;
		// Sets if the MonsterDebug app will be used to show output messages.
		private static const USE_MONSTER_DEBUGGER:Boolean = true;
		// Sets if the default trace function will be used to show output messages. 
		private static const USE_FLEX_DEBUG:Boolean = true;
		
		//----------------------------------------------
		// Private Properties
		//----------------------------------------------
		
		// The current log index.
		private static var sLogIndex = 0;
		
		/**
		 * Initializes the debugger util.
		 */
		public static function initialize(root:Object):void {
			if (DEBUG_MODE) {
				MonsterDebugger.initialize(root);
				MonsterDebugger.enabled = DEBUG_MODE;
			}
		}
		
		/**
		 * Shows the given object in the output.
		 * 
		 * @param tag The tag of this log. Usually this would be the name of the caller.
		 * @param object The object to be sent to the output.
		 */
		public static function log(tag:String, object:Object = null):void {
			if (DEBUG_MODE) {
				if (USE_MONSTER_DEBUGGER) 
					MonsterDebugger.trace(tag, object);
				
				if (USE_FLEX_DEBUG) { 
					trace(++sLogIndex + " | " + TimeUtil.millisecondsToTime(getTimer(), "hh:mm:ss") + " | " + tag + ": " + object + "\n");
				}
			}
		}
	}
}
	