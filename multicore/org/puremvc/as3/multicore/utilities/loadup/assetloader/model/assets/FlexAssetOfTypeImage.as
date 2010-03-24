/*
	PureMVC Utility - Loadup
	Copyright (c) 2008-10 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets
{
	import mx.core.UIComponent;
	import mx.controls.Image;

    import org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces.IAssetForFlex;

	public class FlexAssetOfTypeImage extends FlashAssetOfTypeImage implements IAssetForFlex
	{
        private var _uiComponent :UIComponent;

		public function FlexAssetOfTypeImage( url :String ) {
		    super( url );
		}

		/**
		 *    An Image component containing this asset's data.
		 */
		public function get uiComponent() :UIComponent {
		    if ( ! data )
		        return null;
		    if ( ! _uiComponent ) {
		        var img :Image = new Image();
		        img.load( data);
		        _uiComponent = img;
		    }
		    return _uiComponent;
		}

	}
}
