/*
	PureMVC Utility - Loadup
	Copyright (c) 2010 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
/*
 PureMVC AS3 MultiCore Pipes Demo – Loadup for Flash Demo
 Copyright (c) 2009 Frederic Saunier <frederic.saunier@puremvc.org>

 Parts originally from:

 PureMVC Utility - Loadup
 Copyright (c) 2008-09 Philip Sexton <philip.sexton@puremvc.org>

 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model
{
    import org.puremvc.as3.multicore.utilities.loadup.Loadup;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets.FlashAssetOfTypeImage;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets.FlashAssetOfTypeSwf;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets.FlashAssetOfTypeText;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets.FlashAssetOfTypeAudio;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets.FlashAssetOfTypeVideo;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.loaders.AssetLoadByLoader;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.loaders.AssetLoadByURLLoader;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.loaders.AssetLoadBySoundLoader;

    /**
     *  See the AssetTypeMapBase documentation.
     */
	public class FlashAssetTypeMap extends AssetTypeMapBase
	{
    	protected function defaultMap() :Object {
    	    var obj :Object = new Object();
            obj[ Loadup.IMAGE_ASSET_TYPE ] = [ FlashAssetOfTypeImage, AssetLoadByLoader ];
            obj[ Loadup.TEXT_ASSET_TYPE ]  = [ FlashAssetOfTypeText, AssetLoadByURLLoader ];
            obj[ Loadup.SWF_ASSET_TYPE ]   = [ FlashAssetOfTypeSwf, AssetLoadByLoader ];
            obj[ Loadup.AUDIO_ASSET_TYPE ] = [ FlashAssetOfTypeAudio, AssetLoadBySoundLoader ];
            obj[ Loadup.VIDEO_ASSET_TYPE ] = [ FlashAssetOfTypeVideo, AssetLoadByURLLoader ];
    	    return obj;
    	}

		public function FlashAssetTypeMap( map :Object = null, mapToLoaderContext :Object = null, 
		    mapToURLRequest :Object = null, mapToLoaderDataFormat :Object = null )
		{
		    super( mapToLoaderContext, mapToURLRequest, mapToLoaderDataFormat );
		    this.map = ( map ? map : defaultMap() );
		}

	}
}
