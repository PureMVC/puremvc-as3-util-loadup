## [PureMVC](http://puremvc.github.com/) [ActionScript 3](https://github.com/PureMVC/puremvc-as3-standard-framework/wiki) Utility: Loadup (Flex/AIR)
The Loadup utility offers a solution to the problem of how to manage the asynchronous loading of Model resources and view assets at anytime during application runtime. It supports loading order dependencies, retry policies, and is progress-aware.

Standard and MultiCore versions are included.

* [API Docs](http://darkstar.puremvc.org/content_header.html?url=http://puremvc.org/pages/docs/AS3/Utility_AS3_Loadup/asdoc/&desc=PureMVC%20Standard%20Docs%20AS3%20Utility:%20Loadup)
* [Discussion](http://forums.puremvc.org/index.php?topic=1397.0)

## Status
Production - [Version 2.1](https://github.com/PureMVC/puremvc-as3-util-loadup/blob/master/VERSION)

## Demos Using This Utility
* [Loadup as Ordered](https://github.com/PureMVC/puremvc-as3-demo-flex-loadupasordered/wiki)
* [Loadup for Assets](https://github.com/PureMVC/puremvc-as3-demo-flex-loadupforassets/wiki)

## Platforms / Technologies
* [ActionScript 3](http://en.wikipedia.org/wiki/ActionScript)
* [Flex](http://en.wikipedia.org/wiki/Adobe_Flex)
* [Flash](http://en.wikipedia.org/wiki/Adobe_flash)

## Key Functionality
In the context of the PureMVC framework, the application typically has a !StartupCommand that manages the instantiation of essential actors like Proxies and Mediators.  At this time, you may also want to prime the application with some resources, for example data, before allowing user interaction. This utility offers a way of doing that.  It enables the application to do the following:
* State how the resource loading should be sequenced so that dependent resources are loaded in correct order.
* Be aware of the progress of the resource loading.
* Know when the resource loading is complete.
* Asset loading.

## Changes in Version 2.1
As a consequence of the flash support, in order to provide swcs that exclude flex content, there are now 4 swcs instead of 2. A new ant script build.xml defines the 4 builds. The swcs have been renamed, to express the flex/flash distinction. As regards source code changes, the existing asset classes that were flex-specfic have been renamed to include "Flex" in the class name.

Enhancements to asset loader feature:
* New audio asset, based on Sound class, for mp3 files
* New video asset, for flv/f4v files
* All asset types now have a flash version and a flex version.

## Changes in Version 2.0
This version of the utility is called Loadup instead of StartupManager, to remove the inference that the utility is only relevant at application startup. Class names and some other names have changed accordingly, see the separate migration instructions, migrationToV2.txt. Apart from the name change, features that are new are set out below.
* The last backward compatible version of the 1.x line is 1.6.1, and it will remain in the StartupManager_1_x branch of the repository in case bug fixes  to the 1.x line are required.
* LoadupMonitorProxy (monitor) constructor now takes proxyName as an arg (optional), thus enabling concurrent instances; for an example of this, see the LoadupForAssets demo. 
* Property jobId has been dropped - see migration instructions.
* On notifications sent by Loadup, the type is the monitor proxyName.
* On loaded and failed notifications sent by the client app, if the monitor proxyName is not the default name, the notification type MUST BE the monitor proxyName.
* IResourceList methods addResource and addResources have a changed signature, to include an arg that references the monitor instance. Existing usage that passes an IResourceList as the data arg to the monitor constructor must change to (null,data) since data is now the second optional arg, proxyName being the first. 
* IResourceList has new method isToBeKeptOpen.
* IRetryParameters has a new parameter, to switch on exponential backoff logic when RetryPolicy applies the retry interval.
* See the LoadupAsOrdered demo, version 2, this is the replacement for the StartupAsOrdered demo.
* Existing users of the assetLoader facility, note the following:   
* Classes LoadAssetGroupCommand and LoadingInstructions have been dropped, it is recommended that users develop their own solution; 
  * See the LoadupForAssets demo, version 2, for a sample solution; 
  * This is he replacement for the StartupForAssets demo; this demo also has new functionality.

## Changes in Version 1.6.1
This release is backward compatible.
* Method addResourceViaStartupProxy() of StartupMonitorProxy now registers the new StartupResourceProxy objects. For background, see [this post](http://forums.puremvc.org/index.php?topic=259.msg4604#msg4604)

## Changes in Version 1.6
This release is backward compatible.
Within asset loader feature, in AssetFactory class: 
* Support for .css urls as asset type Text, plus defaulting to type Text, hence reduced likelihood of 'unexpected url type' as an Error condition.
* Within StartupMonitorProxy class: new cleanup method, to remove StartupResourceProxy objects from proxy map; also, the reset method now includes this cleanup of SRP objects. 

## Changes in Version 1.5
This release is backward compatible.
* New class StartupManager has public consts, as an alternative to StartupMonitorProxy.
* Asset Loader feature; see API docs and Startup for Assets demo.

## Changes in Version 1.4
This release is backward compatible. A MultiCore version has been added, in the multicore source folder. Both swc's are included in the bin folder, be sure to use the one appropriate to your PureMVC version. Otherwise in general, increased exposure of state and behaviour, to facilitate easier public access and easier adaptation by inheritance. 
* In StartupMonitorProxy: public access to sendProgressNotification() and allResourcesLoaded(); 
* New addResourceViaStartupProxy() method; 
* New getResourceViaStartupProxyName() method;  
* Allow override of notification name for 'waiting for more resources';
* New jobId property, included as type on all sent notifications.
* In ResourceList: some vars changed from private to protected access; 
* Now responsible for progress percentage calculation;
* New getResourceViaStartupProxyName() method.
* In RetryPolicy: increased exposure of state vars; 
* Interface !IRetryPolicy has additional behaviour, to match that of RetryPolicy.
* In RetryParameters: some vars changed from private to protected access.
    
## Changes in Version 1.3
* Added reset() method on StartupMonitorProxy; 
* Added support for retry policy with automatic retries etc.; 
* Added support for open-ended resource list. There are interfaces for retry policy and for resource list.

## Migration from prior Versions
Version 1.3 breaks backward compatibility with the previous release. Migration is as follows, using the word 'monitor' for the instance of StartupMonitorProxy.
* Replace monitor.defaultTimeout = nn, by monitor.defaultRetryPolicy = new RetryPolicy(new RetryParameters(0,0,nn))
* RetryPolicy and RetryParameters are in the model package
* Review the API documentation to decide what to pass to !RetryParameters
* Replace monitor.retryLoadResources() by monitor.tryToCompleteLoadResources()
* Remove LOAD_RESOURCES_REJECTED from notification interests and handling
* Additional notifications are: RETRYING_LOAD_RESOURCE and WAITING_FOR_MORE_RESOURCES.

## Changes in Version 1.2
* Refactored source into src folder

## Changes in Version 1.1
* Cater for timeout.  
* Provides better overall functionality.

## Features in Version 1.0
* Initial release. Works with  PureMVC 2.0 
* Extracted from the StartupAsOrdered demo.

## License
* PureMVC AS3 Utility - Loadup - Copyright © 2007-2010 Daniele Ugoletti, Joel Caballer, Philip Sexton
* PureMVC - Copyright © 2007-2012 Futurescale, Inc.
* All rights reserved.

* Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
  * Neither the name of Futurescale, Inc., PureMVC.org, nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.