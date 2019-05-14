# -*- coding: utf-8 -*-


class FakeMemCache(object):
    def __init__(self):
        self.data = {}

    def get(self, key):
        return self.data.get(key, '')

    def set(self, key, val, time=0, min_compress_len=0, noreply=False):
        self.data[key] = val

    def delete(self, key, time=None, noreply=False):
        if key in self.data:
            del self.data[key]

    def remove(self, key):
        self.delete(key)

    def replace(self, key, val, time=0, min_compress_len=0, noreply=False):
        self.set(key, val)
