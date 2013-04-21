package io.arkeus.tiled {
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import io.arkeus.tiled.base64.Base64;

	public class TiledUtils {
		/**
		 * Converts a string in the format "#rrggbb" or "rrggbb" to the corresponding
		 * uint representation.
		 * 
		 * @param color The color in string format.
		 * @return The color in uint format.
		 */
		public static function colorStringToUint(color:String):uint {
			return uint("0x" + color.replace("#", ""));
		}
		
		/**
		 * Given a tiled data string for a single layer, returns an array of arrays containing
		 * the tile information for that layer. Each inner array is a single row of the map.
		 * 
		 * @param string The tiled data string.
		 * @param mapWidth The width of the map, in tiles.
		 * @param encoding The encoding used by tiled to generate the string.
		 * @param compression The compression used by tiled to generate the string.
		 * @return The array of arrays containing the parsed map data.
		 */
		public static function stringToTileData(string:String, mapWidth:uint, encoding:String, compression:String):Array {
			return byteArrayToMapData(decompressByteArray(decodeString(string, encoding), compression), mapWidth);
		}
		
		/**
		 * Given a string and an encoding method, returns the string decoded as a byte array.
		 * 
		 * @param string The string to decode.
		 * @param encoding The encoding that was used to encode the string.
		 * @return The decoded byte array.
		 */
		private static function decodeString(string:String, encoding:String):ByteArray {
			switch (encoding) {
				case "csv":
					return stringToByteArray(string);
				case "base64":
					return Base64.decode(string);
				default:
					throw new Error("Unsupported encoding: " + encoding);
			}
		}
		
		/**
		 * Given a byte array and a compression method, returns the uncompressed byte array.
		 * 
		 * @param data The byte array to decode.
		 * @param compression The compression that was used to compress the byte array.
		 * @return The uncompressed byte array.
		 */
		private static function decompressByteArray(data:ByteArray, compression:String):ByteArray {
			switch (compression) {
				case "gzip":
					throw new Error("gzip is unsupported, change Tiled preferences to use zlib");
				case "zlib":
					data.uncompress();
					data.endian = Endian.LITTLE_ENDIAN;
					return data;
				case null:
					return data;
				default:
					throw new Error("Unsupported compression: " + compression);
			}
		}
		
		/**
		 * Given a string, returns the corresponding byte array representation of that string.
		 * 
		 * @param string The string to convert.
		 * @return The converted byte array.
		 */
		private static function stringToByteArray(string:String):ByteArray {
			var byteArray:ByteArray = new ByteArray;
			byteArray.writeUTFBytes(string);
			return byteArray;
		}
		
		/**
		 * Given a decoded, uncompressed byte array, translates the byte array to an array
		 * of arrays, where each inner array is a single row in the map, and each element
		 * is a tile id.
		 * 
		 * @param data The decoded, uncompressed byte array.
		 * @param mapWidth The width of the map, in tiles. Each row should be the same width.
		 * @return The array of arrays representing the map data.
		 */
		private static function byteArrayToMapData(data:ByteArray, mapWidth:uint):Array {
			var map:Array = [], row:Array = [];
			while (data.position < data.length) {
				if (row.length == mapWidth) {
					map.push(row);
					row = [];
				}
				row.push(data.readInt());
			}
			map.push(row);
			return map;
		}
	}
}
