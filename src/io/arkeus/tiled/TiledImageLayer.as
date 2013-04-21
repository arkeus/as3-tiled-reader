package io.arkeus.tiled {
	/**
	 * A class representing an <imagelayer> layer. In addition to the base layer properties,
	 * an image layer contains a single image.
	 */
	public class TiledImageLayer extends TiledLayer {
		/** The layer's image. */
		public var image:TiledImage;

		/**
		 * @param tmx The XML containing the <imagelayer> object.
		 */
		public function TiledImageLayer(tmx:XML) {
			super(tmx);
			image = new TiledImage(tmx.image);
		}
	}
}