unit PlaybackThread;

interface
Uses Classes, Grids, StdCtrls, Controls, Windows, Messages, SysUtils, forms,Obj_ThreadEx;


type

{ TPlaybackThread }

  TPlaybackThread = class(TObject)
  private
    FThread:TThreadEx;
  protected

  public
    constructor Create;
    destructor Destroy; override;
  published

  end;



implementation

{ TPlaybackThread }

constructor TPlaybackThread.Create;
begin
 //FThread:=TThreadEx.Create();

end;

destructor TPlaybackThread.Destroy;
begin

  inherited;
end;

end.
