package io.arkeus.tiled {
	/**
	 * Reader for loading Tiled 0.9.0 maps.
	 */
	public class TiledReader {
		/**
		 * Creates a new TiledReader.
		 */
		public function TiledReader() {
		}
		
		/**
		 * Reads an embedded xml file and loads a TiledMap from it.
		 * 
		 * @param map The embedded class containing the tmx file.
		 * @return The fully parsed TiledMap.
		 */
		public function loadFromEmbedded(map:Class):TiledMap {
			return loadFromXML(new XML(new map));
		}
		
		/**
		 * Reads an XML object and loads a TiledMap from it.
		 * 
		 * @param map The XML object in default tmx file format.
		 * @return The fully parsed TiledMap.
		 */
		public function loadFromXML(map:XML):TiledMap {
			return new TiledMap(map);
		}
	}
}
