/*
	PureMVC Utility - Loadup
	Copyright (c) 2008 Philip Sexton <philip.sexton@puremvc.org>
	Your reuse is governed by the Creative Commons Attribution 3.0 License
*/

package org.puremvc.as3.multicore.utilities.loadup.assetloader.interfaces
{
	import flash.system.LoaderContext;
	import flash.net.URLRequest;

    /**
     *  
     */
	public interface IAssetLoader {

		//function set loaderContext( context :LoaderContext ) :void;
		function set loaderContext( context :* ) :void;

		//function get loaderContext() :LoaderContext;
		function get loaderContext() :*;

		function set urlRequest( request :URLRequest ) :void;

		function get urlRequest() :URLRequest;

		function set dataFormat( format :String ) :void;

		function get dataFormat() :String;

		function load( url :String ) :void;

	}
}
