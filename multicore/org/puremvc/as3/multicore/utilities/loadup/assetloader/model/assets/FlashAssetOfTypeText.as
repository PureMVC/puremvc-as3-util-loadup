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
 Copyright (c) 2009 Philip Sexton <philip.sexton@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.multicore.utilities.loadup.assetloader.model.assets
{
	import org.puremvc.as3.multicore.utilities.loadup.Loadup;
	import org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces.IAsset;

	/**
	 * <code>AssetBase</code> object for text files in projects not using any
	 * Flex dependencies.
	 */
	public class FlashAssetOfTypeText
		extends AssetBase
		implements IAsset
	{
		/**
		 * Constructor.
		 * 
		 * @param url
		 * 		URL of the asset associated to this <code>AssetBase</code>
		 * 		object.
		 */
		public function FlashAssetOfTypeText( url:String )
		{
			super(url);
		}

		/**
		 * Type of this <code>AssetBase</code> object.
		 */
		public function get type():String
		{
			return Loadup.TEXT_ASSET_TYPE;
		}

		/**
		 * Loaded text content.
		 */
		public function get content():String
		{
			return data as String;
		}
	}
}
