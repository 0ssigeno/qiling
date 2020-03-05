#!/usr/bin/env python3
# 
# Cross Platform and Multi Architecture Advanced Binary Emulation Framework
# Built on top of Unicorn emulator (www.unicorn-engine.org) 
import sys

sys.path.append("..")
from qiling import *

if __name__ == "__main__":
    ql = Qiling(["samples/emotet_1.exe"], "rootfs/x86_windows", output="debug")
    ql.run()
