# HLExplicitImageView

Lightweight UIImageView subclass able to download an image with a single line of code, showing progress with tap-to-retry feature.

![HLExplicitImageView Sample](https://raw.githubusercontent.com/fiftydegrees/HLExplicitImageView/master/README-Files/hlexplicitimageview-demo0.gif)

## Installation

_**If your project doesn't use ARC**: you must add the `-fobjc-arc` compiler flag to `HLExplicitImageView.m` in Target Settings > Build Phases > Compile Sources._

* Simply drag the `./HLExplicitImageView` folder into your project.

## Usage

Either instantiate a new `HLExplicitImageView` instance from code, or make your UIImageView's instances of `HLExplicitImageView` in storyboard.

**Start a download:**

```
- (void)hl_setImageFromURL:(NSURL *)url;
```

**Get notified when a tap-to-retry succeded:**

Implement `HLExplicitImageViewDelegate' and implement this method:

```
- (void)explicitImageViewFinallySucceded:(HLExplicitImageView *)imageView;
```

You can use this method to automatically retry all downloads.

## Credits

HLExplicitImageView does use [SDWebImage](https://github.com/rs/SDWebImage) and [DACircularProgress](https://github.com/danielamitay/DACircularProgress) libraries.

HLExplicitImageView was developed by [Hervé Heurtault de Lammerville](http://www.hervedroit.com) for Photowizz app. If you have any feature suggestion or bug report, please help out by creating [an issue](https://github.com/fiftydegrees/HLExplicitImageView/issues/new) on GitHub.