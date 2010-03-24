/*
	PureMVC Utility - Loadup
	Copyright (c) 2010 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
/*
	Copyright (c) 2010 Marc Kassay
	Your reuse is governed by the Creative Commons Attribution 3.0 License

    Part originally from:
    	PureMVC Utility - Loadup
    	Copyright (c) 2009 Philip Sexton <philip.sexton@puremvc.org>
    	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets
{
	import mx.controls.SWFLoader;
	import mx.controls.VideoDisplay;
	import mx.core.UIComponent;
	
	import org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces.IAssetForFlex;

	public class FlexAssetOfTypeVideo extends FlashAssetOfTypeVideo implements IAssetForFlex
	{
        private var _uiComponent :UIComponent;

		public function FlexAssetOfTypeVideo( url :String ) {
		    super( url );
		}

		/**
		 *    A VideoDisplay component linked to this asset.
		 *    <p>
		 *    This is based on the asset's url property, since there seems no way to associate the
		 *    VideoDisplay object with the asset's data property. As a consequence, it is assumed 
		 *    that the browser has cached the loaded data, based on the url, and will stream to the
		 *    VideoDisplay from the cached data.</p>
		 */
		public function get uiComponent() :UIComponent {
		    if ( ! data )
		        return null;
		    if ( ! _uiComponent ) {
		        var vDisplay :VideoDisplay = new VideoDisplay();
				vDisplay.source = url;
		        _uiComponent = vDisplay;
		    }
		    return _uiComponent;
		}

	}
}
