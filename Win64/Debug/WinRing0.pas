unit WinRing0;

interface

uses Winapi.Windows;

const
{$IFDEF WIN64}
  DllLib = 'WinRing0x64.dll';
{$ELSE}
  DllLib = 'WinRing0.dll';
{$ENDIF}

type
  PBYTE = ^Byte;

  TOlsDllStatus = (OLS_DLL_NO_ERROR = 0,
                   OLS_DLL_UNSUPPORTED_PLATFORM = 1,
                   OLS_DLL_DRIVER_NOT_LOADED = 2,
                   OLS_DLL_DRIVER_NOT_FOUND = 3,
                   OLS_DLL_DRIVER_UNLOADED = 4,
                   OLS_DLL_DRIVER_NOT_LOADED_ON_NETWORK = 5,
                   OLS_DLL_UNKNOWN_ERROR = 6);

  TOlsDriverType = (OLS_DRIVER_TYPE_UNKNOWN = 0,
                    OLS_DRIVER_TYPE_WIN_9X = 1,
                    OLS_DRIVER_TYPE_WIN_NT = 2,
                    OLS_DRIVER_TYPE_WIN_NT4 = 3 { Obsolete } ,
                    OLS_DRIVER_TYPE_WIN_NT_X64 = 4,
                    OLS_DRIVER_TYPE_WIN_NT_IA64 = 5);

//  TOlsErrorPci = (OLS_ERROR_PCI_BUS_NOT_EXIST = $E0000001,
//                  OLS_ERROR_PCI_NO_DEVICE = $E0000002,
//                  OLS_ERROR_PCI_WRITE_CONFIG = $E0000003,
//                  OLS_ERROR_PCI_READ_CONFIG = $E0000004);


/////////////////////////// * WinRing0.dll * ///////////////////////////////////

//******************************************************************************
//
// DLL Information
//
//******************************************************************************

//-----------------------------------------------------------------------------
// GetDllStatus
//-----------------------------------------------------------------------------

  function GetDllStatus(): DWORD; external DllLib; // DLL Status, defined OLS_DLL_****

//-----------------------------------------------------------------------------
// GetDllVersion
//-----------------------------------------------------------------------------

  function GetDllVersion(major:    PBYTE;  // major version
                         minor:    PBYTE;  // minor version
                         revision: PBYTE;  // revision
                         release:  PBYTE): // revision
                                   DWORD; external DllLib; // DLL Version, defined OLS_VERSION

//-----------------------------------------------------------------------------
// GetDriverVersion
//-----------------------------------------------------------------------------

  function GetDriverVersion(major:    PBYTE;  // major version
                            minor:    PBYTE;  // minor version
                            revision: PBYTE;  // revision
                            release:  PBYTE): // revision
                                      DWORD; external DllLib; // Device Driver Version, defined OLS_DRIVER_VERSION

//-----------------------------------------------------------------------------
// GetDriverType
//-----------------------------------------------------------------------------

  function GetDriverType(): DWORD; external DllLib; // Device Driver Type, defined OLS_DRIVER_TYPE_****

//-----------------------------------------------------------------------------
// InitializeOls
//-----------------------------------------------------------------------------

  function InitializeOls(): BOOL; external DllLib; // TRUE: success, FALSE: failure

//-----------------------------------------------------------------------------
// DeinitializeOls
//-----------------------------------------------------------------------------

  procedure DeinitializeOls(); external DllLib;

//******************************************************************************



//******************************************************************************
//
// CPU
//
//******************************************************************************

//-----------------------------------------------------------------------------
// IsCpuid
//-----------------------------------------------------------------------------

  function IsCpuid(): BOOL; external DllLib; // TRUE: support CPUID instruction, FALSE: not support CPUID instruction

//-----------------------------------------------------------------------------
// IsMsr
//-----------------------------------------------------------------------------

  function IsMsr(): BOOL; external DllLib; // TRUE: support MSR(Model-Specific Register), FALSE: not support MSR

//-----------------------------------------------------------------------------
// IsTsc
//-----------------------------------------------------------------------------

  function IsTsc(): BOOL; external DllLib; // TRUE: support TSC(Time Stamp Counter), FALSE: not support TSC

