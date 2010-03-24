/*
	PureMVC Utility - Loadup
	Copyright (c) 2010 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
/*
	Copyright (c) 2010 Matthias Lohscheidt
	Your reuse is governed by the Creative Commons Attribution 3.0 License

    Part originally from:
    	PureMVC Utility - Loadup
    	Copyright (c) 2009 Philip Sexton <philip.sexton@puremvc.org>
    	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model.loaders
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundLoaderContext;
	
	import org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces.IAssetLoader;
	import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.AssetProxy;

	public class AssetLoadBySoundLoader implements IAssetLoader
	{
 		protected const LOADER_FORMAT_NOT_APPLICABLE_MSG :String =
 		    "AssetLoadBySoundLoader, get/set dataFormat(), not applicable.";

        private var assetProxy :AssetProxy;
        private var loader: Sound;

        private var _loaderContext :SoundLoaderContext;
        private var _urlRequest :URLRequest = new URLRequest();

		public function AssetLoadBySoundLoader( respondTo :AssetProxy ) {
		    this.assetProxy = respondTo;
		}
		public function set loaderContext( context :* ) :void {
		    this._loaderContext = context;
		}
		public function get loaderContext() :* {
		    return this._loaderContext;
		}
		public function set urlRequest( request :URLRequest ) :void {
		    this._urlRequest = request;
		}
		public function get urlRequest() :URLRequest {
		    return this._urlRequest;
		}

        /**
         *  Present only to satisfy IAssetLoader interface.
         */
		public function set dataFormat( format :String ) :void {
		    throw new Error( LOADER_FORMAT_NOT_APPLICABLE_MSG );
		}
        /**
         *  Present only to satisfy IAssetLoader interface.
         */
		public function get dataFormat() :String {
		    throw new Error( LOADER_FORMAT_NOT_APPLICABLE_MSG );
		}

        public function load( url :String ) :void {
            loader = new Sound();
            addListeners( loader );
            urlRequest.url = url;
            try {
                loader.load( urlRequest, loaderContext );
            } catch ( e :SecurityError ) {
                assetProxy.loadingSecurityError( "Error, id:" + e.errorID.toString() + ", msg:" + e.message );
            }
        }

        /**
         *  From experience, the SecurityErrorEvent is included,
         *  even though the Sound API does not specify it as an applicable Event.
         */
        protected function addListeners( dis :IEventDispatcher ) :void {
            dis.addEventListener( ProgressEvent.PROGRESS, progressHandler );
            dis.addEventListener( IOErrorEvent.IO_ERROR, ioErrorHandler );
            dis.addEventListener( Event.COMPLETE, completeHandler );
            dis.addEventListener( SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler );
        }
        protected function progressHandler( ev :ProgressEvent ) :void {
            assetProxy.loadingProgress( ev.bytesLoaded, ev.bytesTotal );
        }
        protected function completeHandler( ev :Event ) :void {
            assetProxy.loadingComplete( loader );
            removeListeners( loader );
        }
        protected function ioErrorHandler( ev :Event ) :void {
            assetProxy.loadingIOError( ev.toString() );
            removeListeners( loader );
        }
        protected function securityErrorHandler( ev :Event ) :void {
            assetProxy.loadingSecurityError( ev.toString() );
            removeListeners( loader );
        }

        protected function removeListeners( dis :IEventDispatcher ) :void {
            dis.removeEventListener( ProgressEvent.PROGRESS, progressHandler );
            dis.removeEventListener( IOErrorEvent.IO_ERROR, ioErrorHandler );
            dis.removeEventListener( Event.COMPLETE, completeHandler );
            dis.removeEventListener( SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler );
        }

	}
}
