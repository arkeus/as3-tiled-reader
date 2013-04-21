package io.arkeus.tiled {
	/**
	 * A container holding all the layers within the map. Provides utility functions for grabbing
	 * visible layers, tile layers, and all layers.
	 */
	/**
	 * 
	 * @author Lee
	 */
	public class TiledLayers {
		/** The vector of layers in order from bottom to top. */
		public var layers:Vector.<TiledLayer>;
		
		public function TiledLayers() {
			layers = new Vector.<TiledLayer>;
		}
		
		/**
		 * Adds a layer on top of all other layers.
		 * 
		 * @param layer The layer to add.
		 */
		public function addLayer(layer:TiledLayer):void {
			layers.push(layer);
		}
		
		/**
		 * Returns a vector of all layers in order from bottom to top.
		 * 
		 * @return The vector of all layers. 
		 */
		public function getAllLayers():Vector.<TiledLayer> {
			return layers;
		}
		
		/**
		 * Returns a vector of all visible layers in order from bottom to top.
		 * 
		 * @return The vector of all visible layers. 
		 */
		public function getVisibleLayers():Vector.<TiledLayer> {
			return layers.filter(function(el:TiledLayer, i:int, arr:Vector.<TiledLayer>):Boolean { return el.visible; });
		}
		
		/**
		 * Returns a vector of all tile layers in order from bottom to top.
		 * 
		 * @return The vector of all tile layers. 
		 */
		public function getTileLayers():Vector.<TiledLayer> {
			return layers.filter(function(el:TiledLayer, i:int, arr:Vector.<TiledLayer>):Boolean { return el is TiledTileLayer; });
		}
		
		/**
		 * Returns the number of layers in the map.
		 * 
		 * @return The number of layers. 
		 */
		public function get length():uint {
			return layers.length;
		}
		
		/**
		 * Overwrites toString to simple return the number of layers.
		 */
		public function toString():String {
			return length + " layers";
		}
	}
}
