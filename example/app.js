// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});

// TODO: write your module tests here
var TiColorArt = require('com.dezinezync.ticolorart');
Ti.API.info("module is => " + TiColorArt);

win.addEventListener("open", function() {
	var file1 = Ti.Filesystem.getFile(Ti.Filesystem.resourcesDirectory+"/image1.png");
	Ti.API.info("File 1:");
	Ti.API.info(TiColorArt.analyze(file1.resolve()));

	/*
	 * EXAMPLE OUTPUT
	 * OBJECT {
	 * 		backgroundColor = 1d1d25; (Each value is a string. Can be used directly in your Ti App)
	 * 		detailColor = 2f9fb7;
	 * 		primaryColor = 7b8191;
	 * 		secondaryColor = a8c4c8;
	 * }
	 */

	var file2 = Ti.Filesystem.getFile(Ti.Filesystem.resourcesDirectory+"/image2.jpg");
	Ti.API.info("File 2:");
	Ti.API.info(TiColorArt.analyze(file2.resolve()));
});

win.open();