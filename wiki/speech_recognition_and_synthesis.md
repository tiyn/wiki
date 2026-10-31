# Speech Recognition and Synthesis

Speech recognition describes the process of understanding and interpreting spoken language.
The most common form of this is speech-to-text (STT) programs, that convert spoken language into
text.
On the other hand speech synthesis describes the artificial production of human speech.
A Text-to-speech (TTS) program is one, that converts an input text to speech.

## Speech-to-Text Programs

The following is a list of STT programs.

- [Nerd Dictation](/wiki/linux/nerd-dictation.md) is a real-time offline speech recognition software
  for [Linux](/wiki/linux.md)-based operating systems which uses the [VOSK API](#vosk-api).
- [Whisper CLI](/wiki/linux/whisper-cli.md) is a non-real-time offline speech transcription software
  for [Linux](/wiki/linux.md)-based operating systems which uses the [Whisper API](#whisper-api).
- [Voxscribe](https://f-droid.org/packages/org.y20k.voxscribe/) is an offline voice input method for
  [Android](/wiki/android.md) [Whisper](#whisper-api) models.
  It is available thorugh [F-Droid](/wiki/android/f-droid.md)
  Voxscribe uses a push-to-talk interface, where the microphone button has to be held while
  speaking.
- [Whisper+](https://f-droid.org/en/packages/org.woheller69.whisperplus/) is an offline voice input
  method for [Android](/wiki/android.md) based on [Whisper](#whisper-api).
  It is available thorugh [F-Droid](/wiki/android/f-droid.md)
  It can be used as an Android input method (IME), for example through the microphone button of
  another keyboard.
  After the required models have been downloaded, speech recognition works completely offline.
  Recordings are limited to 30 seconds. Besides its regular push-to-talk mode, it provides an
  automatic mode in which recording can be stopped using a button.
- [Marmalade STT](https://f-droid.org/packages/app.marmalade.stt/) is an offline speech-to-text
  application for [Android](/wiki/android.md).
  It is available through [F-Droid](/wiki/android/f-droid.md).
  Language support depends on the speech recognition engine but include both German and English and
  many more.
  It supports multiple speech recognition engines.
  Depending on the selected engine and model, punctuation and capitalization can be generated
  automatically.
  The accuracy and processing speed depend on the model and device.
- [Sayboard](https://f-droid.org/en/packages/com.elishaazaria.sayboard/) is an offline voice input
  method for [Android](/wiki/android.md) which uses the [VOSK API](#vosk-api).
  It is available thorugh [F-Droid](/wiki/android/f-droid.md)
  Since VOSK generally does not include punctuation or capitalization, Sayboard is less suitable
  when automatically generated punctuation is required.

Some alternatives mostly for Linux systems were listed in a
[Reddit post by tuananh_org](https://www.reddit.com/r/archlinux/comments/1j77921/speech_to_text_app/).

## Text-to-Speech Programs

The following is a list of TTS programs.

- [Marmalade TTS](https://f-droid.org/packages/app.marmalade.tts/) is a text-to-speech application
  for [Android](/wiki/android.md).
  It converts written text into spoken audio.
  Language support, voice quality and offline availability depend on the speech synthesis engine and
  voices used.
  Languages may include German, English and many more.

## Model APIs

There are various APIs that are used to do speech recognition.

### VOSK API

The VOSK API mostly does not include punctuation and is not case-sensitive.
However, it is generally real-time capable.
A good source for VOSK models is [alphacephei](https://alphacephei.com/vosk/models).

For the german language the 900k model from the Tuda-DE project is recommended.
It is also available from the [corresponding GitHub page](https://github.com/uhh-lt/kaldi-tuda-de).
This model is mostly not capable of transcribing English words.

### Whisper API

The Whisper API mostly includes punctuation and is case-sensitive.
However, it is generally not real-time capable.
Many models are available on [Hugging Face](https://huggingface.co/).

A good model for the German language is the
[GGML Q5_0 quantization of primelines whisper-large-v3-turbo-german](https://huggingface.co/F1sk/whisper-large-v3-turbo-german-ggml-q5_0).
This model is also capable of transcribing some English words.
