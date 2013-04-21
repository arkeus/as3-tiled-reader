package io.arkeus.tiled {
	/**
	 * A container that holds all tilesets within the map.
	 */
	public class TiledTilesets {
		/** A map from tileset tileset name to tileset. */
		public var tilesets:Object = {};
		/** A vector containing all tilesets in the order defined. */
		public var tilesetsVector:Vector.<TiledTileset> = new <TiledTileset>[];
		
		public function TiledTilesets(tmx:XMLList) {
			for (var i:uint = 0; i < tmx.length(); i++) {
				addTileset(tmx[i]);
			}
		}
		
		/**
		 * Given a <tileset> object, parses the tileset and adds it to both the map and vector.
		 * 
		 * @param tmx The <tileset> object.
		 */
		private function addTileset(tmx:XML):void {
			var tileset:TiledTileset = new TiledTileset(tmx);
			tilesets[tileset.name] = tileset;
			tilesetsVector.push(tileset);
		}
		
		/**
		 * Gets a tileset by index.
		 * 
		 * @param index The index into the vector.
		 * @return The tileset at the given index.
		 */
		public function getTileset(index:uint):TiledTileset {
			return tilesetsVector[index];
		}
		
		/**
		 * Gets a tileset by name.
		 * 
		 * @param name The name of the tilset.
		 * @return The tileset with the given name.
		 */
		public function getTilesetByName(name:String):TiledTileset {
			return tilesets[name];
		}
		
		/**
		 * Returns the number of tilesets in this map.
		 * 
		 * @return The number of tilesets.
		 */
		public function size():uint {
			return tilesetsVector.length;
		}
		
		/**
		 * Constructs a string containing the number of tilesets.
		 */
		public function toString():String {
			return size() + " tilesets";
		}
	}
}
