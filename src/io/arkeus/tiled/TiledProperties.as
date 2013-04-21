package io.arkeus.tiled {
	/**
	 * A container containing all properties of some part of the map. Many parts of the map, such
	 * as tiles, objects, layers, etc, can contain a set of properties. Each will have a properties
	 * value pointed to a TiledProperties object containing all properties.
	 */
	public class TiledProperties {
		/** The map containing the properties, keyed by name. */
		public var properties:Object = {};
		
		public function TiledProperties(properties:XMLList) {
			for (var i:uint = 0; i < properties.property.length(); i++) {
				set(properties.property[i].@name, properties.property[i].@value);
			}
		}
		
		/**
		 * Returns the property for the given key.
		 * 
		 * @param key The name of the property.
		 * @return The property value.
		 */
		public function get(key:String):String {
			return properties[key];
		}
		
		/**
		 * Sets the property for the given key to the given value.
		 * 
		 * @param key The name of the property.
		 * @param value The property value.
		 */
		public function set(key:String, value:String):void {
			properties[key] = value;
		}
		
		/**
		 * Creates a list of all properties.
		 */
		public function toString():String {
			var props:Vector.<String> = new <String>[];
			for (var key:String in properties) {
				props.push(key + "=" + properties[key]);
			}
			return "(" + props.join(", ") + ")";
		}
	}
}
