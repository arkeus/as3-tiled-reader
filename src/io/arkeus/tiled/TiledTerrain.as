package io.arkeus.tiled {
	/**
	 * A container for the a terrain set within a tileset.
	 */
	public class TiledTerrain {
		/** The name of the terrain. */
		public var name:String;
		/** The tile representing the terrain, -1 if none. */
		public var tile:int;
		/** The terrain properties. */
		public var properties:TiledProperties;
		
		public function TiledTerrain(terrain:XML) {
			name = terrain.@name;
			tile = terrain.@tile;
			properties = new TiledProperties(terrain.properties);
		}
	}
}
