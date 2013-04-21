package io.arkeus.tiled {
	/**
	 * Represents a layer in the map. Layers can be one of three types: TiledTileLayer (tile layer),
	 * TiledImageLayer (image layer), or TiledObjectLayer (object group).
	 */
	public class TiledLayer {
		/** The name of the layer. */
		public var name:String;
		/** The width of the layer. Usually equal to the map width. */
		public var width:uint;
		/** The height of the layer. Usually equal to the map height. */
		public var height:uint;
		/** The opacity of the map between 0.0 and 1.0. */
		public var opacity:Number;
		/** Whether or not this layer is set to be visible or not. */
		public var visible:Boolean;
		/** Layer properties. */
		public var properties:TiledProperties;
		
		/**
		 * @param tmx The XML containing the layer object.
		 */
		public function TiledLayer(tmx:XML) {
			name = tmx.@name;
			width = tmx.@width;
			height = tmx.@height;
			opacity = "@opacity" in tmx ? tmx.@opacity : 1.0;
			visible = !("@visible" in tmx && tmx.@visible == "0");
			properties = new TiledProperties(tmx.properties);
		}
	}
}
