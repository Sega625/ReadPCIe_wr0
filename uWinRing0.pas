unit uWinRing0;

interface

uses Winapi.Windows, Structs;




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
