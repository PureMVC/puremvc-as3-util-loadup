/*
	PureMVC Utility - Loadup
	Copyright (c) 2010 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets
{
    import flash.net.NetConnection;
    import flash.net.NetStream;
    import flash.media.Video;

    import org.puremvc.as3.multicore.utilities.loadup.Loadup;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces.IAsset;

	public class FlashAssetOfTypeVideo extends AssetBase implements IAsset
	{
        private var _videoStream :NetStream;
        private var _video :Video;

		public function FlashAssetOfTypeVideo( url :String ) {
		    super( url );
		}
		public function get type() :String {
		    return Loadup.VIDEO_ASSET_TYPE;
		}

        /**
         *  The NetStream object for this video.
         *  <p>
         *  This is based on the asset's url property.  The asset's data property is not directly 
         *  referenced. It is assumed that the browser has cached the loaded data, based on the url, 
         *  and will stream from the cached data. This net stream is only set if the video asset is fully 
         *  loaded.</p>
         */
		public function get videoStream() :NetStream {
		    if ( ! _videoStream ) {
		        prepVideo();
		    }
		    return _videoStream;
		}

        /**
         *  The Video object for this video.
         *  <p>
         *  This is based on the asset's url property.  The asset's data property is not directly 
         *  referenced. It is assumed that the browser has cached the loaded data, based on the url, 
         *  and will stream from the cached data. This Video object is only set if the video asset is fully 
         *  loaded. The videoStream property provides access to the attached NetStream.</p>
         */
		public function get video() :Video {
		    if ( ! _video ) {
		        prepVideo();
		    }
		    return _video;
		}
		protected function prepVideo() :void {
		    if ( data )
    		    if ( ! _video ) {
    		        var conn :NetConnection = new NetConnection();
    		        conn.connect( null );
        		    _videoStream = new NetStream( conn );
        		    _video = new Video();
        		    _video.attachNetStream( _videoStream );
        		    _videoStream.play( url );
    		    }
		}

	}
}
