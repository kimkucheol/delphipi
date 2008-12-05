{**
 DelphiPI (Delphi Package Installer)
 Author  : ibrahim dursun (t-hex) thex [at] thexpot ((dot)) net
 License : GNU General Public License 2.0
**}
unit CompileInfo;

interface
uses Classes, SysUtils, PackageInfo, PackageList;
type

  TCompileInfo = class
  private
    FPackageFolders : TStringList;
    FSourceFolders  : TStringList;
    FHelpFolders    : TStringList;
    FBaseFolder: String;
    function getHelpFolders: TStringList;
    function getPackageFolders: TStringList;
    function getSourceFolders: TStringList;
  protected
  public
    constructor Create(const baseFolder:String);
    destructor Destroy; override;
    property BaseFolder: String read FBaseFolder;
    property PackageFolders: TStringList read getPackageFolders;
    property SourceFolders: TStringList read getSourceFolders;
    property HelpFolders: TStringList read getHelpFolders;
  end;

implementation
uses contnrs;
{ TCompileInfo }

constructor TCompileInfo.Create(const baseFolder:String);
begin
  FBaseFolder := baseFolder;
  FPackageFolders := TStringList.Create;
  FSourceFolders := TStringList.Create;
  FHelpFolders := TStringList.Create;
end;

destructor TCompileInfo.Destroy;
begin
  FPackageFolders.Free;
  FSourceFolders.Free;
  FHelpFolders.Free;
  inherited;
end;

function TCompileInfo.getHelpFolders: TStringList;
begin
  Result := FHelpFolders;
end;

function TCompileInfo.getPackageFolders: TStringList;
begin
  Result := FPackageFolders;
end;

function TCompileInfo.getSourceFolders: TStringList;
begin
  Result := FSourceFolders;
end;

end.
