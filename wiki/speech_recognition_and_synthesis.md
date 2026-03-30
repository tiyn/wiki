# Speech Recognition and Synthesis

Speech recognition describes the process of understanding and interpreting spoken language.
The most common form of this is speech-to-text (STT) programs, that convert spoken language into
text.
On the other hand speech synthesis describes the artificial production of human speech.
A Text-to-speech (TTS) program is one, that converts an input text to speech.

## Speech-to-Text Programs

The following is a list of STT programs.

- [Nerd Dictation](/wiki/linux/nerd-dictation.md) is a real-time offline speech recognition
    software for [Linux](/wiki/linux.md)-based operating systems which uses the
    [VOSK API](#vosk-api).
- [Whisper CLI](/wiki/linux/whisper-cli.md) is a non-real-time offline speech transcription
    software for [Linux](/wiki/linux.md)-based operating systems which uses the
    [Whisper API](#whisper-api).

Some alternatives mostly for Linux systems were listed in a
[Reddit post by tuananh_org](https://www.reddit.com/r/archlinux/comments/1j77921/speech_to_text_app/).

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
