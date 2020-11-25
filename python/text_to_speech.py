import io
import pygame
from gtts import gTTS
import pyttsx3


def speak(text):
    engine = pyttsx3.init()
    engine.say(text)
    engine.runAndWait()

if __name__ == "__main__":
    print("What should I say?")
    text = input(" >> ")
    speak(text)

