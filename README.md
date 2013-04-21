AS3 Tiled Reader
====

About
-----

Tiled Reader is an as3 tmx parser allowing you to read maps exported via the [Tiled Map Editor](http://www.mapeditor.org/ "Tiled Map Editor"). Tiled Reader was created to allow you to easily save your Tiled maps using the default format and load them in flash games.

Features
--------

Tiled Reader allows you to load maps that are compressed using zlib and encoded using base64. It takes advantage of the native flash zlib compression, and uses a very fast open source base64 library to decode your layer data.

Tiled Reader supports all major features of Tiled 0.9.0, including tile layers, object layers, image layers, properties, and terrain.

How To Use
----------

Using Tiled Reader is easy. You either either embed a TMX file directly into your application, or parse an XML object direct.

If you choose to use an embedded file, embed the map as follows:

    [Embed(source = "/map/world.tmx", mimeType = "application/octet-stream")] public static const WORLD:Class;

You can then load, and parse the map file as follows:

    var reader:TiledReader = new TiledReader;
    var map:TiledMap = reader.loadFromEmbedded(WORLD);

If you want to use an actual XML object, load the XML using any method you'd like (internally or externally), and simple use the loadFromXML function on TiledReader.

After loading the file, you can access layers, properties, and more from the returned TiledMap. Check out the TiledMap.as file's documentation for all attributes and functions.

Example
-------

To see an example of Tiled Reader being used, check out the [Axelite Moon](https://github.com/arkeus/axelite-moon "Axelite Moon") project.

Support
-------

If you find a bug, or notice that a feature isn't support, feel free to open an issue against the project!