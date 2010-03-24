/*
	PureMVC Utility - Loadup
	Copyright (c) 2010 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model
{
    import flash.net.URLRequest;
    import flash.net.URLLoaderDataFormat;

    import org.puremvc.as3.multicore.utilities.loadup.Loadup;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces.IAssetTypeMap;

    /**
     *  Abstract class. Subclasses must set the <code>map</code> property; see class FlexAssetTypeMap
     *  as an example.
     *  <p>
     *  An asset must have a type; the default types are Image, Text, Swf, Sound and Video.</p>
     *  <p>
     *  Each asset type maps to...<ul>
     *  <li>an asset class</li>
     *  <li>an asset loader class</li>
     *  <li>a LoaderContext object (optional)</li>
     *  <li>a URLRequest object (optional)</li>
     *  <li>a loader dataFormat object (optional).</li></ul></p>
     *  <p>
     *  LoaderContext is relevant when Loader.load() requires a non-null context argument.</p>
     *  <p>
     *  URLRequest is relevant, as used by loaders, when it requires particular property settings,
     *  for example, the requestHeaders property.</p>
     *  <p>
     *  Loader dataFormat is relevant when the loader is required to use a dataFormat other than its default.</p>
     *  <p>
     *  It is assumed that a type that maps to a LoaderContext object, must also map to the 
     *  AssetLoadByLoader class in the main map. Likewise, it is assumed that a type that maps to a 
     *  loader dataFormat object, must also map to the AssetLoadByURLLoader class in the main map.</p>
     */
	public class AssetTypeMapBase implements IAssetTypeMap
	{
    	protected function defaultMapToLoaderContext() :Object {
    	    var obj :Object = new Object();
    	    /*--------------
    	    *  For example...
    	    obj[ Loadup.xxxxx_ASSET_TYPE ]     = new LoaderContext( whatever );
    	    obj[ Loadup.yyyyy_ASSET_TYPE ]     = new SoundLoaderContext( whatever );
    	    ...
    	    ----------------*/
    	    return obj;
    	}

    	protected function defaultMapToURLRequest() :Object {
    	    var obj :Object = new Object();
    	    /*---------------
    	    *  For example...
    	    var ureq :URLRequest;
    	    ureq = new URLRequest();
    	    ureq.xxx = whatever
    	    ureq.yyy = whatever
    	    ...
    	    obj[ Loadup.xxxxx_ASSET_TYPE ] = ureq;
    	    ureq = new URLRequest();
    	    ureq.aaa = whatever
    	    ureq.bbb = whatever
    	    ...
    	    obj[ Loadup.yyyyy_ASSET_TYPE ] = ureq;
    	    ...
    	    ---------------*/
    	    return obj;
    	}

    	protected function defaultMapToLoaderDataFormat() :Object {
    	    var obj :Object = new Object();
    	    obj[ Loadup.VIDEO_ASSET_TYPE ] = URLLoaderDataFormat.BINARY;
    	    return obj;
    	}

        /**
         *  Must be populated by a subclass, with each property being set by a statement like the following
         *  <p><code>map[ asset type string ] = [ asset type class, asset type loader ];</code></p>
         *  See class FlexAssetTypeMap as an example of a subclass. 
         */
        protected var map :Object;

        /**
         *  Could be empty, only use when required.
         */
        protected var mapToLoaderContext :Object;

        /**
         *  Could be empty, only use when required.
         */
        protected var mapToURLRequest :Object;

        /**
        *  Could be empty, only use when required.
        */
        protected var mapToLoaderDataFormat :Object;

		public function AssetTypeMapBase( mapToLoaderContext :Object = null, 
		    mapToURLRequest :Object = null, mapToLoaderDataFormat :Object = null )
		{
            this.mapToLoaderContext = ( mapToLoaderContext ? mapToLoaderContext : defaultMapToLoaderContext() );
            this.mapToURLRequest = ( mapToURLRequest ? mapToURLRequest : defaultMapToURLRequest() );
            this.mapToLoaderDataFormat = 
                ( mapToLoaderDataFormat ? mapToLoaderDataFormat : defaultMapToLoaderDataFormat() );
		}

        public function getAssetClass( assetType :String ) :Class {
            return map ? map[ assetType ][0] : null;
        }

        public function getAssetLoaderClass( assetType :String ) :Class {
            return map ? map[ assetType ][1] : null;
        }

        //public function getLoaderContext( assetType :String ) :LoaderContext {
        public function getLoaderContext( assetType :String ) :* {
            return mapToLoaderContext[ assetType ];
        }
        public function getURLRequest( assetType :String ) :URLRequest {
            return mapToURLRequest[ assetType ];
        }
        public function getLoaderDataFormat( assetType :String ) :String {
            return mapToLoaderDataFormat[ assetType ];
        }

	}
}