//-----------------------------------------------------------------------------
// Rdmsr
//-----------------------------------------------------------------------------

 function Rdmsr(index: DWORD;   // MSR index
	              eax:   PDWORD;	// bit  0-31
	              edx:   PDWORD):	// bit 32-63
                       BOOL; external DllLib; // TRUE: success, FALSE: failure

//-----------------------------------------------------------------------------
// RdmsrTx
//-----------------------------------------------------------------------------

  function RdmsrTx(index:              DWORD;  // MSR index
	                 eax:                PDWORD; // bit  0-31
	                 edx:                PDWORD; // bit 32-63
                   threadAffinityMask: DWORD_PTR):
                                       BOOL; external DllLib; // TRUE: success, FALSE: failure

//-----------------------------------------------------------------------------
// RdmsrPx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function RdmsrPx(index:               DWORD;  // MSR index
	                 eax:                 PDWORD; // bit  0-31
	                 edx:                 PDWORD; // bit 32-63
                   processAffinityMask: DWORD_PTR):
                                        BOOL; external DllLib;

//-----------------------------------------------------------------------------
// Wrmsr
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function Wrmsr(index: DWORD;  // MSR index
	               eax:   DWORD;  // bit  0-31
	               edx:   DWORD): // bit 32-63
                        BOOL; external DllLib;

//-----------------------------------------------------------------------------
// WrmsrTx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function WrmsrTx(index:              DWORD; // MSR index
	                 eax:                DWORD; // bit  0-31
	                 edx:                DWORD; // bit 32-63
                   threadAffinityMask: DWORD_PTR):
                                       BOOL; external DllLib;

//-----------------------------------------------------------------------------
// WrmsrPx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function WrmsrPx(index:               DWORD; // MSR index
	                 eax:                 DWORD; // bit  0-31
	                 edx:                 DWORD; // bit 32-63
                   processAffinityMask: DWORD_PTR):
                                        BOOL; external DllLib;

//-----------------------------------------------------------------------------
// Rdpmc
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function Rdpmc(index: DWORD;   // PMC index
	               eax:   PDWORD;  // bit  0-31
	               edx:   PDWORD): // bit 32-63
                        BOOL; external DllLib;

//-----------------------------------------------------------------------------
// RdmsrTx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function RdpmcTx(index:              DWORD;  // PMC index
	                 eax:                PDWORD; // bit  0-31
	                 edx:                PDWORD; // bit 32-63
                   threadAffinityMask: DWORD_PTR):
                                       BOOL; external DllLib;

//-----------------------------------------------------------------------------
// RdmsrPx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function RdpmcPx(index:               DWORD;  // PMC index
	                 eax:                 PDWORD; // bit  0-31
	                 edx:                 PDWORD; // bit 32-63
                   processAffinityMask: DWORD_PTR):
                                        BOOL; external DllLib;

//-----------------------------------------------------------------------------
// Cpuid
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function Cpuid(index: DWORD;   // CPUID index
	               eax:   PDWORD;
                 ebx:   PDWORD;
                 ecx:   PDWORD;
	               edx:   PDWORD):
                        BOOL; external DllLib;

//-----------------------------------------------------------------------------
// CpuidTx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function CpuidTx(index:              DWORD;  // CPUID index
	                 eax:                PDWORD;
                   ebx:                PDWORD;
                   ecx:                PDWORD;
	                 edx:                PDWORD;
                   threadAffinityMask: DWORD_PTR):
                                       BOOL; external DllLib;

//-----------------------------------------------------------------------------
// CpuidPx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function CpuidPx(index:               DWORD;  // CPUID index
	                 eax:                 PDWORD;
                   ebx:                 PDWORD;
                   ecx:                 PDWORD;
	                 edx:                 PDWORD;
                   processAffinityMask: DWORD_PTR):
                                        BOOL; external DllLib;

//-----------------------------------------------------------------------------
// Rdtsc
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function Rdtsc(eax: PDWORD;  // bit  0-31
	               edx: PDWORD): // bit 32-63
                      BOOL; external DllLib;

//-----------------------------------------------------------------------------
// RdtscTx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function RdtscTx(eax:                PDWORD; // bit  0-31
	                 edx:                PDWORD; // bit 32-63
                   threadAffinityMask: DWORD_PTR):
                                       BOOL; external DllLib;

//-----------------------------------------------------------------------------
// RdtscPx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function RdtscPx(eax:                 PDWORD; // bit  0-31
	                 edx:                 PDWORD; // bit 32-63
                   processAffinityMask: DWORD_PTR):
                                        BOOL; external DllLib;

