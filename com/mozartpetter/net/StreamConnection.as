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
package com.mozartpetter.net {
	import com.mozartpetter.event.StreamEvent;
	import com.mozartpetter.utils.StringUtil;
	
	import flash.events.EventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	/**
	 * StreamConnection Class.
	 * 
	 * @author Mozart Petter 
	 * @since Jan 1, 2009
	 */
	public class StreamConnection extends EventDispatcher {
		
		//----------------------------------------------
		//	Private Properties
		//----------------------------------------------
		
		// Name of the application in the media server.
		private var _application:String = "";
		
		// The buffer time, in seconds.
		private var _bufferTime:int = 10;
		
		// Media server address.
		private var _host:String = "";
		
		// NetConnection object.
		private var _netconn:NetConnection = null;
		
		// NetStream object.
		private var _netstream:NetStream = null;
		
		// The connection status.
		private var _status:Boolean = false;
		
		//----------------------------------------------
		//	Constructor
		//----------------------------------------------
		
		/**
		 * Creates a new StreamConnection instance.
		 * 
		 * @param host The media server address. If no host is specified, a local connection will be used.
		 * @param application The application name in the media server.
		 * @param encodingType Type of data serialization. The default value is AMF0.
		 */		
		public function StreamConnection(host:String = "", 
										   application:String = "",
										   encodingType:uint = 0) {
			_host = host;
			_application = application;
			_netconn = new NetConnection();
			_netconn.objectEncoding = encodingType;
			// Setting the net connection client.
			_netconn.client = this;
			// Adding the NET_STATUS event listener.
			_netconn.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
		}
		
	//----------------------------------------------------------------------------------------------
	//
	//  Getter/Setter Methods
	//  
	//----------------------------------------------------------------------------------------------
		
		/**
		 * Sets the application name.
		 * 
		 * @param value
		 */
		public function set application(value:String):void {
			// Stops the current streaming.
			stopStreaming()
			// Setting the new application name.
			_application = value;
			// Starts the streaming for the new application.
			startStreaming();
		}
		
		/**
		 * Sets the buffer time.
		 * 
		 * @param value
		 */
		public function set bufferTime(value:Number):void {
			_bufferTime = value;
		}
		
		/**
		 * Returns true if there's an active connection or not.
		 */
		public function get isConnected():Boolean {
			return _status;
		}
		
		/**
		 * Returns the NetStream object.
		 * 
		 * @return NetStream
		 */
		public function get netStream():NetStream {
			return _netstream;
		}
		
	//----------------------------------------------------------------------------------------------
	//
	//  Public Methods
	//  
	//----------------------------------------------------------------------------------------------
		
		/**
		 * Connects to the streaming server.
		 * 
		 * @return void
		 */
		public function connect():void {
			if (_status) return;
			if (StringUtil.trim(_host) != "") {
				// Connection to the host.
				_netconn.connect(_host);
			} else {
				// Connecting local.
				_netconn.connect(null);
			}
		}
		
		/**
		 * Closes the connection.
		 * 
		 * @return void
		 */
		public function disconnect():void {
			closeConnection();
		}
		
		/**
		 * FMS3 Method.
		 */
		public function onBWDone():void {
		}
		
		/**
		 * Called by the FMS server when a cue point is received.
		 * 
		 * @param info
		 * @return void
		 */
		public function onCuePoint(info:Object):void {
			// Cue point received...
		}
		
		/**
		 * Called when the metadata is received.
		 * 
		 * @param info
		 * @return void
		 */
		public function onMetaData(info:Object):void {
			var evtMeta:StreamEvent = new StreamEvent(StreamEvent.METADATA_READY, true);
			evtMeta.info = info;
			dispatchEvent(evtMeta);
		}
		
		/**
		 * 
		 */
		public function onXMPData(info:Object):void {
		}
		
		/**
		 * Starts the streaming.
		 * 
		 * @return void
		 */
		public function startStreaming():void {
			_netstream.bufferTime = _bufferTime;
			_netstream.play(_application);
		}
		
		/**
		 * Stops the streaming.
		 * 
		 * @return void
		 */
		public function stopStreaming():void {
			if (_netstream != null) {
				_netstream.close();
			}
		}
				
	//----------------------------------------------------------------------------------------------
	//
	//  Private Methods
	//  
	//----------------------------------------------------------------------------------------------
		
		/**
		 * Closes the server connection.
		 * 
		 * @return void.
		 */
		private function closeConnection():void {	
			stopStreaming();
			
			if (_netconn != null) {
				_netconn.close();
			}
		}
		
		/**
		 * Handles the net status events.
		 * 
		 * @param evt
		 */
		private function netStatusHandler(evt:NetStatusEvent):void {
			switch (evt.info.code) {
				// NetConnection
				// Connection success.
				case "NetConnection.Connect.Success":
					_status = true;
					// Creating the CONNECTED event.
					var successEvt:StreamEvent = new StreamEvent(StreamEvent.CONNECTED, true);
					// Setting a reference to the current net connection.
					successEvt.connection = _netconn;
					// Dispatching the event.
					dispatchEvent(successEvt);
					// Initializes the streaming.
					initStreaming();
				break;
				
				// If the connection fails or is rejected.
				case "NetConnection.Connect.Rejected":
				case "NetConnection.Connect.Failed":
					// Creating the CONNECTION_ERROR event.
					var errorEvt:StreamEvent = new StreamEvent(StreamEvent.CONNECTION_ERROR, true);
					// Dispatching the event.
					dispatchEvent(errorEvt);
				break;
				
				// Em caso da conexao ser fechada.
				case "NetConnection.Connect.Closed":
					// Creating the CONNECTION_ERROR event.
					var closeEvt:StreamEvent = new StreamEvent(StreamEvent.CONNECTION_ERROR, true);
					// Dispatching the event.
					dispatchEvent(closeEvt);
					// Closing the connection.
					closeConnection();
				break;
				
				// Em caso de recusa da conexao.
				case "NetConnection.Connect.Rejected":
					// Creating the CONNECTION_REJECTED event.
					var rejectEvt:StreamEvent = new StreamEvent(StreamEvent.CONNECTION_REJECTED, true);
					// Dispatching the event.
					dispatchEvent(rejectEvt);
					// Closing the connection.
					closeConnection();
				break;
				
				// NetStream
				case "NetStream.Buffer.Empty":
					// Creating the BUFFERING event.
					var bufferingEvt:StreamEvent = new StreamEvent(StreamEvent.BUFFERING);
					// Dispatching the event.
					dispatchEvent(bufferingEvt);
				break;
				
				case "NetStream.Buffer.Full":
					// Creating the BUFFER_FULL event.
					var bufferFullEvent:StreamEvent = new StreamEvent(StreamEvent.BUFFER_FULL);
					// Dispatching the event.
					dispatchEvent(bufferFullEvent);
				break;
				
				case "NetStream.Play.PublishNotify":
				case "NetStream.Play.Start":
					// Creating the STREAMING event.
					var streamingEvt:StreamEvent = new StreamEvent(StreamEvent.STREAMING, true);
					// Dispatching the event.
					dispatchEvent(streamingEvt);
				break;
				
				case "NetStream.Play.Stop":
					// Creating the STREAMING_END event.
					var streamingEndEvt:StreamEvent = new StreamEvent(StreamEvent.STREAMING_END, true);
					// Dispatching the event.
					.dispatchEvent(streamingEndEvt);
				break;
				
				case "NetStream.Play.UnpublishNotify":
					// Creating the STREAMING_OFF event.
					var streamingOffEvt:StreamEvent = new StreamEvent(StreamEvent.STREAMING_OFF, true);
					// Dispatching the event.
					dispatchEvent(streamingOffEvt);
				break;
				
				case "NetStream.Play.InsufficientBW":
					// Creating the INSUFFICIENT event.
					var streamingInsufficient:StreamEvent = new StreamEvent(StreamEvent.INSUFFICIENT, true);
					// Dispatching the event.
					dispatchEvent(streamingInsufficient);
				break;
			}
		}
		
		/**
		 * Initializes the streaming connection.
		 * 
		 * @return void
		 */
		private function initStreaming():void {
			// Creating the NetStream object.
			_netstream = new NetStream(_netconn);
			// Setting the NetStream client.
			_netstream.client = this;
			// Adding the NET_STATUS event listener.
			_netstream.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			// Creating the STREAM_READY event.
			var streamEvt:StreamEvent = new StreamEvent(StreamEvent.STREAM_READY, true);
			// Creating a reference to the net stream object.
			streamEvt.stream = _netstream;
			// Dispatching the event.
			dispatchEvent(streamEvt);
		}
	}
}