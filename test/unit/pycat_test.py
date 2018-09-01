#!/usr/bin/env python
import os, sys
sys.path.append(os.path.realpath(__file__ + '/../../../lib'))

import unittest
import pycat
import StringIO


class PycatTest(unittest.TestCase):
    def setUp(self):
        self.i = StringIO.StringIO()
        self.o = StringIO.StringIO()

    def tearDown(self):
        self.i.close()
        self.o.close()

    def test_copy_stream(self):
        self.i.write('One\n')
        self.i.write('Two\n')
        self.i.seek(0)

        pycat.copy_stream(self.i, self.o)
        self.assertEqual('One\nTwo\n', self.o.getvalue())

    def test_copy_stream_in_arbitrary_chunks(self):
        self.i.write('One\n')
        self.i.write('Two\n')
        self.i.seek(0)

        pycat.copy_stream(self.i, self.o, chuck_size=3)
        self.assertEqual('One\nTwo\n', self.o.getvalue())
        self.assertNotEqual(0, len(self.o.getvalue()) % 3)


if __name__ == '__main__':
    unittest.main()