//-----------------------------------------------------------------------------
// Hlt
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function Hlt(): BOOL; external DllLib;

//-----------------------------------------------------------------------------
// HltTx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function HltTx(threadAffinityMask: DWORD_PTR): BOOL; external DllLib;

//-----------------------------------------------------------------------------
// HltPx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function HltPx(processAffinityMask: DWORD_PTR): BOOL; external DllLib;

//******************************************************************************



//******************************************************************************
//
// I/O
//
//******************************************************************************

//-----------------------------------------------------------------------------
// ReadIoPortByte
//-----------------------------------------------------------------------------
// Read Value

  function ReadIoPortByte(port: WORD): // I/O port address
                                BYTE; external DllLib;

//-----------------------------------------------------------------------------
// ReadIoPortWord
//-----------------------------------------------------------------------------
// Read Value

  function ReadIoPortWord(port: WORD): // I/O port address
                                WORD; external DllLib;

//-----------------------------------------------------------------------------
// ReadIoPortDword
//-----------------------------------------------------------------------------
// Read Value

  function ReadIoPortDword(port: WORD): // I/O port address
                                 DWORD; external DllLib;

//-----------------------------------------------------------------------------
// ReadIoPortByteEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function ReadIoPortByteEx(port:  WORD;   // I/O port address
                            value: PBYTE): // Read Value
                                   BOOL; external DllLib;

//-----------------------------------------------------------------------------
// ReadIoPortWordEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function ReadIoPortWordEx(port:  WORD;   // I/O port address
                            value: PWORD): // Read Value
                                   BOOL; external DllLib;

//-----------------------------------------------------------------------------
// ReadIoPortDwordEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function ReadIoPortDwordEx(port: WORD;    // I/O port address
                            value: PDWORD): // Read Value
                                   BOOL; external DllLib;

//-----------------------------------------------------------------------------
// WriteIoPortByte
//-----------------------------------------------------------------------------

  procedure WriteIoPortByte(port:  WORD;  // I/O port address
                            value: BYTE); // Write Value
                                          external DllLib;

//-----------------------------------------------------------------------------
// WriteIoPortWord
//-----------------------------------------------------------------------------

  procedure WriteIoPortWord(port:  WORD;  // I/O port address
                            value: WORD); // Write Value
                                          external DllLib;

//-----------------------------------------------------------------------------
// WriteIoPortDword
//-----------------------------------------------------------------------------

  procedure WriteIoPortDword(port:  WORD;   // I/O port address
                             value: DWORD); // Write Value
                                            external DllLib;

//-----------------------------------------------------------------------------
// WriteIoPortByteEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function WriteIoPortByteEx(port:  WORD;  // I/O port address
                             value: BYTE): // Write Value
                                    BOOL; external DllLib;

//-----------------------------------------------------------------------------
// WriteIoPortWordEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function WriteIoPortWordEx(port:  WORD;  // I/O port address
                             value: WORD): // Write Value
                                    BOOL; external DllLib;

//-----------------------------------------------------------------------------
// WriteIoPortDwordEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function WriteIoPortDwordEx(port:  WORD;   // I/O port address
                              value: DWORD): // Write Value
                                     BOOL; external DllLib;

//******************************************************************************



//******************************************************************************
//
// PCI
//
//******************************************************************************
//
// pciAddress
// 0-2: Function Number
// 3-7: Device Number
// 8-15: PCI Bus Number
// 16-31: Reserved
// 0xFFFFFFFF: Error

//-----------------------------------------------------------------------------
// SetPciMaxBusNo
//-----------------------------------------------------------------------------

  procedure SetPciMaxBusIndex(max: BYTE); // Max PCI Bus to Scan
                                          external DllLib;

//-----------------------------------------------------------------------------
// ReadPciConfigByte
//-----------------------------------------------------------------------------
// Read Value

  function ReadPciConfigByte(pciAddress: DWORD; // PCI Device Address
                             regAddress: BYTE): // Configuration Address 0-255
                                         BYTE; external DllLib;

//-----------------------------------------------------------------------------
// ReadPciConfigWord
//-----------------------------------------------------------------------------
// Read Value

  function ReadPciConfigWord(pciAddress: DWORD; // PCI Device Address
                             regAddress: BYTE): // Configuration Address 0-255
                                         WORD; external DllLib;

