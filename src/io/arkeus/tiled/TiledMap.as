package io.arkeus.tiled {
	/**
	 * A fully parsed tiled map. Contains all information about the map, including the
	 * parsed layers.
	 */
	public class TiledMap {
		/** The TMX format version, always 1.0 currently. */
		public var version:String;
		/** Map orientation, one of: orthogonal, isometric, stagerred. */
		public var orientation:String;
		/** The width of the map in tiles. */
		public var width:uint;
		/** The height of the map in tiles. */
		public var height:uint;
		/** The width of a tile in pixels. */
		public var tileWidth:uint;
		/** The height of a tile in pixels. */
		public var tileHeight:uint;
		/** The background color of the map. */
		public var backgroundColor:uint;
		/** Properties of the map. */
		public var properties:TiledProperties;
		/** A container containing information on the tilesets of the map. */
		public var tilesets:TiledTilesets;
		/** A container containing information on the layers of the map. */
		public var layers:TiledLayers;
		
		public function TiledMap(tmx:XML) {
			version = "@version" in tmx ? tmx.@version : "?";
			orientation = "@orientation" in tmx ? tmx.@orientation : "othogonal";
			width = tmx.@width;
			height = tmx.@height;
			tileWidth = tmx.@tilewidth;
			tileHeight = tmx.@tileheight;
			backgroundColor = "@backgroundcolor" in tmx ? TiledUtils.colorStringToUint(tmx.@backgroundcolor) : 0xffffff;
			properties = new TiledProperties(tmx.properties);
			tilesets = new TiledTilesets(tmx.tileset);
			parseLayers(tmx);
		}
		
		/**
		 * Parses the layers of the map, building the TiledLayers container containing information
		 * on each parsed layer. The order of the layers is kept intact, from bottom to top.
		 * 
		 * @param tmx The map object.
		 */
		private function parseLayers(tmx:XML):void {
			layers = new TiledLayers;
			
			// Parse all children, since for some reason layer and objectgroup aren't grouped easily, even though the ordering
			// between them can be very important. WHY BJORN, WHY?
			var elements:XMLList = tmx.children();
			for (var i:uint = 0; i < elements.length(); i++) {
				var name:QName = (elements[i] as XML).name();
				if (name.localName == "layer") {
					layers.addLayer(new TiledTileLayer(elements[i]));
				} else if (name.localName == "objectgroup") {
					layers.addLayer(new TiledObjectLayer(elements[i]));
				} else if (name.localName == "imagelayer") {
					layers.addLayer(new TiledImageLayer(elements[i]));
				}
			}
		}
		
		/**
		 * Converts the map to a string containing the main properties for debugging purposes.
		 * 
		 * @return The map in string format.
		 */
		public function toString():String {
			return [
				"Version: " + version,
				"Orientation: " + orientation,
				"Width: " + width,
				"Height: " + height,
				"TileWidth: " + tileWidth,
				"TileHeight: " + tileHeight,
				"BackgroundColor: " + backgroundColor,
				"Properties: " + properties,
				"Tilesets: " + tilesets,
				"Layers: " + layers,
			].join(", ");
		}
	}
}
