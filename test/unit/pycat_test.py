#!/usr/bin/env python
import os, sys
sys.path.append(os.path.realpath(__file__ + '/../../../lib'))

import unittest
import pycat


class PycatTest(unittest.TestCase):
    def test_assert(self):
        self.assertEqual('Hello World', pycat.message())


if __name__ == '__main__':
    unittest.main()