//-----------------------------------------------------------------------------
// ReadPciConfigDword
//-----------------------------------------------------------------------------
// Read Value

  function ReadPciConfigDword(pciAddress: DWORD; // PCI Device Address
                              regAddress: BYTE): // Configuration Address 0-255
                                          DWORD; external DllLib;

//-----------------------------------------------------------------------------
// ReadPciConfigByteEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function ReadPciConfigByteEx(pciAddress: DWORD;  // PCI Device Address
                               regAddress: DWORD;  // Configuration Address 0-whatever
                                    value: PBYTE): // Read Value
                                           BOOL; external DllLib;

//-----------------------------------------------------------------------------
// ReadPciConfigWordEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function ReadPciConfigWordEx(pciAddress: DWORD;  // PCI Device Address
                               regAddress: DWORD;  // Configuration Address 0-whatever
                                    value: PWORD): // Read Value
                                           BOOL; external DllLib;

//-----------------------------------------------------------------------------
// ReadPciConfigDwordEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function ReadPciConfigDwordEx(pciAddress: DWORD;   // PCI Device Address
                                regAddress: DWORD;   // Configuration Address 0-whatever
                                     value: PDWORD): // Read Value
                                            BOOL; external DllLib;

//-----------------------------------------------------------------------------
// WritePciConfigByte
//-----------------------------------------------------------------------------

  procedure WritePciConfigByte(pciAddress: DWORD; // PCI Device Address
                               regAddress: BYTE;  // Configuration Address 0-255
                                    value: BYTE); // Write Value
                                                  external DllLib;

//-----------------------------------------------------------------------------
// WritePciConfigWord
//-----------------------------------------------------------------------------

  procedure WritePciConfigWord(pciAddress: DWORD; // PCI Device Address
                               regAddress: BYTE;  // Configuration Address 0-255
                                    value: WORD); // Write Value
                                                  external DllLib;

//-----------------------------------------------------------------------------
// WritePciConfigDword
//-----------------------------------------------------------------------------

  procedure WritePciConfigDword(pciAddress: DWORD;  // PCI Device Address
                                regAddress: BYTE;   // Configuration Address 0-255
                                     value: DWORD); // Write Value
                                                    external DllLib;

//-----------------------------------------------------------------------------
// WritePciConfigByteEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function WritePciConfigByteEx(pciAddress: DWORD; // PCI Device Address
                                regAddress: DWORD; // Configuration Address 0-whatever
                                     value: BYTE): // Write Value
                                            BOOL; external DllLib;

//-----------------------------------------------------------------------------
// WritePciConfigWordEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function WritePciConfigWordEx(pciAddress: DWORD; // PCI Device Address
                                regAddress: DWORD; // Configuration Address 0-whatever
                                     value: WORD): // Write Value
                                            BOOL; external DllLib;

//-----------------------------------------------------------------------------
// WritePciConfigDwordEx
//-----------------------------------------------------------------------------
// TRUE: success, FALSE: failure

  function WritePciConfigDwordEx(pciAddress: DWORD;  // PCI Device Address
                                 regAddress: DWORD;  // Configuration Address 0-whatever
                                      value: DWORD): // Write Value
                                             BOOL; external DllLib;

//-----------------------------------------------------------------------------
// FindPciDeviceById
//-----------------------------------------------------------------------------
// pciAddress, 0xFFFFFFFF: failure

  function FindPciDeviceById(vendorId: WORD;  // Vendor ID
                             deviceId: WORD;  // Device ID
                             index:    BYTE): // Index
                                       DWORD; external DllLib;

//-----------------------------------------------------------------------------
// FindPciDeviceByClass
//-----------------------------------------------------------------------------
// pciAddress, 0xFFFFFFFF: failure

  function FindPciDeviceByClass(baseClass: BYTE;  // Base Class
                                 subClass: BYTE;  // Sub Class
                                programIf: BYTE;  // Program Interface
                                index:     BYTE): // Index
                                           DWORD; external DllLib;

//******************************************************************************


