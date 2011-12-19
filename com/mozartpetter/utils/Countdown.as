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
	import flash.events.EventDispatcher;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	/**
	 * Countdown Class
	 *
	 * @author Mozart Petter
	 * @since Jan 1, 2009
	 */
	public class Countdown extends EventDispatcher {
		
		//----------------------------------------------
		//	Private Properties
		//----------------------------------------------
		
		private static const UPDATE_TIME:int = 1000;
		
		// The number of days to reach the end date.
		private var _days:Number = 0;
		// An object with the difference between dates.
		private var _diff:Object;
		// The end date.
		private var _endDate:Date;
		// The number of hours related to the number of days to reach the end date.
		private var _hours:Number = 0;
		// The number of minutes related to the number of days to reach the end date.
		private var _minutes:Number = 0;
		// The number of seconds related to the number of days to reach the end date.
		private var _seconds:Number = 0;
		// The number of total hours to reach the end date.
		private var _totalHours:Number = 0;
		// The number of total minutes to reach the end date.
		private var _totalMinutes:Number = 0;
		// The number of total seconds to reach the end date.
		private var _totalSeconds:Number = 0;
		// The update timer object.
		private var _updateTimer:Timer;
		
		//----------------------------------------------
		//	Constructor
		//----------------------------------------------
		
		/**
		 * Create a new instance of <code>Countdown</code>.
		 * @example 
		 * <listing version="3.0">
		 * import com.mozartpetter.date.Countdown;
		 * 
		 * var end:Date = new Date(2012, 11, 25);
		 * var count:Countdown = new Countdown(end);
		 * count.addEventListener(Event.CHANGE, onCountChange);
		 * count.start();
		 * 
		 * function onCountChange(event:Event):void {
		 * 	trace(count.days + " days, " + count.hours + " hours, " + count.minutes +  " minutes and " + count.seconds + " seconds");
		 * }
		 * </listing>
		 */
		public function Countdown(end:Date) {
			if (end.getTime() < new Date().getTime()) {
				throw new Error("The end date is in the past, can't count it!");
			}
			_endDate = end;
			_updateTimer = new Timer(UPDATE_TIME);
		}
		
		//----------------------------------------------
		// Getters/Setters
		//----------------------------------------------
		
		/**
		 * Returns the number of days to reach the end date.
		 */
		public function get days():Number {
			return _days;
		}
		
		/**
		 * Returns the number of hours related to the number of days to reach the end date.
		 */
		public function get hours():Number {
			return _hours;
		}
		
		/**
		 * Returns the number of minutes related to the number of days to reach the end date.
		 */
		public function get minutes():Number {
			return _minutes;
		}
		
		/**
		 * Returns the number of seconds related to the number of days to reach the end date.
		 */
		public function get seconds():Number {
			return _seconds;
		}
		
		/**
		 * Returns the number of total hours to reach the end date.
		 */
		public function get totalHours():Number {
			return _totalHours;
		}
		
		/**
		 * Returns the number of total minutes to reach the end date.
		 */
		public function get totalMinutes():Number {
			return _totalMinutes;
		}
		
		/**
		 * Returns the number of total seconds to reach the end date.
		 */
		public function get totalSeconds():Number {
			return _totalSeconds;
		}
		
		//----------------------------------------------
		// Methods
		//----------------------------------------------
		
		/**
		 * Starts the countdown.
		 */
		public function start():void {
			this._updateTimer.addEventListener(TimerEvent.TIMER, handleTimer);
			this._updateTimer.start();
			
			update();
		}
		
		/**
		 * Updates the current time.
		 */
		protected function update():void {
			_diff = DateUtil.dateDiff(new Date(), _endDate);
			
			_days = _diff.days;
			_totalHours = _diff.hours;
			_totalMinutes = _diff.minutes;
			_totalSeconds = _diff.seconds;
			_hours = Math.floor(_diff.hours - (24 * _days));
			_minutes = Math.floor(_diff.minutes - (_days * 24 * 60) - (_hours * 60));
			_seconds = Math.round(_diff.seconds - (_days * 24 * 60 * 60)
			 				- (_hours * 60 * 60) - (_minutes * 60));
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		/**
		 * Handles the TIMER event.
		 * 
		 * @param event
		 */
		private function handleTimer(event:TimerEvent):void {
			update();
		}
	}
}