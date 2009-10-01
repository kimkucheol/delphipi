{**
 DelphiPI (Delphi Package Installer)
 Author  : ibrahim dursun (t-hex) thex [at] thexpot ((dot)) net
 License : GNU General Public License 2.0
**}
unit PackageInfo;
interface
uses  Classes, StrUtils, TreeModel;

type
  TPackageStatus = (psNone, psCompiling, psInstalling, psSuccess, psError);
  TPackageInfo = class(TInterfacedObject, INode)
  private
    fRequiredPackageList: TStringList;
    fContainedFileList : TStringList;
    FDescription : String;
    FSuffix : String;
    FRunOnly : Boolean;
    FPackageName : String;
    fFileName: String;
    fStatus: TPackageStatus;
  public
    constructor Create;overload;
    constructor Create(const packageName:string);overload;
    destructor Destroy; override;
    function DependsOn(const package: TPackageInfo): Boolean; overload;
    function GetData: TObject;
    function GetNodePath: string;
    function GetDisplayName: string;
    
    property Description: string read FDescription write FDescription;
    property PackageName: string read FPackageName write FPackageName;
    property RunOnly: Boolean read FRunOnly write FRunOnly;
    property Suffix: string read FSuffix write FSuffix;
    property RequiredPackageList: TStringList read fRequiredPackageList;
    property ContainedFileList: TStringList read fContainedFileList;
    property FileName: string read fFileName write fFileName;
    property Status: TPackageStatus read fStatus write fStatus;
  end;

implementation
uses  SysUtils, contnrs, JclStrings;

constructor TPackageInfo.Create;
begin
  fRequiredPackageList := TStringList.Create;
  fContainedFileList := TStringList.Create;
end;

destructor TPackageInfo.Destroy;
begin
  FreeAndNil(fRequiredPackageList);
  FreeAndNil(fContainedFileList);
  inherited;
end;

function TPackageInfo.GetData: TObject;
begin
  Result := nil;
end;

function TPackageInfo.GetDisplayName: string;
begin
  Result := Self.PackageName;
end;

function TPackageInfo.GetNodePath: string;
var
  i: integer;
begin
  Result := self.FileName;
  i := Pos(':', Result);
  if i <> 0 then
    Result := StrRestOf(Result, i+2);
end;

constructor TPackageInfo.Create(const packageName: string);
begin
  Create;
  FPackageName := packageName;
end;

function TPackageInfo.DependsOn(const package: TPackageInfo): Boolean;
begin
  assert(package <> nil);
  Result := RequiredPackageList.IndexOf(package.packageName) > -1;
end;


end.