{
//******************************************************************************
//
// Memory (Special API)
//
//******************************************************************************
//
//#ifdef _PHYSICAL_MEMORY_SUPPORT

//-----------------------------------------------------------------------------
// ReadDmiMemory
//-----------------------------------------------------------------------------
// Read size(byte), 0: failure

  function ReadDmiMemory(buffer:   PBYTE;  // Buffer
                         count:    DWORD;  // Count
                         unitSize: DWORD): // Unit Size (BYTE, WORD, DWORD)
                                   DWORD; external DllLib;

//-----------------------------------------------------------------------------
// ReadPhysicalMemory
//-----------------------------------------------------------------------------
// Read size(byte), 0: failure

  function ReadPhysicalMemory(address: DWORD_PTR; // Physical Memory Address
                               buffer: PBYTE;     // Buffer
                                count: DWORD;     // Count
                             unitSize: DWORD):    // Unit Size (BYTE, WORD, DWORD)
                                       DWORD; external DllLib;

//-----------------------------------------------------------------------------
// WritePhysicalMemory
//-----------------------------------------------------------------------------
// Write size(byte), 0: failure

  function WritePhysicalMemory(address: DWORD_PTR; // Physical Memory Address
                                buffer: PBYTE;     // Buffer
                                 count: DWORD;     // Count
                              unitSize: DWORD):    // Unit Size (BYTE, WORD, DWORD)
                                        DWORD; external DllLib;

////////////////////////////////////////////////////////////////////////////////
}

type
  TDLL = class
  private
    Status: Boolean;
  public
    constructor Create();
    destructor  Destroy(); override;

    function IsLoaded(): Boolean;
    function GetStatus(): DWORD;
    function GetVersion(var maj, min, rev, rel: byte): DWORD;

    function GetDrvVersion(var maj, min, rev, rel: byte): DWORD;
    function GetDrvType(): DWORD;
  end;


  TPort = class
  private

  public
    constructor Create();
    destructor  Destroy(); override;


    function  ReadByte (const port: WORD): byte;
    function  ReadWord (const port: WORD): WORD;
    function  ReadDword(const port: WORD): DWORD;
    function  ReadByteEx (const port: WORD; const val: byte):  Boolean;
    function  ReadWordEx (const port: WORD; const val: WORD):  Boolean;
    function  ReadDwordEx(const port: WORD; const val: DWORD): Boolean;

    procedure WriteByte (const port: WORD; const val: byte);
    procedure WriteWord (const port: WORD; const val: WORD);
    procedure WriteDword(const port: WORD; const val: DWORD);
    function  WriteByteEx (const port: WORD; const val: byte):  Boolean;
    function  WriteWordEx (const port: WORD; const val: WORD):  Boolean;
    function  WriteDWordEx(const port: WORD; const val: DWORD): Boolean;
  end;


  TPCI = class
  private

  public
    constructor Create();
    destructor  Destroy(); override;

    procedure SetMaxBusIndex(const max: byte);
    function  FindDeviceById(const vendorId, deviceId: WORD; const index: byte): DWORD;
    function  FindDeviceByClass(const baseClass, subClass, programIf, index: byte): DWORD;

    function  ReadConfigByte (const pciAddr: DWORD; const regAddr: byte): byte;
    function  ReadConfigWord (const pciAddr: DWORD; const regAddr: byte): WORD;
    function  ReadConfigDWord(const pciAddr: DWORD; const regAddr: byte): DWORD;
    function  ReadConfigByteEx (const pciAddr, regAddr: DWORD; const val: byte):  Boolean;
    function  ReadConfigWordEx (const pciAddr, regAddr: DWORD; const val: WORD):  Boolean;
    function  ReadConfigDWordEx(const pciAddr, regAddr: DWORD; const val: DWORD): Boolean;

    procedure WriteConfigByte (const pciAddr: DWORD; const regAddr: byte; const value: byte);
    procedure WriteConfigWord (const pciAddr: DWORD; const regAddr: byte; const value: WORD);
    procedure WriteConfigDWord(const pciAddr: DWORD; const regAddr: byte; const value: DWORD);
    function  WriteConfigByteEx (const pciAddr, regAddr: DWORD; const val: BYTE):  Boolean;
    function  WriteConfigWordEx (const pciAddr, regAddr: DWORD; const val: WORD):  Boolean;
    function  WriteConfigDWordEx(const pciAddr, regAddr: DWORD; const val: DWORD): Boolean;
  end;

  TCPU = class
  private

  public
    constructor Create();
    destructor  Destroy(); override;

    function IsId():  Boolean;
    function GetId  (const index, eax, ebx, ecx, edx: DWORD): Boolean;
    function GetIdTx(const index, eax, ebx, ecx, edx, threadAffinityMask:  DWORD): Boolean;
    function GetIdPx(const index, eax, ebx, ecx, edx, processAffinityMask: DWORD): Boolean;

    function IsMSR(): Boolean;
    function IsTSC(): Boolean;

    function GetRdmsr  (const index, eax, edx: DWORD): Boolean;
    function GetRdmsrTx(const index, eax, edx, threadAffinityMask:  DWORD): Boolean;
    function GetRdmsrPx(const index, eax, edx, processAffinityMask: DWORD): Boolean;

    function GetWrmsr  (const index, eax, edx: DWORD): Boolean;
    function GetWrmsrTx(const index, eax, edx, threadAffinityMask:  DWORD): Boolean;
    function GetWrmsrPx(const index, eax, edx, processAffinityMask: DWORD): Boolean;

    function GetRdpmc  (const index, eax, edx: DWORD): Boolean;
    function GetRdpmcTx(const index, eax, edx, threadAffinityMask:  DWORD): Boolean;
    function GetRdpmcPx(const index, eax, edx, processAffinityMask: DWORD): Boolean;

    function GetRdtsc  (const eax, edx: DWORD): Boolean;
    function GetRdtscTx(const eax, edx, threadAffinityMask:  DWORD): Boolean;
    function GetRdtscPx(const eax, edx, processAffinityMask: DWORD): Boolean;

    function GetHlt(): Boolean;
    function GetHltTx(const threadAffinityMask:  DWORD): Boolean;
    function GetHltPx(const processAffinityMask: DWORD): Boolean;
  end;

