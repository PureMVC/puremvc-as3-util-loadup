/*
	PureMVC Utility - Loadup
	Copyright (c) 2008 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model.loaders
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.system.LoaderContext;
	import flash.net.URLRequest;

    import org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces.IAssetLoader;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.AssetProxy;

    /**
     *  The URLLoader class is used to load the asset. By default, the dataFormat is text, since that is the 
     *  URLLoader default. However, this class includes a dataFormat property so that the default can be
     *  overriden by any of the formats supported by URLLoader, for example, by setting the format to binary.
     */
	public class AssetLoadByURLLoader implements IAssetLoader
	{
 		protected const LOADER_CONTEXT_NOT_APPLICABLE_MSG :String =
 		    "AssetLoadByURLLoader, get/set loaderContext(), not applicable.";

        protected var assetProxy :AssetProxy;
        protected var loader :URLLoader;

        private var _urlRequest :URLRequest = new URLRequest();
        private var _dataFormat :String = null;

		public function AssetLoadByURLLoader( respondTo :AssetProxy ) {
		    this.assetProxy = respondTo;			
		}
		public function set urlRequest( request :URLRequest ) :void {
		    this._urlRequest = request;
		}
		public function get urlRequest() :URLRequest {
		    return this._urlRequest;
		}
		public function set dataFormat( format :String ) :void {
		    this._dataFormat = format;
		}
		public function get dataFormat() :String {
		    return this._dataFormat;
		}

        /**
         *  Present only to satisfy IAssetLoader interface.
         */
		public function set loaderContext( context :* ) :void {
		    throw new Error( LOADER_CONTEXT_NOT_APPLICABLE_MSG );
		}
        /**
         *  Present only to satisfy IAssetLoader interface.
         */
		public function get loaderContext() :* {
		    throw new Error( LOADER_CONTEXT_NOT_APPLICABLE_MSG );
		}

        public function load( url :String ) :void {
            loader = new URLLoader();
            addListeners( loader );
            urlRequest.url = url;

            // Override the default dataFormat, if a specific value has been set here.
            if ( dataFormat )
                loader.dataFormat = dataFormat;

            try {
                loader.load( urlRequest );
            } catch ( e :SecurityError ) {
                assetProxy.loadingSecurityError( "Error, id:" + e.errorID.toString() + ", msg:" + e.message );
            }
        }

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
            assetProxy.loadingComplete( loader.data );
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
