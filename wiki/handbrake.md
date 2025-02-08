# HandBrake

[HandBrake](handbrake.md) is an open-source and multi-platform program that can compress video
files.

## Setup

Various ways to set up HandBrake can be found on
[their website](https://handbrake.fr/downloads.php).

## Usage

On [Windows](/wiki/windows.md) and Mac the program can be started by clicking the icon.
This way is also possible on [Linux based operating systems](/wiki/linux.md).
Additionally the command `ghb` can be called in the [Terminal](/wiki/linux/shell.md).

### Presets

Presets are used to store settings that specify the transcoding of video files.

#### Importing and Exporting Presets

Presets can be imported and exported from HandBrake by selecting `Presets`, `Actions` and then
`Import` or `Export`.

#### Simple 1080p AC-3 Encoding

The following is a preset that is a `.json` file which is used for the transcoding of movies to
1080p and AC-3 audio.
This can save some disc space.

```json
{
    "PresetList": [
        {
            "AlignAVStart": true,
            "AudioCopyMask": [
                "copy:aac",
                "copy:ac3"
            ],
            "AudioEncoderFallback": "av_aac",
            "AudioLanguageList": [
                "any"
            ],
            "AudioList": [
                {
                    "AudioBitrate": 192,
                    "AudioCompressionLevel": -1.0,
                    "AudioDitherMethod": "auto",
                    "AudioEncoder": "av_aac",
                    "AudioMixdown": "7point1",
                    "AudioNormalizeMixLevel": false,
                    "AudioSamplerate": "auto",
                    "AudioTrackDRCSlider": 0.0,
                    "AudioTrackGainSlider": -20.0,
                    "AudioTrackQuality": 3.0,
                    "AudioTrackQualityEnable": false
                }
            ],
            "AudioSecondaryEncoderMode": false,
            "AudioTrackSelectionBehavior": "all",
            "ChapterMarkers": true,
            "ChildrenArray": [],
            "Default": true,
            "FileFormat": "av_mp4",
            "Folder": false,
            "FolderOpen": false,
            "InlineParameterSets": false,
            "MetadataPassthrough": true,
            "Mp4HttpOptimize": false,
            "Mp4iPodCompatible": false,
            "PictureAllowUpscaling": false,
            "PictureAutoCrop": true,
            "PictureBottomCrop": 140,
            "PictureChromaSmoothCustom": "",
            "PictureChromaSmoothPreset": "off",
            "PictureChromaSmoothTune": "none",
            "PictureColorspaceCustom": "",
            "PictureColorspacePreset": "off",
            "PictureCombDetectCustom": "",
            "PictureCombDetectPreset": "default",
            "PictureCropMode": 0,
            "PictureDARWidth": 1920,
            "PictureDeblockCustom": "strength=strong:thresh=20:blocksize=8",
            "PictureDeblockPreset": "off",
            "PictureDeblockTune": "medium",
            "PictureDeinterlaceCustom": "",
            "PictureDeinterlaceFilter": "decomb",
            "PictureDeinterlacePreset": "default",
            "PictureDenoiseCustom": "",
            "PictureDenoiseFilter": "off",
            "PictureDenoisePreset": "",
            "PictureDenoiseTune": "none",
            "PictureDetelecine": "off",
            "PictureDetelecineCustom": "",
            "PictureForceHeight": 0,
            "PictureForceWidth": 0,
            "PictureHeight": 1080,
            "PictureItuPAR": false,
            "PictureKeepRatio": true,
            "PictureLeftCrop": 0,
            "PictureModulus": 2,
            "PicturePAR": "auto",
            "PicturePARHeight": 1,
            "PicturePARWidth": 1,
            "PicturePadBottom": 0,
            "PicturePadColor": "black",
            "PicturePadLeft": 0,
            "PicturePadMode": "none",
            "PicturePadRight": 0,
            "PicturePadTop": 0,
            "PictureRightCrop": 0,
            "PictureRotate": "angle=0:hflip=0",
            "PictureSharpenCustom": "",
            "PictureSharpenFilter": "off",
            "PictureSharpenPreset": "",
            "PictureSharpenTune": "",
            "PictureTopCrop": 138,
            "PictureUseMaximumSize": true,
            "PictureWidth": 1920,
            "PresetDescription": "Super high quality H.264 video (up to 1080p30), AAC stereo audio, and Dolby Digital (AC-3) surround audio, in an MP4 container.",
            "PresetDisabled": false,
            "PresetName": "Film, H.264 1080p slow, AC-3",
            "SubtitleAddCC": false,
            "SubtitleAddForeignAudioSearch": true,
            "SubtitleAddForeignAudioSubtitle": false,
            "SubtitleBurnBDSub": false,
            "SubtitleBurnBehavior": "none",
            "SubtitleBurnDVDSub": false,
            "SubtitleLanguageList": [],
            "SubtitleTrackSelectionBehavior": "none",
            "Type": 1,
            "UsesPictureFilters": true,
            "VideoAvgBitrate": 15000,
            "VideoColorMatrixCodeOverride": 0,
            "VideoEncoder": "x264",
            "VideoFramerate": "auto",
            "VideoFramerateMode": "vfr",
            "VideoGrayScale": false,
            "VideoHWDecode": 0,
            "VideoLevel": "4.1",
            "VideoOptionExtra": "ref=5:bframes=5",
            "VideoPreset": "slower",
            "VideoProfile": "high",
            "VideoQSVDecode": false,
            "VideoQualitySlider": 18.0,
            "VideoQualityType": 2,
            "VideoScaler": "swscale",
            "VideoTune": "film",
            "VideoTurboTwoPass": false,
            "VideoTwoPass": true,
            "x264Option": "",
            "x264UseAdvancedOptions": false
        }
    ],
    "VersionMajor": 50,
    "VersionMicro": 0,
    "VersionMinor": 0
}
```

Another possible preset is the following.

```json
{
    "PresetList": [
        {
            "AlignAVStart": true,
            "AudioCopyMask": [],
            "AudioEncoderFallback": "none",
            "AudioLanguageList": [
                "eng",
                "deu"
            ],
            "AudioList": [
                {
                    "AudioBitrate": 512,
                    "AudioCompressionLevel": -1.0,
                    "AudioDitherMethod": "auto",
                    "AudioEncoder": "fdk_aac",
                    "AudioMixdown": "5point1",
                    "AudioNormalizeMixLevel": false,
                    "AudioSamplerate": "auto",
                    "AudioTrackDRCSlider": 0.0,
                    "AudioTrackGainSlider": 0.0,
                    "AudioTrackQuality": 3.0,
                    "AudioTrackQualityEnable": false
                }
            ],
            "AudioSecondaryEncoderMode": true,
            "AudioTrackSelectionBehavior": "first",
            "ChapterMarkers": true,
            "ChildrenArray": [],
            "Default": true,
            "FileFormat": "av_mp4",
            "Folder": false,
            "FolderOpen": false,
            "InlineParameterSets": false,
            "MetadataPassthrough": false,
            "Mp4HttpOptimize": false,
            "Mp4iPodCompatible": false,
            "PictureAllowUpscaling": false,
            "PictureAutoCrop": true,
            "PictureBottomCrop": 18,
            "PictureChromaSmoothCustom": "",
            "PictureChromaSmoothPreset": "off",
            "PictureChromaSmoothTune": "none",
            "PictureColorspaceCustom": "",
            "PictureColorspacePreset": "off",
            "PictureCombDetectCustom": "",
            "PictureCombDetectPreset": "default",
            "PictureDARWidth": 1904,
            "PictureDeblockCustom": "strength=strong:thresh=20:blocksize=8",
            "PictureDeblockPreset": "off",
            "PictureDeblockTune": "medium",
            "PictureDeinterlaceCustom": "",
            "PictureDeinterlaceFilter": "decomb",
            "PictureDeinterlacePreset": "default",
            "PictureDenoiseCustom": "",
            "PictureDenoiseFilter": "off",
            "PictureDenoisePreset": "",
            "PictureDenoiseTune": "none",
            "PictureDetelecine": "off",
            "PictureDetelecineCustom": "",
            "PictureForceHeight": 0,
            "PictureForceWidth": 0,
            "PictureHeight": 0,
            "PictureItuPAR": false,
            "PictureKeepRatio": true,
            "PictureLeftCrop": 16,
            "PictureLooseCrop": false,
            "PictureModulus": 2,
            "PicturePAR": "auto",
            "PicturePARHeight": 1,
            "PicturePARWidth": 1,
            "PicturePadBottom": 0,
            "PicturePadColor": "black",
            "PicturePadLeft": 0,
            "PicturePadMode": "none",
            "PicturePadRight": 0,
            "PicturePadTop": 0,
            "PictureRightCrop": 0,
            "PictureRotate": "angle=0:hflip=0",
            "PictureSharpenCustom": "",
            "PictureSharpenFilter": "off",
            "PictureSharpenPreset": "",
            "PictureSharpenTune": "",
            "PictureTopCrop": 20,
            "PictureUseMaximumSize": true,
            "PictureWidth": 0,
            "PresetDescription": "H.264 video (up to 1080p30) and AAC stereo audio, in an MP4 container.",
            "PresetDisabled": false,
            "PresetName": "Hohes Profil Universell 3.0 (u3)",
            "SubtitleAddCC": false,
            "SubtitleAddForeignAudioSearch": false,
            "SubtitleAddForeignAudioSubtitle": false,
            "SubtitleBurnBDSub": false,
            "SubtitleBurnBehavior": "none",
            "SubtitleBurnDVDSub": false,
            "SubtitleLanguageList": [],
            "SubtitleTrackSelectionBehavior": "none",
            "Type": 1,
            "UsesPictureFilters": true,
            "VideoAvgBitrate": 6000,
            "VideoColorMatrixCodeOverride": 0,
            "VideoEncoder": "x264",
            "VideoFramerate": "auto",
            "VideoFramerateMode": "vfr",
            "VideoGrayScale": false,
            "VideoLevel": "4.1",
            "VideoOptionExtra": "",
            "VideoPreset": "slow",
            "VideoProfile": "high",
            "VideoQSVDecode": false,
            "VideoQualitySlider": 18.0,
            "VideoQualityType": 2,
            "VideoScaler": "swscale",
            "VideoTune": "",
            "VideoTurboTwoPass": true,
            "VideoTwoPass": true,
            "x264Option": "",
            "x264UseAdvancedOptions": false
        }
    ],
    "VersionMajor": 47,
    "VersionMicro": 0,
    "VersionMinor": 0
}
```

Another possible preset is the following.

```json 
{
    "PresetList": [
        {
            "AlignAVStart": true,
            "AudioCopyMask": [],
            "AudioEncoderFallback": "none",
            "AudioLanguageList": [
                "any"
            ],
            "AudioList": [
                {
                    "AudioBitrate": 512,
                    "AudioCompressionLevel": -1.0,
                    "AudioDitherMethod": "auto",
                    "AudioEncoder": "fdk_aac",
                    "AudioMixdown": "5point1",
                    "AudioNormalizeMixLevel": false,
                    "AudioSamplerate": "auto",
                    "AudioTrackDRCSlider": 0.0,
                    "AudioTrackGainSlider": 0.0,
                    "AudioTrackQuality": 3.0,
                    "AudioTrackQualityEnable": false
                }
            ],
            "AudioSecondaryEncoderMode": true,
            "AudioTrackSelectionBehavior": "all",
            "ChapterMarkers": true,
            "ChildrenArray": [],
            "Default": true,
            "FileFormat": "av_mp4",
            "Folder": false,
            "FolderOpen": false,
            "InlineParameterSets": false,
            "MetadataPassthrough": false,
            "Mp4iPodCompatible": false,
            "Optimize": false,
            "PictureAllowUpscaling": false,
            "PictureAutoCrop": true,
            "PictureBottomCrop": 166,
            "PictureChromaSmoothCustom": "",
            "PictureChromaSmoothPreset": "off",
            "PictureChromaSmoothTune": "none",
            "PictureColorspaceCustom": "",
            "PictureColorspacePreset": "off",
            "PictureCombDetectCustom": "",
            "PictureCombDetectPreset": "default",
            "PictureCropMode": 0,
            "PictureDARWidth": 1920,
            "PictureDeblockCustom": "strength=strong:thresh=20:blocksize=8",
            "PictureDeblockPreset": "off",
            "PictureDeblockTune": "medium",
            "PictureDeinterlaceCustom": "",
            "PictureDeinterlaceFilter": "decomb",
            "PictureDeinterlacePreset": "default",
            "PictureDenoiseCustom": "",
            "PictureDenoiseFilter": "off",
            "PictureDenoisePreset": "",
            "PictureDenoiseTune": "none",
            "PictureDetelecine": "off",
            "PictureDetelecineCustom": "",
            "PictureForceHeight": 0,
            "PictureForceWidth": 0,
            "PictureHeight": 0,
            "PictureItuPAR": false,
            "PictureKeepRatio": true,
            "PictureLeftCrop": 0,
            "PictureModulus": 2,
            "PicturePAR": "auto",
            "PicturePARHeight": 1,
            "PicturePARWidth": 1,
            "PicturePadBottom": 0,
            "PicturePadColor": "black",
            "PicturePadLeft": 0,
            "PicturePadMode": "none",
            "PicturePadRight": 0,
            "PicturePadTop": 0,
            "PictureRightCrop": 0,
            "PictureRotate": "angle=0:hflip=0",
            "PictureSharpenCustom": "",
            "PictureSharpenFilter": "off",
            "PictureSharpenPreset": "",
            "PictureSharpenTune": "",
            "PictureTopCrop": 166,
            "PictureUseMaximumSize": true,
            "PictureWidth": 0,
            "PresetDescription": "H.264 video (up to 1080p30) and AAC stereo audio, in an MP4 container.",
            "PresetDisabled": false,
            "PresetName": "u4",
            "SubtitleAddCC": false,
            "SubtitleAddForeignAudioSearch": false,
            "SubtitleAddForeignAudioSubtitle": false,
            "SubtitleBurnBDSub": false,
            "SubtitleBurnBehavior": "none",
            "SubtitleBurnDVDSub": false,
            "SubtitleLanguageList": [],
            "SubtitleTrackSelectionBehavior": "none",
            "Type": 1,
            "UsesPictureFilters": true,
            "VideoAvgBitrate": 6000,
            "VideoColorMatrixCodeOverride": 0,
            "VideoEncoder": "x264",
            "VideoFramerate": "auto",
            "VideoFramerateMode": "vfr",
            "VideoGrayScale": false,
            "VideoHWDecode": 0,
            "VideoLevel": "4.1",
            "VideoMultiPass": true,
            "VideoOptionExtra": "",
            "VideoPreset": "medium",
            "VideoProfile": "high",
            "VideoQSVDecode": false,
            "VideoQualitySlider": 18.0,
            "VideoQualityType": 2,
            "VideoScaler": "swscale",
            "VideoTune": "",
            "VideoTurboMultiPass": true,
            "x264Option": "",
            "x264UseAdvancedOptions": false
        }
    ],
    "VersionMajor": 56,
    "VersionMicro": 0,
    "VersionMinor": 0
}
```