{
  TMemory = class
  public
    constructor Create();
    destructor  Destroy(); override;

    function ReadDmi                             (const buffer: byte; const count, uSize: DWORD): DWORD;
    function ReadPhysical (const addr: DWORD_PTR; const buffer: byte; const count, uSize: DWORD): DWORD;
    function WritePhysical(const addr: DWORD_PTR; const buffer: byte; const count ,uSize: DWORD): DWORD;
  end;
}

  TWinRing0 = class
  public
    DLL:  TDLL;
    Port: TPort;
    PCI:  TPCI;
    CPU:  TCPU;
//    Memory: TMemory;

    constructor Create();
    destructor  Destroy(); override;
  end;


implementation


{ TWinRing }

constructor TWinRing0.Create;
begin
  inherited Create();

  DLL  := TDLL.Create();
  Port := TPort.Create();
  PCI  := TPCI.Create();
  CPU  := TCPU.Create();
//  Memory := TMemory.Create();
end;

destructor TWinRing0.Destroy;
begin
//  Memory.Free();
  CPU.Free();
  PCI.Free();
  Port.Free();
  DLL.Free();

  inherited;
end;



{ TDLL }

constructor TDLL.Create;
begin
  inherited Create();

  Status := InitializeOls();
end;

destructor TDLL.Destroy;
begin
  DeinitializeOls();

  inherited;
end;


function TDLL.IsLoaded: Boolean;
begin
  Result := Status;
end;

function TDLL.GetStatus: DWORD;
begin
  Result := GetDllStatus();
end;

function TDLL.GetVersion(var maj, min, rev, rel: byte): DWORD;
begin
  Result := GetDllVersion(@maj, @min, @rev, @rel);
end;


function TDLL.GetDrvVersion(var maj, min, rev, rel: byte): DWORD;
begin
  Result := GetDriverVersion(@maj, @min, @rev, @rel);
end;

function TDLL.GetDrvType: DWORD;
begin
  Result := GetDriverType();
end;



{ TPort }

constructor TPort.Create;
begin
  inherited Create();
end;

destructor TPort.Destroy;
begin

  inherited;
end;


function TPort.ReadByte(const port: WORD): byte;
begin
  Result := ReadIoPortByte(port);
end;

function TPort.ReadWord(const port: WORD): WORD;
begin
  Result := ReadIoPortWord(port);
end;

function TPort.ReadDword(const port: WORD): DWORD;
begin
  Result := ReadIoPortDword(port);
end;

function TPort.ReadByteEx(const port: WORD; const val: byte): Boolean;
begin
  Result := ReadIoPortByteEx(port, @val);
end;

