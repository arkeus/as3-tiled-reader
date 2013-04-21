package io.arkeus.tiled {
	/**
	 * Represents a single tile layer within a map.
	 */
	public class TiledTileLayer extends TiledLayer {
		/** The encoding used on the layer data. */
		public var encoding:String;
		/** The compression used on the layer data. */
		public var compression:String;
		/** The parsed layer data, uncompressed and unencoded. */
		public var data:Array;

		public function TiledTileLayer(tmx:XML) {
			super(tmx);
			
			var dataNode:XML = tmx.data[0];
			encoding = "@encoding" in dataNode ? dataNode.@encoding : null;
			compression = "@compression" in dataNode ? dataNode.@compression : null;
			data = TiledUtils.stringToTileData(dataNode.text(), width, encoding, compression);
		}
	}
}
