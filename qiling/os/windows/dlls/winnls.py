from qiling.os.windows.fncc import *
from qiling.os.fncc import *

# int GetLocaleInfoA(
#   LCID   Locale,
#   LCTYPE LCType,
#   LPSTR  lpLCData,
#   int    cchData
# );
@winapi(cc=STDCALL, params={
    "Locale": INT,
    "LCType": INT,
    "lpLCData": POINTER,
    "cchData": INT
})
def hook_GetLocaleInfoA(ql, address, params):
    pass