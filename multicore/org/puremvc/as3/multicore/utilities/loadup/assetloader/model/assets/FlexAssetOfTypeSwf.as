/*
	PureMVC Utility - Loadup
	Copyright (c) 2008-10 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets
{
	import mx.core.UIComponent;
	import mx.controls.SWFLoader;

    import org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces.IAssetForFlex;

	public class FlexAssetOfTypeSwf extends FlashAssetOfTypeSwf implements IAssetForFlex
	{
        private var _uiComponent :UIComponent;

		public function FlexAssetOfTypeSwf( url :String ) {
		    super( url );
		}
		/**
		 *    A SWFLoader component containing this asset's swf data.
		 */
		public function get uiComponent() :UIComponent {
		    if ( ! data )
		        return null;
		    if ( ! _uiComponent ) {
		        var swf :SWFLoader = new SWFLoader();
		        swf.load( data );
		        _uiComponent = swf;
		    }
		    return _uiComponent;
		}

	}
}
