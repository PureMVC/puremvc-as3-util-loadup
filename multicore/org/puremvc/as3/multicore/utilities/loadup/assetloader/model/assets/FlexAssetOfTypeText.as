/*
	PureMVC Utility - Loadup
	Copyright (c) 2008-10 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets
{
	import mx.core.UIComponent;
	import mx.controls.TextArea;

    import org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces.IAssetForFlex;

	public class FlexAssetOfTypeText extends FlashAssetOfTypeText implements IAssetForFlex
	{
        private var _uiComponent :UIComponent;

		public function FlexAssetOfTypeText( url :String ) {
		    super( url );
		}
		/**
		 *    A TextArea component containing this asset's text.
		 */
		public function get uiComponent() :UIComponent {
		    if ( ! data )
		        return null;
		    if ( ! _uiComponent ) {
		        var txa :TextArea = new TextArea();
		        txa.text = data.toString();
		        _uiComponent = txa;
		    }
		    return _uiComponent;
		}

	}
}
