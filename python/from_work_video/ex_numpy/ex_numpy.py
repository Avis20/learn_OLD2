import librosa
import numpy as np

if __name__ == '__main__':
    f_name = "/home/avis/learn/python/from_work_video/ex_numpy/32_bit_float.WAV"
    # sr = simple rate
    audio_native, sr = librosa.load(f_name, sr=48000, mono=False)

    left, right = audio_native
    precents = (1, 5, 10, 25, 50, 75, 95, 99)
    left_stat = np.percentile(np.abs(left), precents)
    print(dict(zip(precents, left_stat)))

