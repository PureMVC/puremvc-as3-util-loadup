/*
	PureMVC Utility - Loadup
	Copyright (c) 2010 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets
{
	import mx.core.UIComponent;

    import org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces.IAssetForFlex;

	public class FlexAssetOfTypeAudio extends FlashAssetOfTypeAudio implements IAssetForFlex
	{
        private var _uiComponent :UIComponent;

		public function FlexAssetOfTypeAudio( url :String ) {
		    super( url );
		}

        /**
         *  An empty UIComponent object.
         *  <p>
         *  Exists to satisfy the IAssetForFlex interface.  Otherwise, of no value, though may be 
         *  enhanced in the future.  In the meantime, this asset's Sound object is available via the 
         *  data property of the asset, treating the asset as an IAsset object, e.g. 
         *  <code>var a123 :Sound = myAsset123.data as Sound;</code></p>
         */
		public function get uiComponent() :UIComponent {
		    if ( ! _uiComponent ) {
		        _uiComponent = new UIComponent();
		    }
		    return _uiComponent;
		}

	}
}