function TPort.ReadWordEx(const port: WORD; const val: WORD): Boolean;
begin
  Result := ReadIoPortWordEx(port, @val);
end;

function TPort.ReadDwordEx(const port: WORD; const val: DWORD): Boolean;
begin
  Result := ReadIoPortDwordEx(port, @val);
end;


procedure TPort.WriteByte(const port: WORD; const val: byte);
begin
  WriteIoPortByte(port, val);
end;

procedure TPort.WriteWord(const port: WORD; const val: WORD);
begin
  WriteIoPortWord(port, val);
end;

procedure TPort.WriteDword(const port: WORD; const val: DWORD);
begin
  WriteIoPortDword(port, val);
end;

function TPort.WriteByteEx(const port: WORD; const val: byte): Boolean;
begin
  Result := WriteIoPortByteEx(port, val);
end;

function TPort.WriteWordEx(const port: WORD; const val: WORD): Boolean;
begin
  Result := WriteIoPortWordEx(port, val);
end;

function TPort.WriteDWordEx(const port: WORD; const val: DWORD): Boolean;
begin
  Result := WriteIoPortDWordEx(port, val);
end;



{ TPCI }

constructor TPCI.Create;
begin
  inherited Create();
end;

destructor TPCI.Destroy;
begin

  inherited;
end;


procedure TPCI.SetMaxBusIndex(const max: byte);
begin
  SetPciMaxBusIndex(max);
end;

function TPCI.FindDeviceById(const vendorId, deviceId: WORD; const index: byte): DWORD;
begin
  Result := FindPciDeviceById(vendorId, deviceId, index);
end;

function TPCI.FindDeviceByClass(const baseClass, subClass, programIf, index: byte): DWORD;
begin
  Result := FindPciDeviceByClass(baseClass, subClass, programIf, index);
end;


function TPCI.ReadConfigByte(const pciAddr: DWORD; const regAddr: byte): byte;
begin
  Result := ReadPciConfigByte(pciAddr, regAddr);
end;

function TPCI.ReadConfigWord(const pciAddr: DWORD; const regAddr: byte): WORD;
begin
  Result := ReadPciConfigWord(pciAddr, regAddr);
end;

function TPCI.ReadConfigDWord(const pciAddr: DWORD; const regAddr: byte): DWORD;
begin
  Result := ReadPciConfigDWord(pciAddr, regAddr);
end;

function TPCI.ReadConfigByteEx(const pciAddr, regAddr: DWORD; const val: byte): Boolean;
begin
  Result := ReadPciConfigByteEx(pciAddr, regAddr, @val);
end;

function TPCI.ReadConfigWordEx(const pciAddr, regAddr: DWORD; const val: WORD): Boolean;
begin
  Result := ReadPciConfigWordEx(pciAddr, regAddr, @val);
end;

function TPCI.ReadConfigDWordEx(const pciAddr, regAddr: DWORD; const val: DWORD): Boolean;
begin
  Result := ReadPciConfigDWordEx(pciAddr, regAddr, @val);
end;


procedure TPCI.WriteConfigByte(const pciAddr: DWORD; const regAddr: byte; const value: byte);
begin
  WritePciConfigByte(pciAddr, regAddr, value);
end;

procedure TPCI.WriteConfigWord(const pciAddr: DWORD; const regAddr: byte; const value: WORD);
begin
  WritePciConfigWord(pciAddr, regAddr, value);
end;

procedure TPCI.WriteConfigDWord(const pciAddr: DWORD; const regAddr: byte; const value: DWORD);
begin
  WritePciConfigDWord(pciAddr, regAddr, value);
end;

function TPCI.WriteConfigByteEx(const pciAddr, regAddr: DWORD; const val: BYTE): Boolean;
begin
  Result := WritePciConfigByteEx(pciAddr, regAddr, val);
end;

function TPCI.WriteConfigWordEx(const pciAddr, regAddr: DWORD; const val: WORD): Boolean;
begin
  Result := WritePciConfigWordEx(pciAddr, regAddr, val);
end;

function TPCI.WriteConfigDWordEx(const pciAddr, regAddr: DWORD; const val: DWORD): Boolean;
begin
  Result := WritePciConfigDwordEx(pciAddr, regAddr, val);
end;



{ TCPU }

constructor TCPU.Create;
begin
  inherited Create();
end;

destructor TCPU.Destroy;
begin

  inherited;
