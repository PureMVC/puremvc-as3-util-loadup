/*
	PureMVC Utility - Loadup
	Copyright (c) 2008-10 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model
{
    import org.puremvc.as3.multicore.utilities.loadup.Loadup;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets.FlexAssetOfTypeImage;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets.FlexAssetOfTypeSwf;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets.FlexAssetOfTypeText;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets.FlexAssetOfTypeVideo;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets.FlexAssetOfTypeAudio;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.loaders.AssetLoadByLoader;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.loaders.AssetLoadByURLLoader;
    import org.puremvc.as3.multicore.utilities.loadup.assetloader.model.loaders.AssetLoadBySoundLoader;

    /**
     *  See the AssetTypeMapBase documentation.
     */
	public class FlexAssetTypeMap extends AssetTypeMapBase
	{
    	protected function defaultMap() :Object {
    	    var obj :Object = new Object();
            obj[ Loadup.IMAGE_ASSET_TYPE ] = [ FlexAssetOfTypeImage, AssetLoadByLoader ];
            obj[ Loadup.TEXT_ASSET_TYPE ]  = [ FlexAssetOfTypeText, AssetLoadByURLLoader ];
            obj[ Loadup.SWF_ASSET_TYPE ]   = [ FlexAssetOfTypeSwf, AssetLoadByLoader ];
            obj[ Loadup.AUDIO_ASSET_TYPE ] = [ FlexAssetOfTypeAudio, AssetLoadBySoundLoader ];
            obj[ Loadup.VIDEO_ASSET_TYPE ] = [ FlexAssetOfTypeVideo, AssetLoadByURLLoader ];
    	    return obj;
    	}

		public function FlexAssetTypeMap( map :Object = null, mapToLoaderContext :Object = null, 
		    mapToURLRequest :Object = null, mapToLoaderDataFormat :Object = null )
		{
		    super( mapToLoaderContext, mapToURLRequest, mapToLoaderDataFormat );
		    this.map = ( map ? map : defaultMap() );
		}

	}
}
