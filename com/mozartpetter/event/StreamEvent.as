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
package com.mozartpetter.event {
	import flash.events.Event;
	import flash.net.NetStream;
	import flash.net.NetConnection;
	
	/**
	 * StreamEvent Class
	 *
	 * @author Mozart Petter
	 * @since Jan 1, 2009
	 */
	public class StreamEvent extends Event {
		
		//----------------------------------------------
		//	Public Properties
		//----------------------------------------------
		
		public static var BUFFERING:String = "streamBuffering";
		public static var BUFFER_FULL:String = "streamBufferFull";
		public static var CONNECTED:String = "streamConnected";
		public static var CONNECTION_ERROR:String = "streamConnectionError";
		public static var CONNECTION_REJECTED:String = "streamConnectionRejected";
		public static var INSUFFICIENT:String = "streamInsufficient";
		public static var METADATA_READY:String = "streamMetadataReady";
		public static var STREAM_READY:String = "streamStreamReady";
		public static var STREAMING:String = "streamStreaming";
		public static var STREAMING_END:String = "streamStreamingEnd";
		public static var STREAMING_OFF:String = "streamStreamingOff";
		
		public var connection:NetConnection;
		public var info:Object;
		public var stream:NetStream;
		
		//----------------------------------------------
		//	Constructor
		//----------------------------------------------
		
		/**
		 * Creates a new instance of <code>StreamEvent</code>.
		 */
		public function StreamEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
	//----------------------------------------------------------------------------------------------
	//
	//  Public Methods
	//  
	//----------------------------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override public function clone():Event {
			var e:StreamEvent = new StreamEvent(this.type, this.bubbles, this.cancelable);
			e.connection = connection;
			e.info = info;
			e.stream = stream;
			return e;
		}
	}
}