end;


function TCPU.IsId: Boolean;
begin
  Result := IsCpuid();
end;

function TCPU.GetId(const index, eax, ebx, ecx, edx: DWORD): Boolean;
begin
  Result := Cpuid(index, @eax, @ebx, @ecx, @edx);
end;

function TCPU.GetIdTx(const index, eax, ebx, ecx, edx, threadAffinityMask: DWORD): Boolean;
begin
  Result := CpuidTx(index, @eax, @ebx, @ecx, @edx, threadAffinityMask);
end;

function TCPU.GetIdPx(const index, eax, ebx, ecx, edx, processAffinityMask: DWORD): Boolean;
begin
  Result := CpuidPx(index, @eax, @ebx, @ecx, @edx, processAffinityMask);
end;


function TCPU.IsMSR: Boolean;
begin
  Result := IsMsr();
end;

function TCPU.IsTSC: Boolean;
begin
  Result := IsTsc();
end;


function TCPU.GetRdmsr(const index, eax, edx: DWORD): Boolean;
begin
  Result := Rdmsr(index, @eax, @edx);
end;

function TCPU.GetRdmsrTx(const index, eax, edx, threadAffinityMask: DWORD): Boolean;
begin
  Result := RdmsrTx(index, @eax, @edx, threadAffinityMask);
end;

function TCPU.GetRdmsrPx(const index, eax, edx, processAffinityMask: DWORD): Boolean;
begin
  Result := RdmsrTx(index, @eax, @edx, processAffinityMask);
end;


function TCPU.GetWrmsr(const index, eax, edx: DWORD): Boolean;
begin
  Result := Wrmsr(index, eax, edx);
end;

function TCPU.GetWrmsrTx(const index, eax, edx, threadAffinityMask: DWORD): Boolean;
begin
  Result := WrmsrTx(index, eax, edx, threadAffinityMask);
end;

function TCPU.GetWrmsrPx(const index, eax, edx, processAffinityMask: DWORD): Boolean;
begin
  Result := WrmsrPx(index, eax, edx, processAffinityMask);
end;

function TCPU.GetRdpmc(const index, eax, edx: DWORD): Boolean;
begin
  Result := Rdpmc(index, @eax, @edx);
end;

function TCPU.GetRdpmcTx(const index, eax, edx, threadAffinityMask: DWORD): Boolean;
begin
  Result := RdpmcTx(index, @eax, @edx, threadAffinityMask);
end;

function TCPU.GetRdpmcPx(const index, eax, edx, processAffinityMask: DWORD): Boolean;
begin
  Result := RdpmcPx(index, @eax, @edx, processAffinityMask);
end;


function TCPU.GetRdtsc(const eax, edx: DWORD): Boolean;
begin
  Result := Rdtsc(@eax, @edx);
end;

function TCPU.GetRdtscTx(const eax, edx, threadAffinityMask: DWORD): Boolean;
begin
  Result := RdtscTx(@eax, @edx, threadAffinityMask);
end;

function TCPU.GetRdtscPx(const eax, edx, processAffinityMask: DWORD): Boolean;
begin
  Result := RdtscPx(@eax, @edx, processAffinityMask);
end;


function TCPU.GetHlt: Boolean;
begin
  Result := Hlt();
end;

function TCPU.GetHltTx(const threadAffinityMask: DWORD): Boolean;
begin
  Result := HltTx(threadAffinityMask);
end;

function TCPU.GetHltPx(const processAffinityMask: DWORD): Boolean;
begin
  Result := HltPx(processAffinityMask);
end;



{ TMemory }
{
constructor TMemory.Create;
begin
  inherited Create();
end;

destructor TMemory.Destroy;
begin

  inherited;
end;


function TMemory.ReadDmi(const buffer: byte; const count, uSize: DWORD): DWORD;
begin
  Result := ReadDmiMemory(@buffer, count, uSize);
end;

function TMemory.ReadPhysical(const addr: DWORD_PTR; const buffer: byte; const count, uSize: DWORD): DWORD;
begin
  Result := ReadPhysicalMemory(addr, @buffer, count, uSize);
end;

function TMemory.WritePhysical(const addr: DWORD_PTR; const buffer: byte; const count, uSize: DWORD): DWORD;
begin
  Result := WritePhysicalMemory(addr, @buffer, count, uSize);
end;
}


end.
